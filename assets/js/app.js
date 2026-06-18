(function () {
  const petaniNav = [
    ["dashboard", "Dashboard", "dashboard.php", "dashboard"],
    ["agriculture", "Lahan", "lahan.php", "lahan"],
    ["map", "Peta Lahan", "peta-lahan.php", "peta"],
    ["calendar_today", "Musim Tanam", "musim-tanam.php", "musim"],
    ["payments", "Biaya Produksi", "biaya-produksi.php", "biaya"],
    ["receipt_long", "Hasil Panen", "hasil-panen.php", "panen"],
    ["analytics", "Analisis", "analisis.php", "analisis"],
    ["account_circle", "Profil", "profil.php", "profil"],
  ];

  const adminNav = [
    ["dashboard", "Dashboard", "dashboard.php", "admin-dashboard"],
    ["groups", "Data Pengguna", "data-pengguna.php", "pengguna"],
    ["psychiatry", "Data Tanaman", "tanaman.php", "tanaman"],
    ["monitoring", "Monitoring Lahan", "monitoring-lahan.php", "monitoring"],
    ["summarize", "Laporan", "laporan.php", "laporan"],
    ["manage_accounts", "Profil Admin", "profil.php", "profil"],
  ];

  function byId(id) {
    return document.getElementById(id);
  }


  function toast(message) {
    const existing = document.querySelector(".toast-lite");
    if (existing) existing.remove();

    const node = document.createElement("div");
    node.className = "toast-lite";
    node.textContent = message;
    document.body.appendChild(node);
    setTimeout(() => node.remove(), 2600);
  }

  function renderSidebar() {
    const portal = document.body.dataset.portal;
    const target = byId("appSidebar");
    if (!portal || !target) return;

    const base = document.body.dataset.base || "";
    const active = document.body.dataset.active || "";
    const nav = portal === "admin" ? adminNav : petaniNav;
    const portalLabel = portal === "admin" ? "Administrator" : "Farmer Portal";
    const profileName = portal === "admin" ? "Admin Root" : "Pak Budi Santoso";
    const profileRole = portal === "admin" ? "Super Admin" : "Petani Utama";
    const home = portal === "admin" ? `${base}pages/admin/dashboard.php` : `${base}pages/petani/dashboard.php`;
    const logoSrc = `${base}assets/image/logo/logo_agrotrack.png`;
    const profileSrc = portal === "admin"
      ? `${base}assets/image/profil/foto_profil_6.jpg`
      : `${base}assets/image/profil/farmer-profile.jpg`;

    const items = nav
      .map(([icon, label, href, key]) => {
        const isActive = key === active;
        return `
          <a class="sidebar-link ${isActive ? "active" : ""}" href="${href}" aria-current="${isActive ? "page" : "false"}">
            <span class="material-symbols-outlined">${icon}</span>
            <span>${label}</span>
          </a>
        `;
      })
      .join("");

    target.innerHTML = `
      <aside class="app-sidebar" aria-label="Navigasi ${portalLabel}">
        <a class="d-flex align-items-center gap-2" href="${home}">
          <img class="brand-logo" src="${logoSrc}" alt="Logo AgroTrack" />
          <span>
            <strong class="d-block fs-5">AgroTrack</strong>
            <small class="text-white-50">${portalLabel}</small>
          </span>
        </a>
        <nav class="sidebar-nav">${items}</nav>
        <div class="sidebar-footer">
          <div class="d-flex align-items-center gap-2 mb-3">
            <img class="profile-avatar" src="${profileSrc}" alt="Foto profil ${profileName}" />
            <span>
              <strong class="d-block">${profileName}</strong>
              <small class="text-white-50">${profileRole}</small>
            </span>
          </div>
          <a class="sidebar-link" href="${base}auth/logout.php" data-logout-link>
            <span class="material-symbols-outlined">logout</span>
            <span>Keluar</span>
          </a>
        </div>
      </aside>
      <button class="sidebar-backdrop border-0" type="button" aria-label="Tutup menu"></button>
    `;
  }

  function bindSidebarToggle() {
    const updateSidebarToggleState = () => {
      const collapsed = document.body.classList.contains("sidebar-collapsed");
      const open = document.body.classList.contains("sidebar-open");
      document.querySelectorAll("[data-sidebar-toggle]").forEach((node) => {
        const icon = node.querySelector(".material-symbols-outlined");
        if (!icon) return;
        if (window.innerWidth <= 991) {
          icon.textContent = open ? "close" : "menu";
          node.setAttribute("aria-label", open ? "Tutup sidebar" : "Buka sidebar");
          return;
        }
        icon.textContent = collapsed ? "left_panel_open" : "left_panel_close";
        node.setAttribute("aria-label", collapsed ? "Buka sidebar" : "Tutup sidebar");
      });
    };

    document.querySelectorAll("[data-sidebar-toggle], .sidebar-backdrop").forEach((node) => {
      node.addEventListener("click", () => {
        if (window.innerWidth <= 991) {
          document.body.classList.toggle("sidebar-open");
          updateSidebarToggleState();
          return;
        }
        document.body.classList.toggle("sidebar-collapsed");
        updateSidebarToggleState();
      });
    });

    window.addEventListener("resize", updateSidebarToggleState);
    updateSidebarToggleState();
  }

  function bindAvatarPreview() {
    const pairs = [
      ["adminProfilePhotoInput", "adminProfilePreview"],
      ["petaniProfilePhotoInput", "petaniProfilePreview"],
    ];
    pairs.forEach(([inputId, previewId]) => {
      const input = byId(inputId);
      const preview = byId(previewId);
      if (!input || !preview) return;
      input.addEventListener("change", () => {
        const file = input.files && input.files[0];
        if (!file) return;
        preview.src = URL.createObjectURL(file);
        toast("Preview foto profil diperbarui.");
      });
    });
  }

  function bindAuthForms() {
    const loginForm = byId("loginForm");
    if (loginForm) {
      loginForm.addEventListener("submit", (event) => {
        event.preventDefault();
        toast("Login demo dinonaktifkan. Gunakan halaman login PHP AgroTrack.");
        setTimeout(() => (window.location.href = "auth/login.php"), 700);
      });
    }

    const registerForm = byId("registerForm");
    if (registerForm) {
      registerForm.addEventListener("submit", (event) => {
        event.preventDefault();
        toast("Akun contoh berhasil dibuat. Silakan lanjut masuk.");
        setTimeout(() => (window.location.href = "login.php"), 900);
      });
    }

    const forgotForm = byId("forgotForm");
    if (forgotForm) {
      forgotForm.addEventListener("submit", (event) => {
        event.preventDefault();
        const data = new FormData(forgotForm);
        const password = data.get("password");
        const confirmPassword = data.get("confirm_password");

        if (password !== confirmPassword) {
          toast("Konfirmasi kata sandi belum sama.");
          return;
        }

        toast("Kata sandi demo berhasil diganti. Silakan login kembali.");
        setTimeout(() => (window.location.href = "login.php"), 1000);
      });
    }
  }

  function bindTableFilter() {
    document.querySelectorAll("[data-table-search]").forEach((input) => {
      const table = document.querySelector(input.dataset.tableSearch);
      if (!table) return;

      input.addEventListener("input", () => {
        const keyword = input.value.trim().toLowerCase();
        table.querySelectorAll("tbody tr").forEach((row) => {
          row.hidden = keyword && !row.textContent.toLowerCase().includes(keyword);
        });
      });
    });
  }

  function bindDemoButtons() {
    document.querySelectorAll("[data-demo-action]").forEach((button) => {
      button.addEventListener("click", () => toast(button.dataset.demoAction || "Aksi demo berjalan."));
    });
  }

  function bindLogoutConfirmation() {
    document.querySelectorAll("[data-logout-link]").forEach((link) => {
      link.addEventListener("click", (event) => {
        event.preventDefault();
        const target = link.getAttribute("href") || "auth/logout.php";
        const overlay = document.createElement("div");
        overlay.className = "confirm-overlay";
        overlay.innerHTML = `
          <section class="confirm-dialog" role="dialog" aria-modal="true" aria-labelledby="logoutTitle">
            <div class="confirm-icon"><span class="material-symbols-outlined">priority_high</span></div>
            <h2 id="logoutTitle">Yakin ingin logout?</h2>
            <p>Sesi AgroTrack akan ditutup dan kamu perlu login lagi untuk masuk.</p>
            <div class="confirm-actions">
              <button class="btn btn-primary" type="button" data-confirm-yes>Ya, logout</button>
              <button class="btn btn-danger" type="button" data-confirm-no>Batal</button>
            </div>
          </section>
        `;

        document.body.appendChild(overlay);
        overlay.querySelector("[data-confirm-no]").addEventListener("click", () => overlay.remove());
        overlay.querySelector("[data-confirm-yes]").addEventListener("click", () => {
          window.location.href = target;
        });
        overlay.addEventListener("click", (clickEvent) => {
          if (clickEvent.target === overlay) overlay.remove();
        });
      });
    });
  }

  function bindSelectableAssets() {
    document.querySelectorAll(".selectable-asset[data-select-value]").forEach((card) => {
      card.addEventListener("click", () => {
        const value = card.dataset.selectValue;
        const select = byId("komoditasSelect");

        document.querySelectorAll(".selectable-asset[data-select-value]").forEach((item) => {
          item.classList.toggle("active", item === card);
        });

        if (select) {
          select.value = value;
        }

        toast(`Komoditas ${value} dipilih.`);
      });
    });

    const komoditasSelect = byId("komoditasSelect");
    if (komoditasSelect) {
      komoditasSelect.addEventListener("change", () => {
        const value = komoditasSelect.value;
        document.querySelectorAll(".selectable-asset[data-select-value]").forEach((item) => {
          item.classList.toggle("active", item.dataset.selectValue === value);
        });
      });
    }
  }

  function bindProductPicker() {
    const productName = byId("productName");
    const productCategory = byId("productCategory");
    const productQty = byId("productQty");
    const productPrice = byId("productPrice");
    const productTotal = byId("productTotal");
    const productNote = byId("productNote");

    function updateTotal() {
      if (!productQty || !productPrice || !productTotal) return;
      const qty = Number(productQty.value || 0);
      const price = Number(productPrice.value || 0);
      const total = qty * price;
      productTotal.value = new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        maximumFractionDigits: 0,
      }).format(total);
    }

    document.querySelectorAll("[data-product-card]").forEach((card) => {
      card.addEventListener("click", () => {
        document.querySelectorAll("[data-product-card]").forEach((item) => item.classList.remove("active"));
        card.classList.add("active");

        if (productName) productName.value = card.dataset.name || "";
        if (productCategory) productCategory.value = card.dataset.category || "";
        if (productQty) productQty.value = card.dataset.defaultQty || 1;
        if (productPrice) productPrice.value = card.dataset.price || 0;
        if (productNote) productNote.value = card.dataset.note || "";
        updateTotal();
        toast(`${card.dataset.name || "Produk"} masuk ke form biaya.`);
      });
    });

    if (productQty) productQty.addEventListener("input", updateTotal);
    if (productPrice) productPrice.addEventListener("input", updateTotal);
    updateTotal();
  }

  function bindProfileForms() {
    document.querySelectorAll("[data-profile-form]").forEach((form) => {
      form.addEventListener("submit", (event) => {
        event.preventDefault();
        toast("Profil demo berhasil diperbarui.");
      });
    });

    document.querySelectorAll("[data-avatar-input]").forEach((input) => {
      input.addEventListener("change", () => {
        const file = input.files && input.files[0];
        const preview = document.querySelector(input.dataset.avatarInput);
        if (!file || !preview) return;
        preview.src = URL.createObjectURL(file);
        toast("Foto profil siap dipakai.");
      });
    });
  }

  function stampDate() {
    document.querySelectorAll("[data-today]").forEach((node) => {
      node.textContent = new Intl.DateTimeFormat("id-ID", {
        day: "2-digit",
        month: "long",
        year: "numeric",
      }).format(new Date());
    });
  }

  function warmupServer() {
    const url = document.body.dataset.warmupUrl;
    if (!url || !window.fetch) return;

    const run = () => {
      fetch(url, {
        method: "GET",
        credentials: "same-origin",
        cache: "no-store",
        keepalive: true,
        headers: { Accept: "application/json" },
      }).catch(() => {});
    };

    if ("requestIdleCallback" in window) {
      window.requestIdleCallback(run, { timeout: 1800 });
      return;
    }

    window.setTimeout(run, 900);
  }

  function prefetchLikelyPages() {
    const urls = (document.body.dataset.prefetchUrls || "")
      .split(",")
      .map((url) => url.trim())
      .filter(Boolean);
    if (!urls.length || !window.fetch) return;

    const run = () => {
      urls.forEach((url) => {
        fetch(url, {
          method: "GET",
          credentials: "same-origin",
          cache: "force-cache",
          priority: "low",
        }).catch(() => {});
      });
    };

    if ("requestIdleCallback" in window) {
      window.requestIdleCallback(run, { timeout: 2400 });
      return;
    }

    window.setTimeout(run, 1400);
  }

  renderSidebar();
  bindSidebarToggle();
  bindAuthForms();
  bindTableFilter();
  bindDemoButtons();
  bindLogoutConfirmation();
  bindSelectableAssets();
  bindProductPicker();
  bindProfileForms();
  bindAvatarPreview();
  stampDate();
  warmupServer();
  prefetchLikelyPages();
})();
