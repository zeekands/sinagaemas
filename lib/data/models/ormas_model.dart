class OrmasModel {
  final bool success;
  final String message;
  final OrmasData data;

  OrmasModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrmasModel.fromJson(Map<String, dynamic> json) {
    return OrmasModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OrmasData.fromJson(json['data'] ?? {}),
    );
  }
}

class OrmasData {
  final int currentPage;
  final List<OrmasItem> data;
  final int totalPages;

  OrmasData({
    required this.currentPage,
    required this.data,
    required this.totalPages,
  });

  factory OrmasData.fromJson(Map<String, dynamic> json) {
    return OrmasData(
      currentPage: json['current_page'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => OrmasItem.fromJson(item ?? {}))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
    );
  }
}

class OrmasItem {
  final int id;
  final int userId;
  final String tanggal;
  final String namaOrmas;
  final String namaSingkatOrmas;
  final String alamatSekretariat;
  final String kecamatan;
  final int kodepos;
  final String noSkOrmas;
  final String noTelp;
  final String namaBank;
  final String namaPemilikBank;
  final String noRekening;
  final String bidangKegiatan;
  final String fotoKantorOrmas;
  final String fotoKantorOrmasAsli;
  final String skKemenkumham;
  final String skKemenkumhamAsli;
  final String skKepengurusan;
  final String skKepengurusanAsli;
  final String skKeberadaan;
  final String skKeberadaanAsli;
  final String suratSengketa;
  final String suratSengketaAsli;
  final String suratKesanggupan;
  final String suratKesanggupanAsli;
  final String aktePendirian;
  final String aktePendirianAsli;
  final String namaPemilikNpwp;
  final String alamatPemilikNpwp;
  final String noNpwp;
  final String nikKetua;
  final String namaKetua;
  final String noTelpKetua;
  final String alamatKetua;
  final String biodataKetua;
  final String biodataKetuaAsli;
  final String fotoKetua;
  final String fotoKetuaAsli;
  final String ktpKetua;
  final String ktpKetuaAsli;
  final String nikSekretaris;
  final String namaSekretaris;
  final String noTelpSekretaris;
  final String alamatSekretaris;
  final String biodataSekretaris;
  final String biodataSekretarisAsli;
  final String fotoSekretaris;
  final String fotoSekretarisAsli;
  final String ktpSekretaris;
  final String ktpSekretarisAsli;
  final String nikBendahara;
  final String namaBendahara;
  final String noTelpBendahara;
  final String alamatBendahara;
  final String biodataBendahara;
  final String biodataBendaharaAsli;
  final String fotoBendahara;
  final String fotoBendaharaAsli;
  final String ktpBendahara;
  final String ktpBendaharaAsli;
  final String noAkta;
  final String tanggalPendirian;
  final String namaNotaris;
  final String aktaPendirian;
  final String aktaPendirianAsli;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrmasItem({
    required this.id,
    required this.userId,
    required this.tanggal,
    required this.namaOrmas,
    required this.namaSingkatOrmas,
    required this.alamatSekretariat,
    required this.kecamatan,
    required this.kodepos,
    required this.noSkOrmas,
    required this.noTelp,
    required this.namaBank,
    required this.namaPemilikBank,
    required this.noRekening,
    required this.bidangKegiatan,
    required this.fotoKantorOrmas,
    required this.fotoKantorOrmasAsli,
    required this.skKemenkumham,
    required this.skKemenkumhamAsli,
    required this.skKepengurusan,
    required this.skKepengurusanAsli,
    required this.skKeberadaan,
    required this.skKeberadaanAsli,
    required this.suratSengketa,
    required this.suratSengketaAsli,
    required this.suratKesanggupan,
    required this.suratKesanggupanAsli,
    required this.aktePendirian,
    required this.aktePendirianAsli,
    required this.namaPemilikNpwp,
    required this.alamatPemilikNpwp,
    required this.noNpwp,
    required this.nikKetua,
    required this.namaKetua,
    required this.noTelpKetua,
    required this.alamatKetua,
    required this.biodataKetua,
    required this.biodataKetuaAsli,
    required this.fotoKetua,
    required this.fotoKetuaAsli,
    required this.ktpKetua,
    required this.ktpKetuaAsli,
    required this.nikSekretaris,
    required this.namaSekretaris,
    required this.noTelpSekretaris,
    required this.alamatSekretaris,
    required this.biodataSekretaris,
    required this.biodataSekretarisAsli,
    required this.fotoSekretaris,
    required this.fotoSekretarisAsli,
    required this.ktpSekretaris,
    required this.ktpSekretarisAsli,
    required this.nikBendahara,
    required this.namaBendahara,
    required this.noTelpBendahara,
    required this.alamatBendahara,
    required this.biodataBendahara,
    required this.biodataBendaharaAsli,
    required this.fotoBendahara,
    required this.fotoBendaharaAsli,
    required this.ktpBendahara,
    required this.ktpBendaharaAsli,
    required this.noAkta,
    required this.tanggalPendirian,
    required this.namaNotaris,
    required this.aktaPendirian,
    required this.aktaPendirianAsli,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrmasItem.fromJson(Map<String, dynamic> json) {
    return OrmasItem(
      id: json['id'] ?? 0,
      userId: json['userid'] ?? 0,
      tanggal: json['tanggal'] ?? '',
      namaOrmas: json['nama_ormas'] ?? '',
      namaSingkatOrmas: json['nama_singkat_ormas'] ?? '',
      alamatSekretariat: json['alamat_sekretariat'] ?? '',
      kecamatan: json['kecamatan'] ?? '',
      kodepos: json['kodepos'] ?? 0,
      noSkOrmas: json['no_sk_ormas'] ?? '',
      noTelp: json['no_telp'] ?? '',
      namaBank: json['nama_bank'] ?? '',
      namaPemilikBank: json['nama_pemilik_bank'] ?? '',
      noRekening: json['no_rekening'] ?? '',
      bidangKegiatan: json['bidang_kegiatan'] ?? '',
      fotoKantorOrmas: json['foto_kantor_ormas'] ?? '',
      fotoKantorOrmasAsli: json['foto_kantor_ormas_asli'] ?? '',
      skKemenkumham: json['sk_kemenkumham'] ?? '',
      skKemenkumhamAsli: json['sk_kemenkumham_asli'] ?? '',
      skKepengurusan: json['sk_kepengurusan'] ?? '',
      skKepengurusanAsli: json['sk_kepengurusan_asli'] ?? '',
      skKeberadaan: json['sk_keberadaan'] ?? '',
      skKeberadaanAsli: json['sk_keberadaan_asli'] ?? '',
      suratSengketa: json['surat_sengketa'] ?? '',
      suratSengketaAsli: json['surat_sengketa_asli'] ?? '',
      suratKesanggupan: json['surat_kesanggupan'] ?? '',
      suratKesanggupanAsli: json['surat_kesanggupan_asli'] ?? '',
      aktePendirian: json['akte_pendirian'] ?? '',
      aktePendirianAsli: json['akte_pendirian_asli'] ?? '',
      namaPemilikNpwp: json['nama_pemilik_npwp'] ?? '',
      alamatPemilikNpwp: json['alamat_pemilik_npwp'] ?? '',
      noNpwp: json['no_npwp'] ?? '',
      nikKetua: json['nik_ketua'] ?? '',
      namaKetua: json['nama_ketua'] ?? '',
      noTelpKetua: json['no_telp_ketua'] ?? '',
      alamatKetua: json['alamat_ketua'] ?? '',
      biodataKetua: json['biodata_ketua'] ?? '',
      biodataKetuaAsli: json['biodata_ketua_asli'] ?? '',
      fotoKetua: json['foto_ketua'] ?? '',
      fotoKetuaAsli: json['foto_ketua_asli'] ?? '',
      ktpKetua: json['ktp_ketua'] ?? '',
      ktpKetuaAsli: json['ktp_ketua_asli'] ?? '',
      nikSekretaris: json['nik_sekretaris'] ?? '',
      namaSekretaris: json['nama_sekretaris'] ?? '',
      noTelpSekretaris: json['no_telp_sekretaris'] ?? '',
      alamatSekretaris: json['alamat_sekretaris'] ?? '',
      biodataSekretaris: json['biodata_sekretaris'] ?? '',
      biodataSekretarisAsli: json['biodata_sekretaris_asli'] ?? '',
      fotoSekretaris: json['foto_sekretaris'] ?? '',
      fotoSekretarisAsli: json['foto_sekretaris_asli'] ?? '',
      ktpSekretaris: json['ktp_sekretaris'] ?? '',
      ktpSekretarisAsli: json['ktp_sekretaris_asli'] ?? '',
      nikBendahara: json['nik_bendahara'] ?? '',
      namaBendahara: json['nama_bendahara'] ?? '',
      noTelpBendahara: json['no_telp_bendahara'] ?? '',
      alamatBendahara: json['alamat_bendahara'] ?? '',
      biodataBendahara: json['biodata_bendahara'] ?? '',
      biodataBendaharaAsli: json['biodata_bendahara_asli'] ?? '',
      fotoBendahara: json['foto_bendahara'] ?? '',
      fotoBendaharaAsli: json['foto_bendahara_asli'] ?? '',
      ktpBendahara: json['ktp_bendahara'] ?? '',
      ktpBendaharaAsli: json['ktp_bendahara_asli'] ?? '',
      noAkta: json['no_akta'] ?? '',
      tanggalPendirian: json['tanggal_pendirian'] ?? '',
      namaNotaris: json['nama_notaris'] ?? '',
      aktaPendirian: json['akta_pendirian'] ?? '',
      aktaPendirianAsli: json['akta_pendirian_asli'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }
}
