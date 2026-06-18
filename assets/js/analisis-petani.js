(function () {
  const button = document.getElementById("exportAnalysisPdfBtn");
  if (!button) return;

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
        // Some PDF viewers only open preview and ignore direct print calls.
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
    doc.line(40, 72, 555, 72);
  }

  function addFooter(doc) {
    const pageCount = doc.getNumberOfPages();
    for (let i = 1; i <= pageCount; i += 1) {
      doc.setPage(i);
      doc.setFont("helvetica", "normal");
      doc.setFontSize(8);
      doc.setTextColor(100);
      doc.text("AgroTrack - Analisis Petani", 40, 812);
      doc.text(`Halaman ${i} dari ${pageCount}`, 555, 812, { align: "right" });
      doc.setTextColor(0);
    }
  }

  function section(doc, title, description, startY) {
    let y = startY;
    if (y > 760) {
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
      doc.text(description, 40, y + 12, { maxWidth: 515 });
      doc.setTextColor(0);
      return y + 26;
    }
    return y + 14;
  }

  function table(doc, title, description, headers, body, startY, options = {}) {
    const y = section(doc, title, description, startY);
    doc.autoTable({
      head: [headers],
      body: body.length ? body : [headers.map(() => "-")],
      startY: y,
      theme: "grid",
      styles: { fontSize: options.fontSize || 7.5, cellPadding: 4, overflow: "linebreak", valign: "top" },
      headStyles: { fillColor: [16, 63, 49], textColor: 255, fontStyle: "bold" },
      alternateRowStyles: { fillColor: [246, 248, 251] },
      margin: { left: 40, right: 40 },
      columnStyles: options.columnStyles || {},
    });
    return doc.lastAutoTable.finalY + 24;
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
    const detail = window.agroAnalysisDetail || {};
    const lahan = detail.lahan || [];
    const biayaDetail = detail.biaya || [];
    const panen = detail.panen || [];
    const user = detail.user || {};
    const generatedAt = new Intl.DateTimeFormat("id-ID", { dateStyle: "long", timeStyle: "short" }).format(new Date());

    if (typeof doc.autoTable !== "function") {
      alert("Plugin tabel PDF belum termuat. Pastikan jspdf-autotable berhasil dimuat.");
      return;
    }

    addHeader(
      doc,
      "AgroTrack - Analisis Petani",
      `Dibuat pada ${generatedAt} untuk ${user.name || "Petani AgroTrack"}`
    );

    let y = 94;
    y = table(
      doc,
      "1. Profil dan Ringkasan",
      "Ringkasan performa finansial berdasarkan data lahan, biaya, musim tanam, dan hasil panen.",
      ["Metrik", "Nilai"],
      [
        ["Nama petani", cell(user.name)],
        ["Email", cell(user.email)],
        ["Komoditas utama", cell(user.main_crop)],
        ["Total lahan", numberId(summary.total_lahan)],
        ["Total luas lahan", `${numberId(summary.total_luas_ha, 2)} Ha`],
        ["Musim aktif", numberId(summary.musim_aktif)],
        ["Total biaya", rupiah(summary.total_biaya)],
        ["Total pendapatan", rupiah(summary.total_pendapatan)],
        ["Total profit", rupiah(summary.total_profit)],
      ],
      y,
      { columnStyles: { 0: { cellWidth: 180 }, 1: { cellWidth: 260 } } }
    );

    y = table(
      doc,
      "2. Detail Lahan",
      "Daftar lahan milik petani beserta status, komoditas, luas manual, dan luas polygon.",
      ["Lahan", "Kode", "Komoditas", "Tanaman", "Lokasi", "Status", "Luas Manual", "Luas Polygon"],
      lahan.map((row) => [
        cell(row.nama_lahan),
        cell(row.kode_lahan),
        cell(row.komoditas),
        cell(row.tanaman),
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
      "3. Biaya per Kategori",
      "Agregasi biaya produksi dan biaya operasional berdasarkan kategori.",
      ["Kategori", "Total Biaya", "Porsi"],
      biaya.map((row) => {
        const total = Number(row.total || 0);
        const grandTotal = Number(summary.total_biaya || 0);
        return [cell(row.kategori), rupiah(total), grandTotal ? `${numberId((total / grandTotal) * 100, 1)}%` : "0%"];
      }),
      y
    );

    y = table(
      doc,
      "4. Profit per Musim Tanam",
      "Perbandingan biaya, pendapatan, profit, dan margin per musim tanam.",
      ["Musim", "Biaya", "Pendapatan", "Profit", "Margin"],
      musim.map((row) => {
        const biayaValue = Number(row.biaya || 0);
        const pendapatan = Number(row.pendapatan || 0);
        const profit = pendapatan - biayaValue;
        const margin = pendapatan ? `${numberId((profit / pendapatan) * 100, 1)}%` : "0%";
        return [cell(row.kode_musim), rupiah(biayaValue), rupiah(pendapatan), rupiah(profit), margin];
      }),
      y
    );

    y = table(
      doc,
      "5. Detail Biaya",
      "Maksimal 300 catatan biaya terbaru dari biaya produksi dan biaya operasional.",
      ["Tanggal", "Sumber", "Kategori", "Item", "Lahan", "Musim", "Jumlah", "Satuan", "Harga", "Total"],
      biayaDetail.map((row) => [
        dateId(row.tanggal),
        cell(row.sumber),
        cell(row.kategori),
        cell(row.nama_item),
        cell(row.nama_lahan),
        cell(row.kode_musim),
        numberId(row.jumlah, 2),
        cell(row.satuan),
        rupiah(row.harga_satuan),
        rupiah(row.total_biaya),
      ]),
      y,
      { fontSize: 6.2 }
    );

    table(
      doc,
      "6. Detail Hasil Panen",
      "Riwayat hasil panen, harga jual, pendapatan, kualitas, dan pembeli.",
      ["Tanggal", "Lahan", "Musim", "Komoditas", "Berat", "Harga/Kg", "Pendapatan", "Kualitas", "Status", "Pembeli"],
      panen.map((row) => [
        dateId(row.tanggal_panen),
        cell(row.nama_lahan),
        cell(row.kode_musim),
        cell(row.komoditas),
        `${numberId(row.berat_kg, 2)} kg`,
        rupiah(row.harga_per_kg),
        rupiah(row.total_pendapatan),
        cell(row.kualitas),
        cell(row.status),
        cell(row.pembeli),
      ]),
      y,
      { fontSize: 6.2 }
    );

    addFooter(doc);
    printPdf(doc, "analisis-agrotrack-petani.pdf");
  });
})();
