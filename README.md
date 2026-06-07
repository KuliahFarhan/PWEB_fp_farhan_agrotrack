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

## Current Scope

This project currently has a static UI skeleton and a PDO database connection foundation only. Authentication, session logic, CRUD, Leaflet polygon saving, and Chart.js database data are intentionally not implemented yet.
