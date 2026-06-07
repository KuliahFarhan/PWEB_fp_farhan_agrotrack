document.addEventListener("DOMContentLoaded", () => {
  const alertBox = document.querySelector("[data-dashboard-alert]");
  const recentSeasonTable = document.querySelector(
    "[data-recent-season-table]",
  );
  const progressList = document.querySelector("[data-progress-list]");
  const nearestHarvest = document.querySelector("[data-nearest-harvest]");

  const fields = {
    totalLahan: document.querySelector("[data-total-lahan]"),
    totalMusim: document.querySelector("[data-total-musim]"),
    totalBiaya: document.querySelector("[data-total-biaya]"),
    totalPendapatan: document.querySelector("[data-total-pendapatan]"),
    totalKeuntungan: document.querySelector("[data-total-keuntungan]"),
  };

  function rupiah(value) {
    return new Intl.NumberFormat("id-ID", {
      style: "currency",
      currency: "IDR",
      maximumFractionDigits: 0,
    }).format(Number(value || 0));
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

  function escapeHtml(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function showError(message) {
    alertBox.textContent = message;
    alertBox.className =
      "mb-5 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
  }

  async function parseResponse(response) {
    const payload = await response.json().catch(() => ({
      success: false,
      message: "Respons server tidak valid.",
    }));

    if (!response.ok || !payload.success) {
      throw new Error(payload.message || "Gagal memuat dashboard.");
    }

    return payload;
  }

  function renderSummary(summary) {
    fields.totalLahan.textContent = summary.total_lahan ?? 0;
    fields.totalMusim.textContent = summary.total_musim_aktif ?? 0;
    fields.totalBiaya.textContent = rupiah(summary.total_biaya);
    fields.totalPendapatan.textContent = rupiah(summary.total_pendapatan);
    fields.totalKeuntungan.textContent = rupiah(summary.total_keuntungan);
  }

  function renderRecentSeasons(items) {
    if (!items.length) {
      recentSeasonTable.innerHTML = `
        <tr>
          <td colspan="4" class="text-center text-slate-500">Belum ada musim tanam.</td>
        </tr>
      `;
      return;
    }

    recentSeasonTable.innerHTML = items
      .map(
        (item) => `
          <tr>
            <td><strong>${escapeHtml(item.nama_lahan)}</strong></td>
            <td>${escapeHtml(item.nama_tanaman)}</td>
            <td>${formatDate(item.estimasi_panen)}</td>
            <td>${escapeHtml(item.status)}</td>
          </tr>
        `,
      )
      .join("");
  }

  function renderProgress(items) {
    if (!items.length) {
      progressList.innerHTML =
        '<p class="text-sm text-slate-500">Belum ada progress musim tanam.</p>';
      return;
    }

    progressList.innerHTML = items
      .map(
        (item) => `
          <div>
            <div class="flex justify-between text-sm">
              <b>${escapeHtml(item.nama_tanaman)}</b>
              <span>${item.progress}%</span>
            </div>
            <p class="text-xs text-slate-500">${escapeHtml(item.nama_lahan)}</p>
            <div class="mt-2 h-3 rounded-full bg-slate-100">
              <div class="h-3 rounded-full bg-teal-600" style="width: ${item.progress}%"></div>
            </div>
          </div>
        `,
      )
      .join("");
  }

  function renderNearest(item) {
    if (!item) {
      nearestHarvest.textContent = "Belum ada estimasi panen terdekat.";
      return;
    }

    nearestHarvest.textContent = `${item.nama_tanaman} di ${item.nama_lahan}, estimasi ${formatDate(item.estimasi_panen)}.`;
  }

  async function loadDashboard() {
    try {
      const response = await fetch("../../app/api/dashboard.php?scope=petani", {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      renderSummary(payload.summary || {});
      renderRecentSeasons(payload.recent?.musim_tanam || []);
      renderProgress(payload.recent?.musim_tanam || []);
      renderNearest(payload.panen_terdekat);
    } catch (error) {
      showError(error.message);
    }
  }

  loadDashboard();
});
