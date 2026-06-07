document.addEventListener("DOMContentLoaded", () => {
  const mapElement = document.querySelector("[data-leaflet-map]");

  if (!mapElement || typeof L === "undefined") {
    document.querySelectorAll("[data-map-placeholder]").forEach((map) => {
      map.setAttribute("aria-label", "Leaflet map placeholder");
    });
    return;
  }

  const select = document.querySelector("[data-map-lahan-select]");
  const emptyState = document.querySelector("[data-map-empty]");
  const detail = document.querySelector("[data-map-detail]");
  const instruction = document.querySelector("[data-map-instruction]");
  const alertBox = document.querySelector("[data-map-alert]");
  const saveButton = document.querySelector("[data-map-save]");
  const freehandButton = document.querySelector("[data-map-freehand]");
  const resetButton = document.querySelector("[data-map-reset]");

  const endpoints = {
    list: "../../app/api/lahan.php",
    updateMap: "../../app/actions/lahan/update-map.php",
  };

  const defaultCenter = [-7.257472, 112.75209];
  const map = L.map(mapElement).setView(defaultCenter, 10);
  const hasLeafletDraw = Boolean(L.Control?.Draw && L.Draw?.Event);
  let lahanList = [];
  let selectedLahan = null;
  let marker = null;
  let polygonLayer = null;
  let markerLatLng = null;
  let polygonLatLngs = [];
  let isFreehandMode = false;
  let isFreehandDrawing = false;
  let freehandPoints = [];
  let freehandLine = null;
  let ignoreNextMapClick = false;
  let mapMetrics = {
    areaSquareMeters: 0,
    areaHectares: 0,
    perimeterMeters: 0,
  };

  const drawnItems = new L.FeatureGroup();
  map.addLayer(drawnItems);

  const tileLayer = L.tileLayer(
    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    {
      attribution: "&copy; OpenStreetMap contributors",
      maxZoom: 19,
      updateWhenIdle: true,
      keepBuffer: 2,
    },
  );

  let tileLoaded = false;
  tileLayer
    .on("load", () => {
      tileLoaded = true;
    })
    .on("tileerror", () => {
      showAlert(
        "Tile OpenStreetMap sedang lambat atau gagal dimuat. Kontrol peta tetap bisa digunakan.",
        "error",
      );
    })
    .addTo(map);

  setTimeout(() => {
    if (!tileLoaded) {
      showAlert(
        "Tile peta masih dimuat. Jika koneksi ke OpenStreetMap lambat, tunggu sebentar atau refresh halaman.",
        "error",
      );
    }
  }, 5000);

  if (hasLeafletDraw) {
    const drawControl = new L.Control.Draw({
      edit: {
        featureGroup: drawnItems,
        edit: true,
        remove: true,
      },
      draw: {
        polygon: {
          allowIntersection: false,
          showArea: true,
          shapeOptions: {
            color: "#0f766e",
            fillColor: "#14b8a6",
            fillOpacity: 0.18,
            weight: 3,
          },
        },
        marker: false,
        circle: false,
        circlemarker: false,
        polyline: false,
        rectangle: false,
      },
    });
    map.addControl(drawControl);
  } else {
    showAlert(
      "Leaflet Draw belum termuat. Marker tetap bisa diset dengan klik peta, tetapi gambar polygon perlu refresh halaman.",
      "error",
    );
  }

  function showAlert(message, type = "success") {
    alertBox.textContent = message;
    alertBox.className =
      type === "success"
        ? "rounded-md border border-teal-200 bg-teal-50 px-4 py-3 text-sm font-semibold text-teal-800"
        : "rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
  }

  function hideAlert() {
    alertBox.className =
      "hidden rounded-md border px-4 py-3 text-sm font-semibold";
    alertBox.textContent = "";
  }

  function escapeHtml(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function parseResponse(response) {
    return response
      .json()
      .catch(() => ({
        success: false,
        message: "Respons server tidak valid.",
      }))
      .then((payload) => {
        if (!response.ok || !payload.success) {
          throw new Error(payload.message || "Permintaan gagal diproses.");
        }

        return payload;
      });
  }

  async function fetchWithTimeout(url, options = {}, timeoutMs = 8000) {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), timeoutMs);

    try {
      return await fetch(url, {
        ...options,
        signal: controller.signal,
      });
    } finally {
      clearTimeout(timeoutId);
    }
  }

  function parsePolygon(polygonArea) {
    if (!polygonArea) {
      return [];
    }

    try {
      const parsed = JSON.parse(polygonArea);

      if (!Array.isArray(parsed)) {
        return [];
      }

      return parsed
        .map((point) => {
          if (Array.isArray(point) && point.length >= 2) {
            const lat = Number(point[0]);
            const lng = Number(point[1]);

            if (!Number.isFinite(lat) || !Number.isFinite(lng)) {
              return null;
            }

            return [lat, lng];
          }

          if (!point || typeof point !== "object") {
            return null;
          }

          const lat = Number(point.lat);
          const lng = Number(point.lng);

          if (!Number.isFinite(lat) || !Number.isFinite(lng)) {
            return null;
          }

          return [lat, lng];
        })
        .filter(Boolean);
    } catch (error) {
      console.warn("Polygon lahan tidak bisa diparse:", error);
      return [];
    }
  }

  function calculatePolygonAreaSquareMeters(points) {
    if (!Array.isArray(points) || points.length < 3) {
      return 0;
    }

    const earthRadius = 6378137;
    const degreesToRadians = Math.PI / 180;
    let area = 0;

    for (let index = 0; index < points.length; index += 1) {
      const current = points[index];
      const next = points[(index + 1) % points.length];
      const currentLat = Number(current[0]);
      const currentLng = Number(current[1]);
      const nextLat = Number(next[0]);
      const nextLng = Number(next[1]);

      if (
        !Number.isFinite(currentLat) ||
        !Number.isFinite(currentLng) ||
        !Number.isFinite(nextLat) ||
        !Number.isFinite(nextLng)
      ) {
        return 0;
      }

      area +=
        (nextLng - currentLng) *
        degreesToRadians *
        (2 +
          Math.sin(currentLat * degreesToRadians) +
          Math.sin(nextLat * degreesToRadians));
    }

    return Math.abs((area * earthRadius * earthRadius) / 2);
  }

  function calculatePolygonPerimeterMeters(points) {
    if (!Array.isArray(points) || points.length < 3) {
      return 0;
    }

    return points.reduce((total, point, index) => {
      const nextPoint = points[(index + 1) % points.length];
      const current = L.latLng(point[0], point[1]);
      const next = L.latLng(nextPoint[0], nextPoint[1]);

      return total + current.distanceTo(next);
    }, 0);
  }

  function updateMetrics() {
    const areaSquareMeters = calculatePolygonAreaSquareMeters(polygonLatLngs);
    const perimeterMeters = calculatePolygonPerimeterMeters(polygonLatLngs);

    mapMetrics = {
      areaSquareMeters,
      areaHectares: areaSquareMeters / 10000,
      perimeterMeters,
    };
  }

  function resetMetrics() {
    mapMetrics = {
      areaSquareMeters: 0,
      areaHectares: 0,
      perimeterMeters: 0,
    };
  }

  function formatNumber(value, fractionDigits = 2) {
    return Number(value || 0).toLocaleString("id-ID", {
      minimumFractionDigits: fractionDigits,
      maximumFractionDigits: fractionDigits,
    });
  }

  function popupHtml(item) {
    return `
      <strong>${escapeHtml(item.nama_lahan)}</strong><br>
      ${escapeHtml(item.lokasi)}<br>
      Luas: ${Number(item.luas_lahan).toFixed(2)} ha<br>
      Status: ${escapeHtml(item.status_lahan)}
    `;
  }

  function setMarker(latLng) {
    try {
      markerLatLng = {
        lat: Number(latLng.lat),
        lng: Number(latLng.lng),
      };

      if (marker) {
        marker.setLatLng(markerLatLng);
      } else {
        marker = L.marker(markerLatLng).addTo(map);
      }

      if (selectedLahan) {
        marker.bindPopup(popupHtml(selectedLahan)).openPopup();
      }

      renderDetail();
    } catch (error) {
      console.error("Gagal render marker lahan:", error);
      showAlert("Marker lahan gagal dirender.", "error");
    }
  }

  function setPolygon(latLngs) {
    try {
      polygonLatLngs = latLngs
        .map((point) => [
          Number(point.lat ?? point[0]),
          Number(point.lng ?? point[1]),
        ])
        .filter(
          (point) => Number.isFinite(point[0]) && Number.isFinite(point[1]),
        );

      drawnItems.clearLayers();
      polygonLayer = null;

      if (polygonLatLngs.length >= 3) {
        updateMetrics();
        polygonLayer = L.polygon(polygonLatLngs, {
          color: "#0f766e",
          fillColor: "#14b8a6",
          fillOpacity: 0.18,
          weight: 3,
        });
        drawnItems.addLayer(polygonLayer);
      } else {
        resetMetrics();
      }

      renderDetail();
    } catch (error) {
      console.error("Gagal render polygon lahan:", error);
      showAlert("Polygon lahan gagal dirender.", "error");
    }
  }

  function clearMapLayers() {
    if (marker) {
      map.removeLayer(marker);
      marker = null;
    }

    drawnItems.clearLayers();
    polygonLayer = null;
    markerLatLng = null;
    polygonLatLngs = [];
    resetMetrics();
  }

  function clearFreehandLine() {
    if (freehandLine) {
      map.removeLayer(freehandLine);
      freehandLine = null;
    }
  }

  function resetPolygon() {
    drawnItems.clearLayers();
    polygonLayer = null;
    polygonLatLngs = [];
    resetMetrics();
    clearFreehandLine();
    renderDetail();
  }

  function setFreehandMode(isActive) {
    isFreehandMode = isActive;
    isFreehandDrawing = false;
    freehandPoints = [];
    clearFreehandLine();

    if (isActive) {
      map.dragging.disable();
      mapElement.style.cursor = "crosshair";
      freehandButton.textContent = "Selesai Gambar";
      freehandButton.classList.remove("btn-secondary");
      freehandButton.classList.add("btn-primary");
      instruction.textContent =
        "Aktifkan Gambar Bebas, lalu tahan dan geser mouse mengikuti batas lahan. Lepaskan mouse untuk membentuk polygon.";
      showAlert(
        "Mode gambar bebas aktif. Tahan mouse dan geser mengikuti batas lahan.",
        "success",
      );
      return;
    }

    map.dragging.enable();
    mapElement.style.cursor = "";
    freehandButton.textContent = "Gambar Bebas";
    freehandButton.classList.remove("btn-primary");
    freehandButton.classList.add("btn-secondary");
    hideAlert();
  }

  function distanceFromLastPoint(latLng) {
    if (freehandPoints.length === 0) {
      return Infinity;
    }

    return freehandPoints[freehandPoints.length - 1].distanceTo(latLng);
  }

  function simplifyPoints(points, minDistanceMeters = 2) {
    return points.filter((point, index) => {
      if (index === 0 || index === points.length - 1) {
        return true;
      }

      return points[index - 1].distanceTo(point) >= minDistanceMeters;
    });
  }

  function startFreehandDrawing(event) {
    if (!isFreehandMode || !selectedLahan) {
      return;
    }

    isFreehandDrawing = true;
    freehandPoints = [event.latlng];
    clearFreehandLine();
    freehandLine = L.polyline(freehandPoints, {
      color: "#dc2626",
      weight: 3,
      dashArray: "6,6",
    }).addTo(map);
  }

  function appendFreehandPoint(event) {
    if (!isFreehandMode || !isFreehandDrawing) {
      return;
    }

    if (distanceFromLastPoint(event.latlng) < 2) {
      return;
    }

    freehandPoints.push(event.latlng);
    freehandLine.setLatLngs(freehandPoints);
  }

  function finishFreehandDrawing() {
    if (!isFreehandMode || !isFreehandDrawing) {
      return;
    }

    isFreehandDrawing = false;
    ignoreNextMapClick = true;

    const simplifiedPoints = simplifyPoints(freehandPoints);
    freehandPoints = [];
    clearFreehandLine();

    if (simplifiedPoints.length < 3) {
      showAlert(
        "Gambar terlalu kecil. Tahan dan geser mouse hingga membentuk batas lahan.",
        "error",
      );
      return;
    }

    setPolygon(simplifiedPoints);
    setFreehandMode(false);
    showAlert("Polygon gambar bebas berhasil dibuat.", "success");
  }

  function renderDetail() {
    if (!selectedLahan) {
      detail.innerHTML = `
        <div>
          <dt class="font-bold text-slate-500">Nama</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Lokasi</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Luas</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Koordinat</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Polygon</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Keliling</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Luas m²</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
        <div>
          <dt class="font-bold text-slate-500">Luas Hektare</dt>
          <dd class="font-semibold text-slate-900">-</dd>
        </div>
      `;
      return;
    }

    const coordinates = markerLatLng
      ? `${markerLatLng.lat.toFixed(6)}, ${markerLatLng.lng.toFixed(6)}`
      : "Belum ditentukan";
    const polygonText =
      polygonLatLngs.length >= 3
        ? `${polygonLatLngs.length} titik polygon`
        : "Belum digambar";
    const perimeterText =
      mapMetrics.perimeterMeters > 0
        ? `${formatNumber(mapMetrics.perimeterMeters)} m`
        : "-";
    const areaMetersText =
      mapMetrics.areaSquareMeters > 0
        ? `${formatNumber(mapMetrics.areaSquareMeters)} m²`
        : "-";
    const areaHectaresText =
      mapMetrics.areaHectares > 0
        ? `${formatNumber(mapMetrics.areaHectares, 4)} ha`
        : "-";

    detail.innerHTML = `
      <div>
        <dt class="font-bold text-slate-500">Nama</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(selectedLahan.nama_lahan)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Lokasi</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(selectedLahan.lokasi)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Luas</dt>
        <dd class="font-semibold text-slate-900">${Number(selectedLahan.luas_lahan).toFixed(2)} ha</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Koordinat</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(coordinates)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Polygon</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(polygonText)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Keliling</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(perimeterText)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Luas m²</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(areaMetersText)}</dd>
      </div>
      <div>
        <dt class="font-bold text-slate-500">Luas Hektare</dt>
        <dd class="font-semibold text-slate-900">${escapeHtml(areaHectaresText)}</dd>
      </div>
    `;
  }

  function renderSelectedLahan() {
    try {
      clearMapLayers();

      if (!selectedLahan) {
        instruction.textContent =
          "Pilih lahan aktif untuk mulai mengatur lokasi pada peta.";
        renderDetail();
        return;
      }

      const lat = Number(selectedLahan.latitude);
      const lng = Number(selectedLahan.longitude);

      if (Number.isFinite(lat) && Number.isFinite(lng)) {
        setMarker({ lat, lng });
        map.setView([lat, lng], 15);
      } else {
        map.setView(defaultCenter, 10);
      }

      const savedPolygon = parsePolygon(selectedLahan.polygon_area);

      if (savedPolygon.length >= 3) {
        setPolygon(savedPolygon);
        map.fitBounds(L.latLngBounds(savedPolygon), {
          padding: [24, 24],
        });
      }

      if (!markerLatLng || polygonLatLngs.length < 3) {
        instruction.textContent =
          "Klik peta untuk menentukan titik lahan. Pilih ikon polygon di kiri peta, klik beberapa titik batas lahan, lalu klik titik pertama atau finish.";
      } else {
        instruction.textContent =
          "Marker dan polygon tersimpan. Edit titik polygon untuk memperbarui area dan keliling, atau delete untuk menggambar ulang.";
      }

      renderDetail();
    } catch (error) {
      console.error("Gagal render lahan terpilih:", error);
      showAlert("Data lahan terpilih gagal dirender di peta.", "error");
    }
  }

  function renderSelect() {
    select.innerHTML = "";

    if (lahanList.length === 0) {
      select.innerHTML = '<option value="">Belum ada lahan aktif</option>';
      select.disabled = true;
      saveButton.disabled = true;
      emptyState.textContent =
        "Belum ada lahan. Tambahkan lahan terlebih dahulu.";
      emptyState.classList.remove("hidden");
      return;
    }

    select.disabled = false;
    saveButton.disabled = false;
    emptyState.classList.add("hidden");

    lahanList.forEach((item) => {
      const option = document.createElement("option");
      option.value = item.id;
      option.textContent = item.nama_lahan;
      select.appendChild(option);
    });

    selectedLahan = lahanList[0];
    select.value = selectedLahan.id;
    renderSelectedLahan();
  }

  async function loadLahan() {
    hideAlert();
    select.innerHTML = '<option value="">Memuat lahan...</option>';
    select.disabled = true;
    saveButton.disabled = true;

    try {
      const response = await fetchWithTimeout(endpoints.list, {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      lahanList = (payload.data || []).filter(
        (item) => item.status_lahan === "aktif",
      );
      renderSelect();
    } catch (error) {
      const message =
        error.name === "AbortError"
          ? "Memuat data lahan terlalu lama. Peta tetap siap, coba refresh atau cek login."
          : error.message;
      console.error("Gagal memuat data lahan:", error);
      select.innerHTML = '<option value="">Gagal memuat lahan</option>';
      select.disabled = true;
      saveButton.disabled = true;
      clearMapLayers();
      renderDetail();
      showAlert(message, "error");
      emptyState.textContent = message;
      emptyState.classList.remove("hidden");
    }
  }

  async function saveMapData() {
    if (!selectedLahan) {
      showAlert("Pilih lahan terlebih dahulu.", "error");
      return;
    }

    if (!markerLatLng) {
      showAlert("Klik peta untuk menentukan titik lahan.", "error");
      return;
    }

    const formData = new FormData();
    const polygonPayload = polygonLatLngs.map((point) => ({
      lat: Number(point[0].toFixed(8)),
      lng: Number(point[1].toFixed(8)),
    }));

    formData.append("id", selectedLahan.id);
    formData.append("latitude", markerLatLng.lat.toFixed(8));
    formData.append("longitude", markerLatLng.lng.toFixed(8));
    formData.append("polygon_area", JSON.stringify(polygonPayload));

    if (mapMetrics.areaHectares > 0) {
      formData.append("luas_lahan", mapMetrics.areaHectares.toFixed(4));
    }

    saveButton.disabled = true;
    saveButton.textContent = "Menyimpan...";

    try {
      const response = await fetchWithTimeout(endpoints.updateMap, {
        method: "POST",
        body: formData,
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      selectedLahan.latitude = markerLatLng.lat;
      selectedLahan.longitude = markerLatLng.lng;
      selectedLahan.polygon_area = JSON.stringify(polygonPayload);

      if (mapMetrics.areaHectares > 0) {
        selectedLahan.luas_lahan = mapMetrics.areaHectares;
      }

      renderDetail();
      showAlert(payload.message, "success");
    } catch (error) {
      const message =
        error.name === "AbortError"
          ? "Menyimpan peta terlalu lama. Coba lagi beberapa saat."
          : error.message;
      console.error("Gagal menyimpan data peta:", error);
      showAlert(message, "error");
    } finally {
      saveButton.disabled = false;
      saveButton.textContent = "Simpan Peta";
    }
  }

  select.addEventListener("change", () => {
    if (isFreehandMode) {
      setFreehandMode(false);
    }

    selectedLahan = lahanList.find(
      (item) => String(item.id) === String(select.value),
    );
    hideAlert();
    renderSelectedLahan();
  });

  map.on("click", (event) => {
    if (ignoreNextMapClick) {
      ignoreNextMapClick = false;
      return;
    }

    if (isFreehandMode) {
      return;
    }

    if (!selectedLahan) {
      showAlert("Pilih lahan terlebih dahulu.", "error");
      return;
    }

    setMarker(event.latlng);
  });

  if (hasLeafletDraw) {
    map.on(L.Draw.Event.CREATED, (event) => {
      if (!selectedLahan) {
        showAlert("Pilih lahan terlebih dahulu.", "error");
        return;
      }

      if (event.layerType === "polygon") {
        const latLngs = event.layer.getLatLngs()[0] || [];
        setPolygon(latLngs);
      }
    });

    map.on(L.Draw.Event.EDITED, (event) => {
      event.layers.eachLayer((layer) => {
        if (layer instanceof L.Polygon) {
          setPolygon(layer.getLatLngs()[0] || []);
        }
      });
    });

    map.on(L.Draw.Event.DELETED, () => {
      polygonLatLngs = [];
      polygonLayer = null;
      resetMetrics();
      renderDetail();
    });
  }

  map.on("mousedown", (event) => {
    if (!selectedLahan && isFreehandMode) {
      showAlert("Pilih lahan terlebih dahulu.", "error");
      setFreehandMode(false);
      return;
    }

    startFreehandDrawing(event);
  });

  map.on("mousemove", appendFreehandPoint);
  map.on("mouseup", finishFreehandDrawing);
  map.on("mouseout", finishFreehandDrawing);

  freehandButton.addEventListener("click", () => {
    if (!selectedLahan) {
      showAlert("Pilih lahan terlebih dahulu.", "error");
      return;
    }

    setFreehandMode(!isFreehandMode);
  });

  resetButton.addEventListener("click", () => {
    resetPolygon();
    showAlert(
      "Gambar polygon dikosongkan. Klik Simpan Peta untuk menyimpan perubahan.",
      "success",
    );
  });

  saveButton.addEventListener("click", saveMapData);

  requestAnimationFrame(() => {
    map.invalidateSize();
    setTimeout(() => map.invalidateSize(), 250);
  });

  loadLahan();
});
