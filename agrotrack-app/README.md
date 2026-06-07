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
agrotrack-app/
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

Or run a local server from inside `agrotrack-app/public`:

```bash
python -m http.server 8000
```

Then open:

```text
http://localhost:8000/index.html
```

With XAMPP, place the project in the web server directory and open:

```text
http://localhost/agrotrack-app/public/index.html
```

## Current Scope

This is a static UI skeleton only. Authentication, session logic, database connection, CRUD, Leaflet polygon saving, and Chart.js database data are intentionally not implemented yet.
