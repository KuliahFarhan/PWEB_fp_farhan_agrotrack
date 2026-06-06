# AgroTrack

AgroTrack is a Web Programming Final Project built as a native PHP application for agricultural land monitoring, planting season management, production cost tracking, harvest tracking, and profit analysis.

## Tech Stack

- Native/plain PHP
- MySQL
- HTML, CSS, JavaScript
- Tailwind CSS or Bootstrap
- Leaflet and Leaflet Draw
- Chart.js

## Framework Policy

This project does not use Laravel or any PHP framework. The application will be implemented with native PHP only.

## Folder Structure

```text
agrotrack-app/
|-- public/
|   |-- index.php
|   `-- assets/
|       |-- css/
|       |-- js/
|       |-- images/
|       |-- icons/
|       `-- logo/
|-- app/
|   |-- Controllers/
|   |-- Models/
|   |-- Middleware/
|   |-- Helpers/
|   `-- Services/
|-- config/
|-- database/
|-- resources/
|   |-- views/
|   |-- layouts/
|   |-- partials/
|   `-- components/
|-- routes/
|-- storage/
`-- docs/
```

## Static UI Routes

The current skeleton uses simple query-string routing through `public/index.php`.

Guest:
- `?page=landing`
- `?page=login`
- `?page=register`
- `?page=forgot-password`

Petani:
- `?page=petani-dashboard`
- `?page=petani-lahan`
- `?page=petani-peta-lahan`
- `?page=petani-musim-tanam`
- `?page=petani-biaya-produksi`
- `?page=petani-hasil-panen`
- `?page=petani-analisis`
- `?page=petani-laporan`
- `?page=petani-profil`

Admin:
- `?page=admin-dashboard`
- `?page=admin-users`
- `?page=admin-tanaman`
- `?page=admin-monitoring-lahan`
- `?page=admin-laporan`
- `?page=admin-profil`

## Preview

From inside `agrotrack-app`, run:

```bash
php -S localhost:8000 -t public
```

Then open:

```text
http://localhost:8000/index.php?page=landing
```

With XAMPP, place the project in the web server directory and open:

```text
http://localhost/agrotrack-app/public/index.php?page=landing
```

## Current Scope

This is a static UI skeleton only. Authentication, session logic, database connection, CRUD, Leaflet polygon saving, and Chart.js database data are intentionally not implemented yet.
