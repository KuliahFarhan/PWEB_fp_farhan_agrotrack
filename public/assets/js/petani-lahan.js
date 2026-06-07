document.addEventListener("DOMContentLoaded", () => {
  const tableBody = document.querySelector("[data-lahan-table]");
  const emptyState = document.querySelector("[data-lahan-empty]");
  const alertBox = document.querySelector("[data-lahan-alert]");
  const modal = document.querySelector("[data-lahan-modal]");
  const deleteModal = document.querySelector("[data-lahan-delete-modal]");
  const form = document.querySelector("[data-lahan-form]");

  if (!tableBody || !form) {
    return;
  }

  const modalTitle = document.querySelector("[data-lahan-modal-title]");
  const idInput = document.querySelector("[data-lahan-id]");
  const namaInput = document.querySelector("[data-lahan-nama]");
  const lokasiInput = document.querySelector("[data-lahan-lokasi]");
  const luasInput = document.querySelector("[data-lahan-luas]");
  const statusInput = document.querySelector("[data-lahan-status]");
  const latitudeInput = document.querySelector("[data-lahan-latitude]");
  const longitudeInput = document.querySelector("[data-lahan-longitude]");
  const polygonInput = document.querySelector("[data-lahan-polygon]");
  const submitButton = document.querySelector("[data-lahan-submit]");
  const deleteIdInput = document.querySelector("[data-lahan-delete-id]");
  let lahanList = [];

  const endpoints = {
    list: "../../app/api/lahan.php",
    create: "../../app/actions/lahan/create.php",
    update: "../../app/actions/lahan/update.php",
    delete: "../../app/actions/lahan/delete.php",
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

  function setLoading(message = "Memuat data lahan...") {
    tableBody.innerHTML = `
      <tr>
        <td colspan="6" class="text-center text-slate-500">${message}</td>
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

  function coordinateText(item) {
    if (!item.latitude || !item.longitude) {
      return "-";
    }

    return `${Number(item.latitude).toFixed(6)}, ${Number(item.longitude).toFixed(6)}`;
  }

  function renderTable(items) {
    lahanList = items;
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
              <strong>${escapeHtml(item.nama_lahan)}</strong>
            </td>
            <td>${escapeHtml(item.lokasi)}</td>
            <td>${Number(item.luas_lahan).toFixed(2)} ha</td>
            <td>${escapeHtml(coordinateText(item))}</td>
            <td>${statusBadge(item.status_lahan)}</td>
            <td>
              <div class="flex flex-wrap gap-2">
                <button
                  class="rounded-md border border-slate-200 px-3 py-2 text-xs font-black text-slate-700"
                  type="button"
                  data-lahan-edit="${item.id}"
                >
                  Edit
                </button>
                <button
                  class="rounded-md border border-red-200 px-3 py-2 text-xs font-black text-red-600 disabled:cursor-not-allowed disabled:opacity-50"
                  type="button"
                  data-lahan-delete="${item.id}"
                  ${item.status_lahan === "nonaktif" ? "disabled" : ""}
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

  async function loadLahan() {
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
          <td colspan="6" class="text-center text-red-600">
            ${escapeHtml(error.message)}
          </td>
        </tr>
      `;
    }
  }

  function openModal(mode, item = null) {
    form.dataset.mode = mode;
    modalTitle.textContent = mode === "edit" ? "Edit Lahan" : "Tambah Lahan";
    submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";

    idInput.value = item?.id || "";
    namaInput.value = item?.nama_lahan || "";
    lokasiInput.value = item?.lokasi || "";
    luasInput.value = item?.luas_lahan || "";
    statusInput.value = item?.status_lahan || "aktif";
    latitudeInput.value = item?.latitude || "";
    longitudeInput.value = item?.longitude || "";
    polygonInput.value = item?.polygon_area || "";

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

      await loadLahan();
      closeModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";
    }
  }

  async function disableLahan() {
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

      await loadLahan();
      closeDeleteModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    }
  }

  document
    .querySelector("[data-lahan-open-create]")
    ?.addEventListener("click", () => openModal("create"));

  document.querySelectorAll("[data-lahan-close-modal]").forEach((button) => {
    button.addEventListener("click", closeModal);
  });

  document
    .querySelector("[data-lahan-close-delete]")
    ?.addEventListener("click", closeDeleteModal);

  document
    .querySelector("[data-lahan-confirm-delete]")
    ?.addEventListener("click", disableLahan);

  tableBody.addEventListener("click", (event) => {
    const editButton = event.target.closest("[data-lahan-edit]");
    const deleteButton = event.target.closest("[data-lahan-delete]");

    if (editButton) {
      const item = lahanList.find(
        (lahan) => String(lahan.id) === editButton.dataset.lahanEdit,
      );

      if (item) {
        openModal("edit", item);
      }
    }

    if (deleteButton) {
      openDeleteModal(deleteButton.dataset.lahanDelete);
    }
  });

  form.addEventListener("submit", submitForm);
  loadLahan();
});
