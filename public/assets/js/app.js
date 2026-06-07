// AgroTrack static UI helpers.
// Future tasks can replace these placeholders with real toast/modal behavior.
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-static-toast-close]").forEach((button) => {
    button.addEventListener("click", () => {
      button.closest("[data-static-toast]")?.remove();
    });
  });

  const authMessage = document.querySelector("[data-auth-message]");

  if (authMessage) {
    const params = new URLSearchParams(window.location.search);
    const success = params.get("success");
    const error = params.get("error");

    const messages = {
      registered: ["success", "Registrasi berhasil. Silakan login."],
      logged_out: ["success", "Logout berhasil."],
      required: ["error", "Semua field wajib diisi."],
      invalid_email: ["error", "Format email tidak valid."],
      password_min: ["error", "Password minimal 8 karakter."],
      password_mismatch: ["error", "Konfirmasi password tidak sama."],
      email_exists: ["error", "Email sudah digunakan."],
      invalid_credentials: ["error", "Email atau password salah."],
      inactive: ["error", "Akun sedang nonaktif."],
      server: ["error", "Terjadi kendala server. Coba lagi nanti."],
      login_required: ["error", "Silakan login terlebih dahulu."],
      forbidden: ["error", "Anda tidak memiliki akses ke halaman tersebut."],
    };

    const key = success || error;
    const message = key ? messages[key] : null;

    if (message) {
      const [type, text] = message;
      authMessage.className =
        type === "success"
          ? "rounded-md border border-teal-200 bg-teal-50 px-4 py-3 text-sm font-semibold text-teal-800"
          : "rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
      authMessage.textContent = text;
    }
  }
});
