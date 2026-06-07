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
- `app/api/lahan.php`
- `app/actions/tanaman/create.php`
- `app/actions/tanaman/update.php`
- `app/actions/tanaman/delete.php`
- `app/actions/lahan/create.php`
- `app/actions/lahan/update.php`
- `app/actions/lahan/delete.php`
- `app/actions/lahan/update-map.php`
- `app/api/musim-tanam.php`
- `app/actions/musim-tanam/create.php`
- `app/actions/musim-tanam/update.php`
- `app/actions/musim-tanam/delete.php`
- `app/api/biaya.php`
- `app/actions/biaya/create.php`
- `app/actions/biaya/update.php`
- `app/actions/biaya/delete.php`
- `app/api/panen.php`
- `app/actions/panen/create.php`
- `app/actions/panen/update.php`
- `app/actions/panen/delete.php`

Planned PHP backend endpoints:

- `app/api/dashboard.php`
- `app/api/laporan.php`
