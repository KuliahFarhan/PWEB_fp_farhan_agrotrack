// Future Leaflet integration placeholder.
// Static HTML pages mark map containers with [data-map-placeholder].
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-map-placeholder]').forEach((map) => {
        map.setAttribute('aria-label', 'Leaflet map placeholder');
    });
});
