document.addEventListener("DOMContentLoaded", () => {
  const mapElement = document.querySelector("[data-admin-monitoring-map]");
  const tableBody = document.querySelector("[data-monitor-table]");
  const searchInput = document.querySelector("[data-monitor-search]");
  const emptyState = document.querySelector("[data-monitor-empty]");
  const alertBox = document.querySelector("[data-monitor-alert]");

  if (!mapElement || !tableBody || typeof L === "undefined") {
    return;
  }

  const fields = {
    total: document.querySelector("[data-monitor-total]"),
    active: document.querySelector("[data-monitor-active]"),
    marker: document.querySelector("[data-monitor-marker]"),
    polygon: document.querySelector("[data-monitor-polygon]"),
  };

  const map = L.map(mapElement).setView([-7.257472, 112.75209], 9);
  const layerGroup = L.featureGroup().addTo(map);
  let lahanList = [];

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors",
    maxZoom: 19,
  }).addTo(map);

  function escapeHtml(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function formatDate(value) {
    if (!value) {
      return "-";
    }

    return new Intl.DateTimeFormat("id-ID", {
      day: "2-digit",
      month: "short",
      year: "numeric",
    }).format(new Date(`${value}T00:00:00`));
  }

  function showError(message) {
    alertBox.textContent = message;
    alertBox.className =
      "my-5 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
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
            return [Number(point[0]), Number(point[1])];
          }

          if (point && typeof point === "object") {
            return [Number(point.lat), Number(point.lng)];
          }

          return null;
        })
        .filter(
          (point) =>
            point && Number.isFinite(point[0]) && Number.isFinite(point[1]),
        );
    } catch (error) {
      console.warn("Polygon lahan admin tidak valid:", error);
      return [];
    }
  }

  function popupHtml(item) {
    return `
      <strong>${escapeHtml(item.nama_lahan)}</strong><br>
      Petani: ${escapeHtml(item.nama_petani)}<br>
      Lokasi: ${escapeHtml(item.lokasi)}<br>
      Luas: ${Number(item.luas_lahan).toFixed(2)} ha<br>
      Status lahan: ${escapeHtml(item.status_lahan)}<br>
      Tanaman: ${escapeHtml(item.nama_tanaman || "-")}<br>
      Status musim: ${escapeHtml(item.status_musim || "-")}
    `;
  }

  function renderSummary(summary) {
    fields.total.textContent = summary.total_lahan ?? 0;
    fields.active.textContent = summary.lahan_aktif ?? 0;
    fields.marker.textContent = summary.with_marker ?? 0;
    fields.polygon.textContent = summary.with_polygon ?? 0;
  }

  function filteredItems() {
    const keyword = searchInput.value.trim().toLowerCase();

    if (!keyword) {
      return lahanList;
    }

    return lahanList.filter((item) =>
      [
        item.nama_lahan,
        item.lokasi,
        item.status_lahan,
        item.nama_petani,
        item.email_petani,
        item.nama_tanaman,
        item.status_musim,
      ]
        .join(" ")
        .toLowerCase()
        .includes(keyword),
    );
  }

  function renderTable(items) {
    emptyState.classList.toggle("hidden", items.length > 0);

    if (!items.length) {
      tableBody.innerHTML = "";
      return;
    }

    tableBody.innerHTML = items
      .map(
        (item) => `
          <tr>
            <td>
              <strong>${escapeHtml(item.nama_petani)}</strong>
              <br>
              <span class="text-xs font-semibold text-slate-500">${escapeHtml(item.email_petani)}</span>
            </td>
            <td>${escapeHtml(item.nama_lahan)}</td>
            <td>${escapeHtml(item.lokasi)}</td>
            <td>${Number(item.luas_lahan).toFixed(2)} ha</td>
            <td>
              ${escapeHtml(item.nama_tanaman || "-")}
              <br>
              <span class="text-xs font-semibold text-slate-500">${item.estimasi_panen ? `Estimasi ${formatDate(item.estimasi_panen)}` : "-"}</span>
            </td>
            <td>${escapeHtml(item.status_lahan)}</td>
          </tr>
        `,
      )
      .join("");
  }

  function renderMap(items) {
    layerGroup.clearLayers();

    items.forEach((item) => {
      const lat = Number(item.latitude);
      const lng = Number(item.longitude);

      if (Number.isFinite(lat) && Number.isFinite(lng)) {
        L.marker([lat, lng]).bindPopup(popupHtml(item)).addTo(layerGroup);
      }

      const polygon = parsePolygon(item.polygon_area);

      if (polygon.length >= 3) {
        L.polygon(polygon, {
          color: "#0f766e",
          fillColor: "#14b8a6",
          fillOpacity: 0.16,
          weight: 3,
        })
          .bindPopup(popupHtml(item))
          .addTo(layerGroup);
      }
    });

    if (layerGroup.getLayers().length > 0) {
      map.fitBounds(layerGroup.getBounds(), {
        padding: [24, 24],
      });
    }

    setTimeout(() => map.invalidateSize(), 120);
  }

  function render() {
    const items = filteredItems();
    renderTable(items);
    renderMap(items);
  }

  async function parseResponse(response) {
    const payload = await response.json().catch(() => ({
      success: false,
      message: "Respons server tidak valid.",
    }));

    if (!response.ok || !payload.success) {
      throw new Error(payload.message || "Gagal memuat monitoring lahan.");
    }

    return payload;
  }

  async function loadMonitoring() {
    try {
      const response = await fetch("../../app/api/admin-monitoring-lahan.php", {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      lahanList = payload.data || [];
      renderSummary(payload.summary || {});
      render();
    } catch (error) {
      showError(error.message);
      tableBody.innerHTML = `
        <tr>
          <td colspan="6" class="text-center text-red-600">${escapeHtml(error.message)}</td>
        </tr>
      `;
    }
  }

  searchInput.addEventListener("input", render);

  requestAnimationFrame(() => {
    map.invalidateSize();
  });

  loadMonitoring();
});
