# Routes Plan

P03B uses plain `.html` pages for static UI preview. There is no PHP page routing layer.

Static pages:

- `public/index.html`
- `public/login.html`
- `public/register.html`
- `public/forgot-password.html`
- `public/petani/dashboard.html`
- `public/petani/lahan.html`
- `public/petani/peta-lahan.html`
- `public/petani/musim-tanam.html`
- `public/petani/biaya-produksi.html`
- `public/petani/hasil-panen.html`
- `public/petani/analisis.html`
- `public/petani/laporan.html`
- `public/petani/profil.html`
- `public/admin/dashboard.html`
- `public/admin/users.html`
- `public/admin/tanaman.html`
- `public/admin/monitoring-lahan.html`
- `public/admin/laporan.html`
- `public/admin/profil.html`

Future PHP backend endpoints:

- `app/auth/login.php`
- `app/auth/register.php`
- `app/auth/logout.php`
- `app/api/session.php`
- `app/api/tanaman.php`
- `app/actions/tanaman/create.php`
- `app/actions/tanaman/update.php`
- `app/actions/tanaman/delete.php`

Planned PHP backend endpoints:

- `app/actions/lahan/*`
- `app/actions/musim-tanam/*`
- `app/actions/biaya/*`
- `app/actions/panen/*`
- `app/api/dashboard.php`
- `app/api/lahan.php`
- `app/api/laporan.php`
