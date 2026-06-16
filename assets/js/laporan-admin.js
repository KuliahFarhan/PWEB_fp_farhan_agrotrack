(function () {
  const button = document.getElementById("generatePdfBtn") || document.getElementById("exportPdfBtn");
  if (!button) return;

  function getPdf() {
    return window.jspdf && window.jspdf.jsPDF ? new window.jspdf.jsPDF({ orientation: "landscape", unit: "pt", format: "a4" }) : null;
  }

  function getRows(table) {
    return Array.from(table.querySelectorAll("tbody tr")).map((row) =>
      Array.from(row.children).map((cell) => cell.innerText.trim())
    );
  }

  button.addEventListener("click", () => {
    const doc = getPdf();
    if (!doc) {
      alert("Library PDF belum termuat. Pastikan koneksi CDN aktif lalu refresh halaman.");
      return;
    }
    if (typeof doc.autoTable !== "function") {
      alert("Plugin tabel PDF belum termuat. Pastikan jspdf-autotable berhasil dimuat.");
      return;
    }

    const generatedAt = new Intl.DateTimeFormat("id-ID", { dateStyle: "long", timeStyle: "short" }).format(new Date());
    doc.setFont("helvetica", "bold");
    doc.setFontSize(18);
    doc.text("AgroTrack - Laporan Global Admin", 40, 42);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(10);
    doc.text(`Dibuat pada ${generatedAt}`, 40, 60);

    let startY = 86;
    document.querySelectorAll(".report-section").forEach((section) => {
      const title = section.querySelector("h2")?.innerText.trim() || "Data";
      const table = section.querySelector("table");
      if (!table) return;
      const headers = Array.from(table.querySelectorAll("thead th")).map((th) => th.innerText.trim());
      if (startY > 500) {
        doc.addPage();
        startY = 42;
      }
      doc.setFont("helvetica", "bold");
      doc.setFontSize(12);
      doc.text(title, 40, startY);
      doc.autoTable({
        head: [headers],
        body: getRows(table),
        startY: startY + 12,
        theme: "grid",
        styles: { fontSize: 8, cellPadding: 5, overflow: "linebreak" },
        headStyles: { fillColor: [0, 66, 49], textColor: 255 },
        margin: { left: 40, right: 40 },
      });
      startY = doc.lastAutoTable.finalY + 28;
    });

    doc.save("laporan-agrotrack-admin.pdf");
  });
})();
