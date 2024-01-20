class OrmasVerification {
  final bool success;
  final String message;
  final OrmasVerificationData data;

  OrmasVerification({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrmasVerification.fromJson(Map<String, dynamic> json) {
    return OrmasVerification(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OrmasVerificationData.fromJson(json['data']),
    );
  }
}

class OrmasVerificationData {
  final int currentPage;
  final List<OrmasItemVerification> data;

  OrmasVerificationData({
    required this.currentPage,
    required this.data,
  });

  factory OrmasVerificationData.fromJson(Map<String, dynamic> json) {
    List<OrmasItemVerification> ormasList = [];
    if (json['data'] != null) {
      ormasList = List<OrmasItemVerification>.from(
        json['data'].map((item) => OrmasItemVerification.fromJson(item)),
      );
    }

    return OrmasVerificationData(
      currentPage: json['current_page'] ?? 0,
      data: ormasList,
    );
  }
}

class OrmasItemVerification {
  final int idOrmas;
  // final String namaOrmas;
  // final String namaSingkatOrmas;
  // final String alamatSekretariat;
  // final String kecamatan;
  // final String kodepos;
  final int idSkkko;
  final String status;
  final String keterangan;
  // Add more properties based on your JSON structure

  OrmasItemVerification({
    required this.idOrmas,
    //required this.namaOrmas,
    // required this.namaSingkatOrmas,
    // required this.alamatSekretariat,
    // required this.kecamatan,
    // required this.kodepos,
    required this.idSkkko,
    required this.status,
    required this.keterangan,
    // Add more properties based on your JSON structure
  });

  factory OrmasItemVerification.fromJson(Map<String, dynamic> json) {
    return OrmasItemVerification(
      idOrmas: json['id_ormas'] ?? 0,
      //namaOrmas: json['nama_ormas'] ?? '',
      // namaSingkatOrmas: json['nama_singkat_ormas'] ?? '',
      // alamatSekretariat: json['alamat_sekretariat'] ?? '',
      // kecamatan: json['kecamatan'] ?? '',
      // kodepos: json['kodepos'] ?? '',
      idSkkko: json['id_skkko'] ?? '',
      status: json['status'] ?? '',
      keterangan: json['keterangan'] ?? '',
    );
  }
}
