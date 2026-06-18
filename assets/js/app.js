(function () {
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
        credentials: "omit",
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
          credentials: "omit",
          cache: "no-store",
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

  bindSidebarToggle();
  bindTableFilter();
  bindLogoutConfirmation();
  bindAvatarPreview();
  stampDate();
  warmupServer();
  prefetchLikelyPages();
})();
