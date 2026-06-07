document.addEventListener("DOMContentLoaded", () => {
  const tableBody = document.querySelector("[data-tanaman-table]");
  const emptyState = document.querySelector("[data-tanaman-empty]");
  const alertBox = document.querySelector("[data-tanaman-alert]");
  const modal = document.querySelector("[data-tanaman-modal]");
  const deleteModal = document.querySelector("[data-tanaman-delete-modal]");
  const form = document.querySelector("[data-tanaman-form]");

  if (!tableBody || !form) {
    return;
  }

  const modalTitle = document.querySelector("[data-tanaman-modal-title]");
  const idInput = document.querySelector("[data-tanaman-id]");
  const namaInput = document.querySelector("[data-tanaman-nama]");
  const masaInput = document.querySelector("[data-tanaman-masa]");
  const statusInput = document.querySelector("[data-tanaman-status]");
  const deskripsiInput = document.querySelector("[data-tanaman-deskripsi]");
  const submitButton = document.querySelector("[data-tanaman-submit]");
  const deleteIdInput = document.querySelector("[data-tanaman-delete-id]");
  let tanamanList = [];

  const endpoints = {
    list: "../../app/api/tanaman.php",
    create: "../../app/actions/tanaman/create.php",
    update: "../../app/actions/tanaman/update.php",
    delete: "../../app/actions/tanaman/delete.php",
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

  function setLoading(message = "Memuat data tanaman...") {
    tableBody.innerHTML = `
      <tr>
        <td colspan="5" class="text-center text-slate-500">${message}</td>
      </tr>
    `;
  }

  function escapeHtml(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function statusBadge(status) {
    const isActive = status === "aktif";

    return `
      <span class="rounded-full px-3 py-1 text-xs font-black ${
        isActive ? "bg-teal-50 text-teal-700" : "bg-slate-100 text-slate-500"
      }">
        ${isActive ? "Aktif" : "Nonaktif"}
      </span>
    `;
  }

  function renderTable(items) {
    tanamanList = items;
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
              <strong>${escapeHtml(item.nama_tanaman)}</strong>
            </td>
            <td>${escapeHtml(item.masa_panen)} hari</td>
            <td>${statusBadge(item.status)}</td>
            <td>${escapeHtml(item.deskripsi || "-")}</td>
            <td>
              <div class="flex flex-wrap gap-2">
                <button
                  class="rounded-md border border-slate-200 px-3 py-2 text-xs font-black text-slate-700"
                  type="button"
                  data-tanaman-edit="${item.id}"
                >
                  Edit
                </button>
                <button
                  class="rounded-md border border-red-200 px-3 py-2 text-xs font-black text-red-600 disabled:cursor-not-allowed disabled:opacity-50"
                  type="button"
                  data-tanaman-delete="${item.id}"
                  ${item.status === "nonaktif" ? "disabled" : ""}
                >
                  Nonaktifkan
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

  async function loadTanaman() {
    hideAlert();
    setLoading();

    try {
      const response = await fetch(endpoints.list, {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      renderTable(payload.data || []);
    } catch (error) {
      tableBody.innerHTML = `
        <tr>
          <td colspan="5" class="text-center text-red-600">
            ${escapeHtml(error.message)}
          </td>
        </tr>
      `;
    }
  }

  function openModal(mode, item = null) {
    form.dataset.mode = mode;
    modalTitle.textContent =
      mode === "edit" ? "Edit Tanaman" : "Tambah Tanaman";
    submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";

    idInput.value = item?.id || "";
    namaInput.value = item?.nama_tanaman || "";
    masaInput.value = item?.masa_panen || "";
    statusInput.value = item?.status || "aktif";
    deskripsiInput.value = item?.deskripsi || "";

    modal.classList.remove("hidden");
    modal.classList.add("flex");
    namaInput.focus();
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
    submitButton.disabled = true;
    submitButton.textContent =
      mode === "edit" ? "Memperbarui..." : "Menyimpan...";

    const endpoint = mode === "edit" ? endpoints.update : endpoints.create;

    try {
      const response = await fetch(endpoint, {
        method: "POST",
        body: new FormData(form),
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      await loadTanaman();
      closeModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";
    }
  }

  async function disableTanaman() {
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

      await loadTanaman();
      closeDeleteModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    }
  }

  document
    .querySelector("[data-tanaman-open-create]")
    ?.addEventListener("click", () => openModal("create"));

  document.querySelectorAll("[data-tanaman-close-modal]").forEach((button) => {
    button.addEventListener("click", closeModal);
  });

  document
    .querySelector("[data-tanaman-close-delete]")
    ?.addEventListener("click", closeDeleteModal);

  document
    .querySelector("[data-tanaman-confirm-delete]")
    ?.addEventListener("click", disableTanaman);

  tableBody.addEventListener("click", (event) => {
    const editButton = event.target.closest("[data-tanaman-edit]");
    const deleteButton = event.target.closest("[data-tanaman-delete]");

    if (editButton) {
      const item = tanamanList.find(
        (tanaman) => String(tanaman.id) === editButton.dataset.tanamanEdit,
      );

      if (item) {
        openModal("edit", item);
      }
    }

    if (deleteButton) {
      openDeleteModal(deleteButton.dataset.tanamanDelete);
    }
  });

  form.addEventListener("submit", submitForm);
  loadTanaman();
});
