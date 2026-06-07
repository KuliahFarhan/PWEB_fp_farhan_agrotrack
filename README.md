# AgroTrack

AgroTrack is a Web Programming Final Project for agricultural land monitoring, planting season management, production cost tracking, harvest tracking, and profit analysis.

## Tech Stack

- HTML
- CSS
- JavaScript
- Native/plain PHP for backend processing later
- MySQL later
- Tailwind CSS CDN for static UI skeleton
- Leaflet and Chart.js later

## Framework Policy

This project does not use Laravel or any PHP framework. PHP is reserved for future backend processing such as authentication, CRUD actions, API endpoints, session helpers, and database configuration.

## Current Structure

```text
PWEB_fp_farhan_agrotrack/
|-- public/
|   |-- index.html
|   |-- login.html
|   |-- register.html
|   |-- forgot-password.html
|   |-- petani/
|   |-- admin/
|   `-- assets/
|       |-- css/app.css
|       |-- js/app.js
|       |-- js/map.js
|       |-- js/charts.js
|       |-- images/
|       |-- icons/
|       `-- logo/
|-- app/
|   |-- auth/
|   |-- actions/
|   |-- api/
|   |-- config/
|   `-- helpers/
|-- database/
|-- docs/
|-- figma-export/
|-- prd.md
|-- figma.md
`-- README.md
```

## Preview Static UI

The UI pages are plain `.html` files and can be opened directly in a browser:

```text
public/index.html
public/login.html
public/petani/dashboard.html
public/admin/dashboard.html
```

Or run a local server from inside `public`:

```bash
python -m http.server 8000
```

Then open:

```text
http://localhost:8000/index.html
```

With XAMPP, place the project in the web server directory and open:

```text
http://localhost/PWEB_fp_farhan_agrotrack/public/index.html
```

## Database Connection Test

`app/config/database.php` provides a reusable native PHP PDO connection through:

```php
getDatabaseConnection()
```

Default local database settings:

```text
host: 127.0.0.1
database: agrotrack
username: root
password: empty
charset: utf8mb4
```

You can override these values with environment variables:

```text
DB_HOST
DB_PORT
DB_DATABASE
DB_USERNAME
DB_PASSWORD
DB_CHARSET
```

To test the connection with XAMPP/Apache, make sure MySQL is running and open:

```text
http://localhost/PWEB_fp_farhan_agrotrack/app/api/db-test.php
```

If using PHP's built-in server from the project root:

```bash
C:\xampp\php\php.exe -S localhost:8000
```

Then open:

```text
http://localhost:8000/app/api/db-test.php
```

The endpoint returns JSON and does not expose database credentials.

## Authentication Test

Native PHP auth handlers:

```text
app/auth/register.php
app/auth/login.php
app/auth/logout.php
app/auth/guard.php
app/api/session.php
```

Demo accounts:

```text
admin@agrotrack.test / password
petani@agrotrack.test / password
```

If your local database was imported before P06, update demo password hashes:

```bash
/c/xampp/mysql/bin/mysql.exe -u root agrotrack -e "UPDATE users SET password = '\$2y\$10\$Bh6.HdO5VGg6MfJXrcx56ea5/HtmbkHrjrSgCEot2sw7Deg7GyAUy' WHERE email IN ('admin@agrotrack.test','petani@agrotrack.test');"
```

Run the local PHP server from the project root:

```bash
/c/xampp/php/php.exe -S 127.0.0.1:8000
```

Test register:

```text
http://127.0.0.1:8000/public/register.html
```

Test login:

```text
http://127.0.0.1:8000/public/login.html
```

Test current session:

```text
http://127.0.0.1:8000/app/api/session.php
```

Logout links in the petani/admin static pages point to:

```text
app/auth/logout.php
```

Current limitation: most protected pages are still static `.html`, so full
server-side role protection will be completed gradually when pages become
dynamic PHP/API-driven pages.

## Admin Tanaman CRUD Test

Login as admin:

```text
admin@agrotrack.test / password
```

Open the tanaman management page:

```text
http://127.0.0.1:8000/public/admin/tanaman.html
```

The page loads data from:

```text
app/api/tanaman.php
```

Write actions use native PHP endpoints:

```text
app/actions/tanaman/create.php
app/actions/tanaman/update.php
app/actions/tanaman/delete.php
```

The delete action is a safe delete. It sets `status = nonaktif` so existing
`musim_tanam` references are not broken.

## Petani Lahan CRUD Test

Login as petani:

```text
petani@agrotrack.test / password
```

Open the lahan management page:

```text
http://127.0.0.1:8000/public/petani/lahan.html
```

The page loads only the current petani's land data from:

```text
app/api/lahan.php
```

Write actions use native PHP endpoints:

```text
app/actions/lahan/create.php
app/actions/lahan/update.php
app/actions/lahan/delete.php
```

The lahan `user_id` always comes from the active session. It is never accepted
from user input, so a petani can only view and update their own lahan.

## Petani Peta Lahan Test

Login as petani:

```text
petani@agrotrack.test / password
```

Open the peta lahan page:

```text
http://127.0.0.1:8000/public/petani/peta-lahan.html
```

The page loads active lahan owned by the current petani from:

```text
app/api/lahan.php
```

Map updates are saved through:

```text
app/actions/lahan/update-map.php
```

Click the map to set the marker. Draw a polygon using either the Leaflet Draw
toolbar or the `Gambar Bebas` button, then click `Simpan Peta`. The page
calculates polygon area in square meters, area in hectares, and perimeter in
meters. If a valid polygon exists, the calculated hectares value is sent as
`luas_lahan`. Refresh the page to confirm the saved marker, polygon, and
calculated area reload from the database.

Known note: Peta Lahan freehand drawing and polygon UX can still be polished
later. P10 does not modify map files.

## Petani Musim Tanam CRUD Test

Login as petani:

```text
petani@agrotrack.test / password
```

Open the musim tanam page:

```text
http://127.0.0.1:8000/public/petani/musim-tanam.html
```

The page loads current petani seasons and dropdown options from:

```text
app/api/musim-tanam.php
```

Write actions use native PHP endpoints:

```text
app/actions/musim-tanam/create.php
app/actions/musim-tanam/update.php
app/actions/musim-tanam/delete.php
```

Harvest estimation is calculated server-side as
`tanggal_tanam + tanaman.masa_panen`. Growth progress is calculated from days
elapsed divided by `masa_panen`, capped between 0% and 100%.

## Petani Biaya Produksi CRUD Test

Login as petani:

```text
petani@agrotrack.test / password
```

Open the biaya produksi page:

```text
http://127.0.0.1:8000/public/petani/biaya-produksi.html
```

The page loads production costs and musim tanam dropdown options from:

```text
app/api/biaya.php
```

Write actions use native PHP endpoints:

```text
app/actions/biaya/create.php
app/actions/biaya/update.php
app/actions/biaya/delete.php
```

Total biaya is calculated from `SUM(nominal)` for all biaya owned by the
current petani's musim tanam.

## Current Scope

This project currently has a static UI skeleton, PDO database connection
foundation, native PHP authentication handlers, and admin CRUD for master data
`tanaman`, petani CRUD for `lahan`, and petani Leaflet map saving for lahan
marker/polygon with area and perimeter calculation, plus petani CRUD for
`musim_tanam` and `biaya_produksi`. CRUD for hasil panen, admin monitoring map,
Chart.js database data, and full server-side protection for static pages are
intentionally not implemented yet.
