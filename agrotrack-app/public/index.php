<?php

declare(strict_types=1);

$rootPath = dirname(__DIR__);
$routes = require $rootPath . '/routes/web.php';

require_once $rootPath . '/resources/components/stat-card.php';
require_once $rootPath . '/resources/components/table-placeholder.php';
require_once $rootPath . '/resources/components/form-field.php';
require_once $rootPath . '/resources/components/alert-toast.php';
require_once $rootPath . '/resources/components/confirmation-modal.php';

function url_for(string $page = 'landing'): string
{
    return 'index.php?page=' . urlencode($page);
}

function asset_path(string $path): string
{
    return 'assets/' . ltrim($path, '/');
}

function e(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}

$page = $_GET['page'] ?? 'landing';

if (!isset($routes[$page])) {
    http_response_code(404);
    $page = 'not-found';
}

$route = $routes[$page];
$viewPath = $rootPath . '/resources/views/' . $route['view'] . '.php';
$layoutPath = $rootPath . '/resources/layouts/' . $route['layout'] . '.php';

if (!is_file($viewPath) || !is_file($layoutPath)) {
    http_response_code(500);
    exit('AgroTrack static view is not configured correctly.');
}

$title = $route['title'];
$activePage = $page;
$layoutData = $route;

ob_start();
require $viewPath;
$content = ob_get_clean();

require $layoutPath;
