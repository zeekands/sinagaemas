class SkkkoVerification {
  final bool success;
  final String message;
  final SkkkoVerificationData data;

  SkkkoVerification({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SkkkoVerification.fromJson(Map<String, dynamic> json) {
    return SkkkoVerification(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: SkkkoVerificationData.fromJson(json['data']),
    );
  }
}

class SkkkoVerificationData {
  final int currentPage;
  final List<SkkkoItem> data;

  SkkkoVerificationData({
    required this.currentPage,
    required this.data,
  });

  factory SkkkoVerificationData.fromJson(Map<String, dynamic> json) {
    List<SkkkoItem> skkkoList = [];
    if (json['data'] != null) {
      skkkoList = List<SkkkoItem>.from(
        json['data'].map((item) => SkkkoItem.fromJson(item)),
      );
    }

    return SkkkoVerificationData(
      currentPage: json['current_page'] ?? 0,
      data: skkkoList,
    );
  }
}

class SkkkoItem {
  final int id;
  final int userId;
  final int dataOrmasId;
  final String tanggalSkkko;
  final String pendaftaran;
  final String suratPengantar;
  final String suratPengantarAsli;
  final String suratKesanggupanSkkko;
  final String suratKesanggupanSkkkoAsli;
  final String suratSengketaSkkko;
  final String suratSengketaSkkkoAsli;
  final String noSktKemenkumham;
  final String scanKemenkumham;
  final String scanKemenkumhamAsli;
  final String createdAt;
  final String updatedAt;

  SkkkoItem({
    required this.id,
    required this.userId,
    required this.dataOrmasId,
    required this.tanggalSkkko,
    required this.pendaftaran,
    required this.suratPengantar,
    required this.suratPengantarAsli,
    required this.suratKesanggupanSkkko,
    required this.suratKesanggupanSkkkoAsli,
    required this.suratSengketaSkkko,
    required this.suratSengketaSkkkoAsli,
    required this.noSktKemenkumham,
    required this.scanKemenkumham,
    required this.scanKemenkumhamAsli,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SkkkoItem.fromJson(Map<String, dynamic> json) {
    return SkkkoItem(
      id: json['id'] ?? 0,
      userId: json['userid'] ?? 0,
      dataOrmasId: json['dataormasid'] ?? 0,
      tanggalSkkko: json['tanggal_skkko'] ?? '',
      pendaftaran: json['pendaftaran'] ?? '',
      suratPengantar: json['surat_pengantar'] ?? '',
      suratPengantarAsli: json['surat_pengantar_asli'] ?? '',
      suratKesanggupanSkkko: json['surat_kesanggupan_skkko'] ?? '',
      suratKesanggupanSkkkoAsli: json['surat_kesanggupan_skkko_asli'] ?? '',
      suratSengketaSkkko: json['surat_sengketa_skkko'] ?? '',
      suratSengketaSkkkoAsli: json['surat_sengketa_skkko_asli'] ?? '',
      noSktKemenkumham: json['no_skt_kemenkumham'] ?? '',
      scanKemenkumham: json['scan_kemenkumham'] ?? '',
      scanKemenkumhamAsli: json['scan_kemenkumham_asli'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
