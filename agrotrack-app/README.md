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
├── public/
│   ├── index.php
│   └── assets/
├── app/
│   ├── Controllers/
│   ├── Models/
│   ├── Middleware/
│   ├── Helpers/
│   └── Services/
├── config/
├── database/
├── resources/
│   ├── views/
│   ├── layouts/
│   ├── partials/
│   └── components/
├── routes/
├── storage/
└── docs/
```

## Running Later

After implementation starts, the app can be run with a local PHP server:

```bash
php -S localhost:8000 -t public
```

Or through XAMPP by placing the project in the web server directory and opening:

```text
http://localhost/agrotrack-app/public
```

Database setup, routing, authentication, CRUD, Leaflet maps, and Chart.js dashboards will be added in later tasks.
