(function () {
  const button = document.getElementById("generatePdfBtn") || document.getElementById("exportPdfBtn");
  if (!button) return;

  function getPdf() {
    return window.jspdf && window.jspdf.jsPDF
      ? new window.jspdf.jsPDF({ orientation: "landscape", unit: "pt", format: "a4" })
      : null;
  }

  function rupiah(value) {
    return new Intl.NumberFormat("id-ID", {
      style: "currency",
      currency: "IDR",
      maximumFractionDigits: 0,
    }).format(Number(value || 0));
  }

  function numberId(value, digits = 0) {
    return new Intl.NumberFormat("id-ID", {
      minimumFractionDigits: digits,
      maximumFractionDigits: digits,
    }).format(Number(value || 0));
  }

  function dateId(value) {
    if (!value) return "-";
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) return String(value);
    return new Intl.DateTimeFormat("id-ID", { day: "2-digit", month: "short", year: "numeric" }).format(date);
  }

  function cell(value) {
    return value === null || value === undefined || value === "" ? "-" : String(value);
  }

  function printPdf(doc, filename) {
    if (typeof doc.autoPrint === "function") {
      doc.autoPrint();
    }

    const blob = doc.output("blob");
    const url = URL.createObjectURL(blob);
    const printWindow = window.open(url, "_blank");

    if (!printWindow) {
      URL.revokeObjectURL(url);
      alert("Popup print diblokir browser. Izinkan popup untuk membuka preview PDF.");
      return;
    }

    try {
      printWindow.document.title = filename;
    } catch (error) {
      // Some PDF viewers do not expose the document title.
    }
    setTimeout(() => {
      try {
        printWindow.focus();
        printWindow.print();
      } catch (error) {
        // Browser PDF viewers may ignore direct print calls; opening the preview is still useful.
      }
    }, 900);

    setTimeout(() => URL.revokeObjectURL(url), 60000);
  }

  function addHeader(doc, title, subtitle) {
    doc.setFont("helvetica", "bold");
    doc.setFontSize(18);
    doc.text(title, 40, 42);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    doc.text(subtitle, 40, 60);
    doc.setDrawColor(16, 63, 49);
    doc.setLineWidth(1);
    doc.line(40, 72, 802, 72);
  }

  function addFooter(doc) {
    const pageCount = doc.getNumberOfPages();
    for (let i = 1; i <= pageCount; i += 1) {
      doc.setPage(i);
      doc.setFont("helvetica", "normal");
      doc.setFontSize(8);
      doc.setTextColor(100);
      doc.text("AgroTrack - Laporan Global Admin", 40, 570);
      doc.text(`Halaman ${i} dari ${pageCount}`, 760, 570, { align: "right" });
      doc.setTextColor(0);
    }
  }

  function section(doc, title, description, startY) {
    let y = startY;
    if (y > 500) {
      doc.addPage();
      y = 42;
    }
    doc.setFont("helvetica", "bold");
    doc.setFontSize(12);
    doc.text(title, 40, y);
    if (description) {
      doc.setFont("helvetica", "normal");
      doc.setFontSize(8);
      doc.setTextColor(80);
      doc.text(description, 40, y + 12);
      doc.setTextColor(0);
      return y + 22;
    }
    return y + 12;
  }

  function table(doc, title, description, headers, body, startY, options = {}) {
    const y = section(doc, title, description, startY);
    doc.autoTable({
      head: [headers],
      body: body.length ? body : [headers.map(() => "-")],
      startY: y,
      theme: "grid",
      styles: { fontSize: options.fontSize || 7, cellPadding: 4, overflow: "linebreak", valign: "top" },
      headStyles: { fillColor: [16, 63, 49], textColor: 255, fontStyle: "bold" },
      alternateRowStyles: { fillColor: [246, 248, 251] },
      margin: { left: 40, right: 40 },
      columnStyles: options.columnStyles || {},
    });
    return doc.lastAutoTable.finalY + 26;
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

    const report = window.agroAdminReport || {};
    const summary = report.summary || {};
    const users = report.users || [];
    const lahan = report.lahan || [];
    const musim = report.musim || [];
    const katalog = report.katalog || [];
    const biaya = report.biaya || [];
    const generatedAt = new Intl.DateTimeFormat("id-ID", { dateStyle: "long", timeStyle: "short" }).format(new Date());

    addHeader(
      doc,
      "AgroTrack - Laporan Global Admin",
      `Dibuat pada ${generatedAt} oleh ${report.generatedBy || "Admin AgroTrack"}`
    );

    let y = 94;
    y = table(
      doc,
      "1. Ringkasan Sistem",
      "Rekap agregat dari data pengguna, lahan, biaya, panen, dan profit.",
      ["Metrik", "Nilai"],
      [
        ["Total pengguna aktif", numberId(summary.total_users)],
        ["Total petani", numberId(summary.total_petani)],
        ["Total luas lahan", `${numberId(summary.total_luas_ha, 2)} Ha`],
        ["Musim aktif", numberId(summary.musim_aktif)],
        ["Total panen", `${numberId(Number(summary.total_panen_kg || 0) / 1000, 2)} Ton`],
        ["Total biaya", rupiah(summary.total_biaya)],
        ["Total pendapatan", rupiah(summary.total_pendapatan)],
        ["Total profit", rupiah(summary.total_profit)],
      ],
      y,
      { columnStyles: { 0: { cellWidth: 220 }, 1: { cellWidth: 220 } } }
    );

    y = table(
      doc,
      "2. Detail Pengguna",
      "Daftar akun yang tercatat di sistem AgroTrack.",
      ["ID", "Nama", "Email", "Role", "Status", "Dibuat"],
      users.map((row) => [
        cell(row.id),
        cell(row.name),
        cell(row.email),
        cell(row.role),
        cell(row.status),
        dateId(row.created_at),
      ]),
      y
    );

    y = table(
      doc,
      "3. Detail Lahan",
      "Data lahan aktif, termasuk luas manual dan hasil hitung polygon.",
      ["Petani", "Kode", "Lahan", "Komoditas", "Lokasi", "Status", "Luas Manual", "Luas Polygon"],
      lahan.map((row) => [
        cell(row.petani),
        cell(row.kode_lahan),
        cell(row.nama_lahan),
        cell(row.komoditas),
        cell(row.lokasi),
        cell(row.status),
        row.luas ? `${numberId(row.luas, 2)} Ha` : "-",
        row.luas_lahan ? `${numberId(Number(row.luas_lahan) / 10000, 4)} Ha` : "Belum digambar",
      ]),
      y,
      { fontSize: 6.5 }
    );

    y = table(
      doc,
      "4. Detail Musim Tanam",
      "Riwayat musim tanam, tanggal tanam, estimasi panen, fase, progress, dan status.",
      ["Petani", "Musim", "Lahan", "Tanaman", "Tanam", "Estimasi", "Fase", "Progress", "Status"],
      musim.map((row) => [
        cell(row.petani),
        cell(row.kode_musim),
        cell(row.nama_lahan),
        cell(row.tanaman),
        dateId(row.tanggal_tanam),
        dateId(row.estimasi_panen),
        cell(row.fase),
        `${numberId(row.progress)}%`,
        cell(row.status),
      ]),
      y,
      { fontSize: 6.5 }
    );

    y = table(
      doc,
      "5. Ringkasan Katalog Kebutuhan",
      "Jumlah item katalog per kategori dan item yang aktif untuk petani.",
      ["Kategori", "Total Item", "Item Aktif"],
      katalog.map((row) => [cell(row.kategori), numberId(row.total_item), numberId(row.aktif)]),
      y
    );

    table(
      doc,
      "6. Detail Biaya Operasional",
      "Maksimal 250 catatan biaya terbaru yang bersumber dari katalog operasional petani.",
      ["Tanggal", "Petani", "Musim", "Kategori", "Subkategori", "Item", "Jumlah", "Satuan", "Harga", "Total"],
      biaya.map((row) => [
        dateId(row.tanggal),
        cell(row.petani),
        cell(row.kode_musim),
        cell(row.kategori),
        cell(row.subkategori),
        cell(row.nama_item),
        numberId(row.jumlah, 2),
        cell(row.satuan),
        rupiah(row.harga_satuan),
        rupiah(row.total_biaya),
      ]),
      y,
      { fontSize: 6.2 }
    );

    addFooter(doc);
    printPdf(doc, "laporan-agrotrack-admin.pdf");
  });
})();
