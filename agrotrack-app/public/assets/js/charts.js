// Future Chart.js integration placeholder.
// Static HTML pages mark chart containers with [data-chart-placeholder].
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-chart-placeholder]').forEach((chart) => {
        chart.setAttribute('aria-label', 'Chart.js placeholder');
    });
});
