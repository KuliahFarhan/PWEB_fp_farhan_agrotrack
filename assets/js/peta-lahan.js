(function () {
  const apiUrl = "../../api/lahan-map.php";
  const fallbackCenter = [-7.2575, 112.7521];

  const state = {
    map: null,
    drawnItems: null,
    polygonLayer: null,
    markerLayer: null,
    polygonGeometry: null,
    areaMeter: 0,
    center: null,
    selectedLahan: null,
    hasLahan: false,
  };

  const el = {
    select: document.getElementById("lahanSelect"),
    map: document.getElementById("fieldMap"),
    areaMeter: document.getElementById("areaMeter"),
    areaHectare: document.getElementById("areaHectare"),
    centerLat: document.getElementById("centerLat"),
    centerLng: document.getElementById("centerLng"),
    preview: document.getElementById("polygonPreview"),
    save: document.getElementById("savePolygonBtn"),
    reset: document.getElementById("resetPolygonBtn"),
    hint: document.getElementById("mapHint"),
  };

  function toast(message, type) {
    const existing = document.querySelector(".toast-lite");
    if (existing) existing.remove();

    const node = document.createElement("div");
    node.className = "toast-lite";
    node.style.background = type === "error" ? "#8f2d2a" : "#103f31";
    node.textContent = message;
    document.body.appendChild(node);
    setTimeout(() => node.remove(), 3000);
  }

  function formatNumber(value, digits) {
    return new Intl.NumberFormat("id-ID", {
      maximumFractionDigits: digits,
      minimumFractionDigits: digits,
    }).format(value);
  }

  function updateMetrics() {
    const hectare = state.areaMeter / 10000;
    el.areaMeter.textContent = `${formatNumber(state.areaMeter, 2)} m\u00b2`;
    el.areaHectare.textContent = `${formatNumber(hectare, 4)} ha`;
    el.centerLat.textContent = state.center ? state.center.lat.toFixed(7) : "-";
    el.centerLng.textContent = state.center ? state.center.lng.toFixed(7) : "-";
    el.preview.textContent = state.polygonGeometry ? JSON.stringify(state.polygonGeometry.coordinates, null, 2) : "Belum ada polygon.";
    el.save.disabled = !state.hasLahan || !state.polygonGeometry || state.areaMeter <= 0;
    el.reset.disabled = !state.hasLahan;
  }

  function clearMapLayers() {
    state.drawnItems.clearLayers();
    state.polygonLayer = null;
    state.markerLayer = null;
    state.polygonGeometry = null;
    state.areaMeter = 0;
    state.center = null;
    updateMetrics();
  }

  function addCenterMarker(lat, lng) {
    if (state.markerLayer) {
      state.drawnItems.removeLayer(state.markerLayer);
    }

    state.markerLayer = L.marker([lat, lng]);
    const data = state.selectedLahan || {};
    const luasHa = state.areaMeter > 0 ? `${formatNumber(state.areaMeter / 10000, 4)} ha` : `${formatNumber(Number(data.luas || 0), 2)} ha`;
    state.markerLayer.bindPopup(`
      <strong>${escapeHtml(data.nama_lahan || "Titik tengah lahan")}</strong><br>
      Luas: ${luasHa}<br>
      Komoditas: ${escapeHtml(data.komoditas || "-")}<br>
      Status: ${escapeHtml(data.status || "-")}
    `).openPopup();
    state.drawnItems.addLayer(state.markerLayer);
    state.center = { lat, lng };
  }

  function escapeHtml(value) {
    return String(value)
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function setPolygonFromGeometry(geometry, fitBounds) {
    if (!geometry || geometry.type !== "Polygon") return;

    if (state.polygonLayer) {
      state.drawnItems.removeLayer(state.polygonLayer);
    }

    const geoJsonLayer = L.geoJSON(geometry, {
      style: {
        color: "#0f6b4f",
        weight: 3,
        fillColor: "#c9f2de",
        fillOpacity: 0.35,
      },
    });

    const layers = geoJsonLayer.getLayers();
    state.polygonLayer = layers[0];
    state.drawnItems.addLayer(state.polygonLayer);
    state.polygonGeometry = geometry;
    state.areaMeter = turf.area({ type: "Feature", properties: {}, geometry });

    const centroid = turf.centroid({ type: "Feature", properties: {}, geometry });
    const [lng, lat] = centroid.geometry.coordinates;
    addCenterMarker(lat, lng);

    if (fitBounds) {
      state.map.fitBounds(state.polygonLayer.getBounds(), { padding: [24, 24] });
    }

    updateMetrics();
  }

  async function requestJson(url, options) {
    const response = await fetch(url, {
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      ...options,
    });

    const payload = await response.json().catch(() => ({}));

    if (!response.ok || payload.ok === false) {
      throw new Error(payload.message || "Request gagal.");
    }

    return payload;
  }

  async function loadLahanOptions() {
    try {
      const payload = await requestJson(apiUrl);
      const rows = payload.data || [];
      state.hasLahan = rows.length > 0;

      if (rows.length > 0) {
        const requestedLahan = new URLSearchParams(window.location.search).get("lahan_id");
        el.select.disabled = false;
        el.select.innerHTML = rows
          .map((row) => `<option value="${row.id}">${escapeHtml(row.nama_lahan)} - ${escapeHtml(row.komoditas || "Tanpa komoditas")}</option>`)
          .join("");
        if (requestedLahan && rows.some((row) => String(row.id) === requestedLahan)) {
          el.select.value = requestedLahan;
        }
        await loadSelectedPolygon();
      } else {
        el.select.disabled = true;
        el.select.innerHTML = '<option value="">Belum ada lahan. Tambahkan di menu Data Lahan.</option>';
        el.hint.textContent = "Buat data lahan terlebih dahulu, lalu kembali ke peta untuk menggambar dan menyimpan polygon.";
        updateMetrics();
        toast("Belum ada data lahan untuk akun ini.", "error");
      }
    } catch (error) {
      el.hint.textContent = "API peta belum aktif. Jalankan via PHP server dan pastikan migrasi database sudah dijalankan.";
      toast(error.message, "error");
    }
  }

  async function loadSelectedPolygon() {
    const lahanId = el.select.value;
    if (!lahanId) return;

    clearMapLayers();

    try {
      const payload = await requestJson(`${apiUrl}?lahan_id=${encodeURIComponent(lahanId)}`);
      const data = payload.data;
      state.selectedLahan = data;

      if (data.polygon_area) {
        setPolygonFromGeometry(data.polygon_area, true);
        toast(`Polygon ${data.nama_lahan} berhasil dimuat.`);
      } else {
        state.map.setView(fallbackCenter, 13);
        el.hint.textContent = "Pilih tool polygon di kiri peta, gambar batas lahan, lalu klik Simpan Polygon.";
      }
    } catch (error) {
      toast(error.message, "error");
    }
  }

  async function savePolygon() {
    if (!state.polygonGeometry || !state.center || state.areaMeter <= 0) {
      toast("Gambar polygon lahan terlebih dahulu.", "error");
      return;
    }
    const lahanId = Number(el.select.value);
    if (!state.hasLahan || !lahanId) {
      toast("Pilih atau tambahkan data lahan dulu sebelum menyimpan polygon.", "error");
      return;
    }

    try {
      const payload = await requestJson(apiUrl, {
        method: "POST",
        body: JSON.stringify({
          lahan_id: lahanId,
          latitude: state.center.lat,
          longitude: state.center.lng,
          polygon_area: state.polygonGeometry,
          luas_lahan: state.areaMeter,
        }),
      });

      toast(payload.message || "Polygon berhasil disimpan.");
    } catch (error) {
      toast(error.message, "error");
    }
  }

  async function resetPolygon() {
    if (!el.select.value) return;

    const confirmed = window.confirm("Reset polygon untuk lahan ini?");
    if (!confirmed) return;

    try {
      const payload = await requestJson(`${apiUrl}?lahan_id=${encodeURIComponent(el.select.value)}`, {
        method: "DELETE",
      });
      clearMapLayers();
      toast(payload.message || "Polygon berhasil direset.");
    } catch (error) {
      toast(error.message, "error");
    }
  }

  function initMap() {
    if (!el.map || !window.L || !window.turf) return;

    state.map = L.map("fieldMap", {
      zoomControl: true,
      scrollWheelZoom: true,
    }).setView(fallbackCenter, 13);

    const osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 20,
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    }).addTo(state.map);

    const satellite = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", {
      maxZoom: 20,
      attribution: "Tiles &copy; Esri",
    });

    L.control.layers({
      "Peta biasa": osm,
      "Peta satelit": satellite,
    }).addTo(state.map);

    state.drawnItems = new L.FeatureGroup();
    state.map.addLayer(state.drawnItems);

    const drawControl = new L.Control.Draw({
      draw: {
        polygon: {
          allowIntersection: false,
          showArea: true,
          shapeOptions: {
            color: "#0f6b4f",
            weight: 3,
            fillColor: "#c9f2de",
            fillOpacity: 0.35,
          },
        },
        marker: true,
        polyline: false,
        rectangle: false,
        circle: false,
        circlemarker: false,
      },
      edit: {
        featureGroup: state.drawnItems,
        remove: false,
      },
    });

    state.map.addControl(drawControl);

    state.map.on(L.Draw.Event.CREATED, (event) => {
      const layer = event.layer;

      if (event.layerType === "marker") {
        if (state.markerLayer) state.drawnItems.removeLayer(state.markerLayer);
        state.markerLayer = layer;
        state.drawnItems.addLayer(layer);
        const latLng = layer.getLatLng();
        state.center = { lat: latLng.lat, lng: latLng.lng };
        updateMetrics();
        toast("Marker lokasi lahan dipasang.");
        return;
      }

      if (event.layerType === "polygon") {
        const feature = layer.toGeoJSON();
        setPolygonFromGeometry(feature.geometry, false);
        toast("Polygon digambar. Cek luas lalu klik Simpan Polygon.");
      }
    });

    state.map.on(L.Draw.Event.EDITED, () => {
      if (!state.polygonLayer) return;
      const feature = state.polygonLayer.toGeoJSON();
      setPolygonFromGeometry(feature.geometry, false);
      toast("Polygon diperbarui. Jangan lupa simpan.");
    });

    el.select.addEventListener("change", loadSelectedPolygon);
    el.save.addEventListener("click", savePolygon);
    el.reset.addEventListener("click", resetPolygon);
    updateMetrics();
    loadLahanOptions();
  }

  document.addEventListener("DOMContentLoaded", initMap);
})();
