document.addEventListener("DOMContentLoaded", () => {
  const tableBody = document.querySelector("[data-musim-table]");
  const emptyState = document.querySelector("[data-musim-empty]");
  const alertBox = document.querySelector("[data-musim-alert]");
  const modal = document.querySelector("[data-musim-modal]");
  const deleteModal = document.querySelector("[data-musim-delete-modal]");
  const form = document.querySelector("[data-musim-form]");

  if (!tableBody || !form) {
    return;
  }

  const modalTitle = document.querySelector("[data-musim-modal-title]");
  const idInput = document.querySelector("[data-musim-id]");
  const lahanInput = document.querySelector("[data-musim-lahan]");
  const tanamanInput = document.querySelector("[data-musim-tanaman]");
  const tanggalInput = document.querySelector("[data-musim-tanggal]");
  const statusInput = document.querySelector("[data-musim-status]");
  const catatanInput = document.querySelector("[data-musim-catatan]");
  const submitButton = document.querySelector("[data-musim-submit]");
  const deleteIdInput = document.querySelector("[data-musim-delete-id]");
  let musimList = [];
  let options = {
    lahan: [],
    tanaman: [],
  };

  const endpoints = {
    list: "../../app/api/musim-tanam.php",
    create: "../../app/actions/musim-tanam/create.php",
    update: "../../app/actions/musim-tanam/update.php",
    delete: "../../app/actions/musim-tanam/delete.php",
  };

  const statusLabels = {
    persemaian: "Persemaian",
    pertumbuhan: "Pertumbuhan",
    siap_panen: "Siap Panen",
    panen_selesai: "Panen Selesai",
  };

  function showAlert(message, type = "success") {
    alertBox.textContent = message;
    alertBox.className =
      type === "success"
        ? "mb-5 rounded-md border border-teal-200 bg-teal-50 px-4 py-3 text-sm font-semibold text-teal-800"
        : "mb-5 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
  }

  function hideAlert() {
    alertBox.className =
      "mb-5 hidden rounded-md border px-4 py-3 text-sm font-semibold";
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

  function statusBadge(status) {
    const color =
      status === "panen_selesai"
        ? "bg-slate-100 text-slate-600"
        : status === "siap_panen"
          ? "bg-amber-50 text-amber-700"
          : "bg-teal-50 text-teal-700";

    return `<span class="rounded-full px-3 py-1 text-xs font-black ${color}">
      ${escapeHtml(statusLabels[status] || status)}
    </span>`;
  }

  function progressBar(progress) {
    const value = Math.max(0, Math.min(100, Number(progress || 0)));

    return `
      <div class="min-w-[150px]">
        <div class="mb-1 flex justify-between text-xs font-bold text-slate-500">
          <span>${value}%</span>
          <span>progress</span>
        </div>
        <div class="h-2 overflow-hidden rounded-full bg-slate-100">
          <div class="h-full rounded-full bg-teal-600" style="width: ${value}%"></div>
        </div>
      </div>
    `;
  }

  function setLoading(message = "Memuat data musim tanam...") {
    tableBody.innerHTML = `
      <tr>
        <td colspan="7" class="text-center text-slate-500">${message}</td>
      </tr>
    `;
  }

  function renderOptions() {
    lahanInput.innerHTML =
      '<option value="">Pilih lahan aktif</option>' +
      options.lahan
        .map(
          (item) =>
            `<option value="${item.id}">${escapeHtml(item.nama_lahan)}</option>`,
        )
        .join("");

    tanamanInput.innerHTML =
      '<option value="">Pilih tanaman aktif</option>' +
      options.tanaman
        .map(
          (item) =>
            `<option value="${item.id}">${escapeHtml(item.nama_tanaman)} (${item.masa_panen} hari)</option>`,
        )
        .join("");
  }

  function renderTable(items) {
    musimList = items;
    emptyState.classList.toggle("hidden", items.length > 0);

    if (items.length === 0) {
      tableBody.innerHTML = "";
      return;
    }

    tableBody.innerHTML = items
      .map(
        (item) => `
          <tr>
            <td><strong>${escapeHtml(item.nama_lahan)}</strong></td>
            <td>
              ${escapeHtml(item.nama_tanaman)}
              <br>
              <span class="text-xs font-semibold text-slate-500">${item.masa_panen} hari</span>
            </td>
            <td>${formatDate(item.tanggal_tanam)}</td>
            <td>${formatDate(item.estimasi_panen)}</td>
            <td>${statusBadge(item.status)}</td>
            <td>${progressBar(item.progress)}</td>
            <td>
              <div class="flex flex-wrap gap-2">
                <button
                  class="rounded-md border border-slate-200 px-3 py-2 text-xs font-black text-slate-700"
                  type="button"
                  data-musim-edit="${item.id}"
                >
                  Edit
                </button>
                <button
                  class="rounded-md border border-red-200 px-3 py-2 text-xs font-black text-red-600"
                  type="button"
                  data-musim-delete="${item.id}"
                >
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

  async function loadMusimTanam() {
    hideAlert();
    setLoading();

    try {
      const response = await fetch(endpoints.list, {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      options = payload.options || options;
      renderOptions();
      renderTable(payload.data || []);
    } catch (error) {
      tableBody.innerHTML = `
        <tr>
          <td colspan="7" class="text-center text-red-600">
            ${escapeHtml(error.message)}
          </td>
        </tr>
      `;
    }
  }

  function openModal(mode, item = null) {
    form.dataset.mode = mode;
    modalTitle.textContent =
      mode === "edit" ? "Edit Musim Tanam" : "Tambah Musim Tanam";
    submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";

    idInput.value = item?.id || "";
    lahanInput.value = item?.lahan_id || "";
    tanamanInput.value = item?.tanaman_id || "";
    tanggalInput.value = item?.tanggal_tanam || "";
    statusInput.value = item?.status || "persemaian";
    catatanInput.value = item?.catatan || "";

    modal.classList.remove("hidden");
    modal.classList.add("flex");
    lahanInput.focus();
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

      await loadMusimTanam();
      closeModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";
    }
  }

  async function deleteMusimTanam() {
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

      await loadMusimTanam();
      closeDeleteModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    }
  }

  document
    .querySelector("[data-musim-open-create]")
    ?.addEventListener("click", () => openModal("create"));

  document.querySelectorAll("[data-musim-close-modal]").forEach((button) => {
    button.addEventListener("click", closeModal);
  });

  document
    .querySelector("[data-musim-close-delete]")
    ?.addEventListener("click", closeDeleteModal);

  document
    .querySelector("[data-musim-confirm-delete]")
    ?.addEventListener("click", deleteMusimTanam);

  tableBody.addEventListener("click", (event) => {
    const editButton = event.target.closest("[data-musim-edit]");
    const deleteButton = event.target.closest("[data-musim-delete]");

    if (editButton) {
      const item = musimList.find(
        (musim) => String(musim.id) === editButton.dataset.musimEdit,
      );

      if (item) {
        openModal("edit", item);
      }
    }

    if (deleteButton) {
      openDeleteModal(deleteButton.dataset.musimDelete);
    }
  });

  form.addEventListener("submit", submitForm);
  loadMusimTanam();
});
