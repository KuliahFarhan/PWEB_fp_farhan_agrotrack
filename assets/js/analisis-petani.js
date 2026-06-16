(function () {
  const button = document.getElementById("exportAnalysisPdfBtn");
  if (!button) return;

  function rupiah(value) {
    return new Intl.NumberFormat("id-ID", { style: "currency", currency: "IDR", maximumFractionDigits: 0 }).format(Number(value || 0));
  }

  button.addEventListener("click", () => {
    const jsPDF = window.jspdf && window.jspdf.jsPDF;
    if (!jsPDF) {
      alert("Library PDF belum termuat. Pastikan koneksi CDN aktif lalu refresh halaman.");
      return;
    }
    const doc = new jsPDF({ orientation: "portrait", unit: "pt", format: "a4" });
    const biaya = window.agroAnalysisBiaya || [];
    const musim = window.agroAnalysisMusim || [];
    const summary = window.agroAnalysisSummary || {};

    doc.setFont("helvetica", "bold");
    doc.setFontSize(18);
    doc.text("AgroTrack - Analisis Petani", 40, 42);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(10);
    doc.text(new Intl.DateTimeFormat("id-ID", { dateStyle: "long", timeStyle: "short" }).format(new Date()), 40, 60);

    doc.setFont("helvetica", "bold");
    doc.setFontSize(12);
    doc.text("Ringkasan", 40, 92);
    doc.setFont("helvetica", "normal");
    doc.text(`Total Biaya: ${rupiah(summary.total_biaya)}`, 40, 114);
    doc.text(`Pendapatan: ${rupiah(summary.total_pendapatan)}`, 40, 132);
    doc.text(`Profit: ${rupiah(summary.total_profit)}`, 40, 150);

    if (typeof doc.autoTable === "function") {
      doc.autoTable({
        startY: 178,
        head: [["Kategori", "Total Biaya"]],
        body: biaya.map((row) => [row.kategori || "-", rupiah(row.total)]),
        theme: "grid",
        headStyles: { fillColor: [0, 66, 49], textColor: 255 },
      });
      doc.autoTable({
        startY: doc.lastAutoTable.finalY + 24,
        head: [["Musim", "Biaya", "Pendapatan", "Profit"]],
        body: musim.map((row) => {
          const biayaValue = Number(row.biaya || 0);
          const pendapatan = Number(row.pendapatan || 0);
          return [row.kode_musim || "-", rupiah(biayaValue), rupiah(pendapatan), rupiah(pendapatan - biayaValue)];
        }),
        theme: "grid",
        headStyles: { fillColor: [0, 66, 49], textColor: 255 },
      });
    } else {
      doc.text("Plugin tabel PDF belum termuat, hanya ringkasan yang dicetak.", 40, 184);
    }

    doc.save("analisis-agrotrack-petani.pdf");
  });
})();
