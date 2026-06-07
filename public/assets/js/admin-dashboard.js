document.addEventListener("DOMContentLoaded", () => {
  const alertBox = document.querySelector("[data-dashboard-alert]");
  const latestTable = document.querySelector("[data-admin-latest-table]");

  const fields = {
    totalPetani: document.querySelector("[data-total-petani]"),
    totalLahan: document.querySelector("[data-total-lahan]"),
    totalTanaman: document.querySelector("[data-total-tanaman]"),
    totalMusim: document.querySelector("[data-total-musim]"),
    totalPanen: document.querySelector("[data-total-panen]"),
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
    fields.totalPetani.textContent = summary.total_petani ?? 0;
    fields.totalLahan.textContent = summary.total_lahan ?? 0;
    fields.totalTanaman.textContent = summary.total_tanaman_aktif ?? 0;
    fields.totalMusim.textContent = summary.total_musim_aktif ?? 0;
    fields.totalPanen.textContent = summary.total_hasil_panen ?? 0;
    fields.totalPendapatan.textContent = rupiah(summary.total_pendapatan);
    fields.totalKeuntungan.textContent = rupiah(summary.total_keuntungan);
  }

  function row(type, title, status) {
    return `
      <tr>
        <td>${escapeHtml(type)}</td>
        <td><strong>${escapeHtml(title)}</strong></td>
        <td>${escapeHtml(status)}</td>
      </tr>
    `;
  }

  function renderLatest(latest) {
    const rows = [
      ...(latest.users || []).map((item) =>
        row("User", `${item.nama} (${item.role})`, item.status),
      ),
      ...(latest.lahan || []).map((item) =>
        row(
          "Lahan",
          `${item.nama_lahan} - ${item.nama_user}`,
          item.status_lahan,
        ),
      ),
      ...(latest.musim_tanam || []).map((item) =>
        row("Musim", `${item.nama_tanaman} di ${item.nama_lahan}`, item.status),
      ),
    ].slice(0, 8);

    if (!rows.length) {
      latestTable.innerHTML = `
        <tr>
          <td colspan="3" class="text-center text-slate-500">Belum ada aktivitas terbaru.</td>
        </tr>
      `;
      return;
    }

    latestTable.innerHTML = rows.join("");
  }

  async function loadDashboard() {
    try {
      const response = await fetch("../../app/api/dashboard.php?scope=admin", {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      renderSummary(payload.summary || {});
      renderLatest(payload.latest || {});
    } catch (error) {
      showError(error.message);
    }
  }

  loadDashboard();
});
