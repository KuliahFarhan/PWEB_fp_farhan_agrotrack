// AgroTrack static UI helpers.
// Future tasks can replace these placeholders with real toast/modal behavior.
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-static-toast-close]').forEach((button) => {
        button.addEventListener('click', () => {
            button.closest('[data-static-toast]')?.remove();
        });
    });
});
