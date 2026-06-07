document.addEventListener("DOMContentLoaded", () => {
  const tableBody = document.querySelector("[data-biaya-table]");
  const emptyState = document.querySelector("[data-biaya-empty]");
  const alertBox = document.querySelector("[data-biaya-alert]");
  const modal = document.querySelector("[data-biaya-modal]");
  const deleteModal = document.querySelector("[data-biaya-delete-modal]");
  const form = document.querySelector("[data-biaya-form]");

  if (!tableBody || !form) {
    return;
  }

  const totalValue = document.querySelector("[data-biaya-total]");
  const topCategory = document.querySelector("[data-biaya-top-category]");
  const countValue = document.querySelector("[data-biaya-count]");
  const modalTitle = document.querySelector("[data-biaya-modal-title]");
  const idInput = document.querySelector("[data-biaya-id]");
  const musimInput = document.querySelector("[data-biaya-musim]");
  const kategoriInput = document.querySelector("[data-biaya-kategori]");
  const nominalInput = document.querySelector("[data-biaya-nominal]");
  const tanggalInput = document.querySelector("[data-biaya-tanggal]");
  const keteranganInput = document.querySelector("[data-biaya-keterangan]");
  const submitButton = document.querySelector("[data-biaya-submit]");
  const deleteIdInput = document.querySelector("[data-biaya-delete-id]");
  let biayaList = [];
  let musimOptions = [];

  const endpoints = {
    list: "../../app/api/biaya.php",
    create: "../../app/actions/biaya/create.php",
    update: "../../app/actions/biaya/update.php",
    delete: "../../app/actions/biaya/delete.php",
  };

  const categoryLabels = {
    bibit: "Bibit",
    pupuk: "Pupuk",
    pestisida: "Pestisida",
    tenaga_kerja: "Tenaga Kerja",
    transportasi: "Transportasi",
    sewa_alat: "Sewa Alat",
    lainnya: "Lainnya",
  };

  function escapeHtml(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

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

  function showAlert(message, type = "success") {
    alertBox.textContent = message;
    alertBox.className =
      type === "success"
        ? "my-5 rounded-md border border-teal-200 bg-teal-50 px-4 py-3 text-sm font-semibold text-teal-800"
        : "my-5 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
  }

  function hideAlert() {
    alertBox.className =
      "my-5 hidden rounded-md border px-4 py-3 text-sm font-semibold";
    alertBox.textContent = "";
  }

  function setLoading(message = "Memuat data biaya produksi...") {
    tableBody.innerHTML = `
      <tr>
        <td colspan="6" class="text-center text-slate-500">${message}</td>
      </tr>
    `;
  }

  function seasonLabel(item) {
    return `${item.nama_lahan} - ${item.nama_tanaman} (${formatDate(item.tanggal_tanam)})`;
  }

  function renderOptions() {
    musimInput.innerHTML =
      '<option value="">Pilih musim tanam</option>' +
      musimOptions
        .map(
          (item) =>
            `<option value="${item.id}">${escapeHtml(seasonLabel(item))}</option>`,
        )
        .join("");
  }

  function renderSummary(summary, count) {
    totalValue.textContent = rupiah(summary.total_biaya || 0);
    countValue.textContent = String(count);

    const entries = Object.entries(summary.total_per_kategori || {});
    const top = entries.sort((a, b) => Number(b[1]) - Number(a[1]))[0];
    topCategory.textContent = top
      ? `${categoryLabels[top[0]] || top[0]} (${rupiah(top[1])})`
      : "-";
  }

  function renderTable(items) {
    biayaList = items;
    emptyState.classList.toggle("hidden", items.length > 0);

    if (items.length === 0) {
      tableBody.innerHTML = "";
      return;
    }

    tableBody.innerHTML = items
      .map(
        (item) => `
          <tr>
            <td>
              <strong>${escapeHtml(item.nama_lahan)} - ${escapeHtml(item.nama_tanaman)}</strong>
              <br>
              <span class="text-xs font-semibold text-slate-500">Tanam ${formatDate(item.tanggal_tanam)}</span>
            </td>
            <td>${escapeHtml(categoryLabels[item.kategori] || item.kategori)}</td>
            <td><strong>${rupiah(item.nominal)}</strong></td>
            <td>${formatDate(item.tanggal_biaya)}</td>
            <td>${escapeHtml(item.keterangan || "-")}</td>
            <td>
              <div class="flex flex-wrap gap-2">
                <button class="rounded-md border border-slate-200 px-3 py-2 text-xs font-black text-slate-700" type="button" data-biaya-edit="${item.id}">
                  Edit
                </button>
                <button class="rounded-md border border-red-200 px-3 py-2 text-xs font-black text-red-600" type="button" data-biaya-delete="${item.id}">
                  Hapus
                </button>
              </div>
            </td>
          </tr>
        `,
      )
      .join("");
  }

  async function parseResponse(response) {
    const payload = await response.json().catch(() => ({
      success: false,
      message: "Respons server tidak valid.",
    }));

    if (!response.ok || !payload.success) {
      throw new Error(payload.message || "Permintaan gagal diproses.");
    }

    return payload;
  }

  async function loadBiaya() {
    hideAlert();
    setLoading();

    try {
      const response = await fetch(endpoints.list, {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      musimOptions = payload.options?.musim_tanam || [];
      renderOptions();
      renderSummary(payload.summary || {}, payload.data?.length || 0);
      renderTable(payload.data || []);
    } catch (error) {
      tableBody.innerHTML = `
        <tr>
          <td colspan="6" class="text-center text-red-600">${escapeHtml(error.message)}</td>
        </tr>
      `;
    }
  }

  function openModal(mode, item = null) {
    form.dataset.mode = mode;
    modalTitle.textContent =
      mode === "edit" ? "Edit Biaya Produksi" : "Tambah Biaya Produksi";
    submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";

    idInput.value = item?.id || "";
    musimInput.value = item?.musim_tanam_id || "";
    kategoriInput.value = item?.kategori || "bibit";
    nominalInput.value = item?.nominal || "";
    tanggalInput.value = item?.tanggal_biaya || "";
    keteranganInput.value = item?.keterangan || "";

    modal.classList.remove("hidden");
    modal.classList.add("flex");
    musimInput.focus();
  }

  function closeModal() {
    modal.classList.add("hidden");
    modal.classList.remove("flex");
    form.reset();
    idInput.value = "";
    form.dataset.mode = "create";
  }

  function openDeleteModal(id) {
    deleteIdInput.value = id;
    deleteModal.classList.remove("hidden");
    deleteModal.classList.add("flex");
  }

  function closeDeleteModal() {
    deleteModal.classList.add("hidden");
    deleteModal.classList.remove("flex");
    deleteIdInput.value = "";
  }

  async function submitForm(event) {
    event.preventDefault();
    const mode = form.dataset.mode;
    const endpoint = mode === "edit" ? endpoints.update : endpoints.create;
    submitButton.disabled = true;
    submitButton.textContent =
      mode === "edit" ? "Memperbarui..." : "Menyimpan...";

    try {
      const response = await fetch(endpoint, {
        method: "POST",
        body: new FormData(form),
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      await loadBiaya();
      closeModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";
    }
  }

  async function deleteBiaya() {
    const id = deleteIdInput.value;

    if (!id) {
      return;
    }

    const formData = new FormData();
    formData.append("id", id);

    try {
      const response = await fetch(endpoints.delete, {
        method: "POST",
        body: formData,
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      await loadBiaya();
      closeDeleteModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    }
  }

  document
    .querySelector("[data-biaya-open-create]")
    ?.addEventListener("click", () => openModal("create"));

  document.querySelectorAll("[data-biaya-close-modal]").forEach((button) => {
    button.addEventListener("click", closeModal);
  });

  document
    .querySelector("[data-biaya-close-delete]")
    ?.addEventListener("click", closeDeleteModal);

  document
    .querySelector("[data-biaya-confirm-delete]")
    ?.addEventListener("click", deleteBiaya);

  tableBody.addEventListener("click", (event) => {
    const editButton = event.target.closest("[data-biaya-edit]");
    const deleteButton = event.target.closest("[data-biaya-delete]");

    if (editButton) {
      const item = biayaList.find(
        (biaya) => String(biaya.id) === editButton.dataset.biayaEdit,
      );

      if (item) {
        openModal("edit", item);
      }
    }

    if (deleteButton) {
      openDeleteModal(deleteButton.dataset.biayaDelete);
    }
  });

  form.addEventListener("submit", submitForm);
  loadBiaya();
});
