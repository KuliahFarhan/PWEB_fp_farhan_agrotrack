document.addEventListener("DOMContentLoaded", () => {
  const tableBody = document.querySelector("[data-panen-table]");
  const emptyState = document.querySelector("[data-panen-empty]");
  const alertBox = document.querySelector("[data-panen-alert]");
  const modal = document.querySelector("[data-panen-modal]");
  const deleteModal = document.querySelector("[data-panen-delete-modal]");
  const form = document.querySelector("[data-panen-form]");

  if (!tableBody || !form) {
    return;
  }

  const revenueValue = document.querySelector("[data-panen-revenue]");
  const costValue = document.querySelector("[data-panen-cost]");
  const profitValue = document.querySelector("[data-panen-profit]");
  const countValue = document.querySelector("[data-panen-count]");
  const modalTitle = document.querySelector("[data-panen-modal-title]");
  const idInput = document.querySelector("[data-panen-id]");
  const musimInput = document.querySelector("[data-panen-musim]");
  const musimWrapper = document.querySelector("[data-panen-musim-wrapper]");
  const totalInput = document.querySelector("[data-panen-total]");
  const satuanInput = document.querySelector("[data-panen-satuan]");
  const hargaInput = document.querySelector("[data-panen-harga]");
  const catatanInput = document.querySelector("[data-panen-catatan]");
  const submitButton = document.querySelector("[data-panen-submit]");
  const deleteIdInput = document.querySelector("[data-panen-delete-id]");
  let panenList = [];
  let musimOptions = [];

  const endpoints = {
    list: "../../app/api/panen.php",
    create: "../../app/actions/panen/create.php",
    update: "../../app/actions/panen/update.php",
    delete: "../../app/actions/panen/delete.php",
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

  function formatNumber(value) {
    return Number(value || 0).toLocaleString("id-ID", {
      maximumFractionDigits: 2,
    });
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

  function profitBadge(value) {
    const profit = Number(value || 0);

    if (profit > 0) {
      return '<span class="rounded-full bg-teal-50 px-3 py-1 text-xs font-black text-teal-700">Untung</span>';
    }

    if (profit < 0) {
      return '<span class="rounded-full bg-red-50 px-3 py-1 text-xs font-black text-red-700">Rugi</span>';
    }

    return '<span class="rounded-full bg-slate-100 px-3 py-1 text-xs font-black text-slate-600">Impas</span>';
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

  function seasonLabel(item) {
    return `${item.nama_lahan} - ${item.nama_tanaman} (${formatDate(item.tanggal_tanam)})`;
  }

  function setLoading(message = "Memuat data hasil panen...") {
    tableBody.innerHTML = `
      <tr>
        <td colspan="8" class="text-center text-slate-500">${message}</td>
      </tr>
    `;
  }

  function renderOptions() {
    musimInput.innerHTML =
      '<option value="">Pilih musim tanam</option>' +
      musimOptions
        .map((item) => {
          const disabled = item.hasil_panen_id ? "disabled" : "";
          const suffix = item.hasil_panen_id ? " - sudah panen" : "";

          return `<option value="${item.id}" ${disabled}>${escapeHtml(seasonLabel(item))}${suffix}</option>`;
        })
        .join("");
  }

  function renderSummary(summary) {
    revenueValue.textContent = rupiah(summary.total_pendapatan || 0);
    costValue.textContent = rupiah(summary.total_biaya || 0);
    profitValue.textContent = rupiah(summary.total_keuntungan || 0);
    countValue.textContent = String(summary.total_records || 0);
  }

  function renderTable(items) {
    panenList = items;
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
            <td>${formatNumber(item.total_hasil)} ${escapeHtml(item.satuan)}</td>
            <td>${rupiah(item.harga_jual)}</td>
            <td>${rupiah(item.total_pendapatan)}</td>
            <td>${rupiah(item.total_biaya)}</td>
            <td><strong>${rupiah(item.total_keuntungan)}</strong></td>
            <td>${profitBadge(item.total_keuntungan)}</td>
            <td>
              <div class="flex flex-wrap gap-2">
                <button class="rounded-md border border-slate-200 px-3 py-2 text-xs font-black text-slate-700" type="button" data-panen-edit="${item.id}">
                  Edit
                </button>
                <button class="rounded-md border border-red-200 px-3 py-2 text-xs font-black text-red-600" type="button" data-panen-delete="${item.id}">
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

  async function loadPanen() {
    hideAlert();
    setLoading();

    try {
      const response = await fetch(endpoints.list, {
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);
      musimOptions = payload.options?.musim_tanam || [];
      renderOptions();
      renderSummary(payload.summary || {});
      renderTable(payload.data || []);
    } catch (error) {
      tableBody.innerHTML = `
        <tr>
          <td colspan="8" class="text-center text-red-600">${escapeHtml(error.message)}</td>
        </tr>
      `;
    }
  }

  function openModal(mode, item = null) {
    form.dataset.mode = mode;
    modalTitle.textContent =
      mode === "edit" ? "Edit Hasil Panen" : "Tambah Hasil Panen";
    submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";

    idInput.value = item?.id || "";
    musimInput.value = item?.musim_tanam_id || "";
    totalInput.value = item?.total_hasil || "";
    satuanInput.value = item?.satuan || "kg";
    hargaInput.value = item?.harga_jual || "";
    catatanInput.value = item?.catatan || "";
    musimWrapper.classList.toggle("hidden", mode === "edit");
    musimInput.disabled = mode === "edit";

    modal.classList.remove("hidden");
    modal.classList.add("flex");
    (mode === "edit" ? totalInput : musimInput).focus();
  }

  function closeModal() {
    modal.classList.add("hidden");
    modal.classList.remove("flex");
    form.reset();
    idInput.value = "";
    musimInput.disabled = false;
    musimWrapper.classList.remove("hidden");
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

    const formData = new FormData(form);

    if (mode === "edit") {
      formData.delete("musim_tanam_id");
    }

    try {
      const response = await fetch(endpoint, {
        method: "POST",
        body: formData,
        credentials: "same-origin",
      });
      const payload = await parseResponse(response);

      await loadPanen();
      closeModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = mode === "edit" ? "Perbarui" : "Simpan";
    }
  }

  async function deletePanen() {
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

      await loadPanen();
      closeDeleteModal();
      showAlert(payload.message, "success");
    } catch (error) {
      showAlert(error.message, "error");
    }
  }

  document
    .querySelector("[data-panen-open-create]")
    ?.addEventListener("click", () => openModal("create"));

  document.querySelectorAll("[data-panen-close-modal]").forEach((button) => {
    button.addEventListener("click", closeModal);
  });

  document
    .querySelector("[data-panen-close-delete]")
    ?.addEventListener("click", closeDeleteModal);

  document
    .querySelector("[data-panen-confirm-delete]")
    ?.addEventListener("click", deletePanen);

  tableBody.addEventListener("click", (event) => {
    const editButton = event.target.closest("[data-panen-edit]");
    const deleteButton = event.target.closest("[data-panen-delete]");

    if (editButton) {
      const item = panenList.find(
        (panen) => String(panen.id) === editButton.dataset.panenEdit,
      );

      if (item) {
        openModal("edit", item);
      }
    }

    if (deleteButton) {
      openDeleteModal(deleteButton.dataset.panenDelete);
    }
  });

  form.addEventListener("submit", submitForm);
  loadPanen();
});
