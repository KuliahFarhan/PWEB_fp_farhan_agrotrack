(function () {
  const button = document.getElementById("generatePdfBtn") || document.getElementById("exportPdfBtn");
  if (!button) return;

  function getRows(table) {
    return Array.from(table.querySelectorAll("tbody tr")).map((row) =>
      Array.from(row.children).map((cell) => cell.innerText.trim())
    );
  }

  button.addEventListener("click", () => {
    const jsPDF = window.jspdf && window.jspdf.jsPDF;
    if (!jsPDF) {
      alert("Library PDF belum termuat. Cek koneksi CDN.");
      return;
    }

    const doc = new jsPDF({ orientation: "landscape", unit: "pt", format: "a4" });
    const generatedAt = new Intl.DateTimeFormat("id-ID", {
      dateStyle: "long",
      timeStyle: "short",
    }).format(new Date());

    doc.setFont("helvetica", "bold");
    doc.setFontSize(18);
    doc.text("AgroTrack - Laporan Seluruh Data", 40, 42);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(10);
    doc.text(`Dibuat pada ${generatedAt}`, 40, 60);

    let startY = 84;
    document.querySelectorAll(".report-section").forEach((section) => {
      const title = section.querySelector("h2").innerText.trim();
      const table = section.querySelector("table");
      const headers = Array.from(table.querySelectorAll("thead th")).map((th) => th.innerText.trim());

      doc.setFont("helvetica", "bold");
      doc.setFontSize(12);
      doc.text(title, 40, startY);

      doc.autoTable({
        head: [headers],
        body: getRows(table),
        startY: startY + 10,
        theme: "grid",
        styles: { fontSize: 8, cellPadding: 5 },
        headStyles: { fillColor: [0, 66, 49], textColor: 255 },
        margin: { left: 40, right: 40 },
      });

      startY = doc.lastAutoTable.finalY + 28;
      if (startY > 500) {
        doc.addPage();
        startY = 42;
      }
    });

    doc.save("laporan-agrotrack-admin.pdf");
  });
})();
