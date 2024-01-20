import 'dart:convert';

class Kegiatan {
  int id;
  int dataOrmasId;
  String tanggal;
  String fileKegiatan;
  String fileKegiatanAsli;
  String judul;
  String deskripsi;
  DateTime? createdAt;
  DateTime? updatedAt;

  Kegiatan({
    required this.id,
    required this.dataOrmasId,
    required this.tanggal,
    required this.fileKegiatan,
    required this.fileKegiatanAsli,
    required this.judul,
    required this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  factory Kegiatan.fromJson(Map<String, dynamic> json) {
    return Kegiatan(
      id: json['id'] ?? 0,
      dataOrmasId: json['dataormasid'] ?? 0,
      tanggal: json['tanggal'] ?? "",
      fileKegiatan: json['file_kegiatan'] ?? "",
      fileKegiatanAsli: json['file_kegiatan_asli'] ?? "",
      judul: json['judul'] ?? "",
      deskripsi: json['deskripsi'] ?? "",
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class LaporanKegiatan {
  bool success;
  String message;
  List<Kegiatan> kegiatanList;

  LaporanKegiatan({
    required this.success,
    required this.message,
    required this.kegiatanList,
  });

  factory LaporanKegiatan.fromJson(Map<String, dynamic> json) {
    return LaporanKegiatan(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      kegiatanList: (json['data']['data'] as List<dynamic>? ?? [])
          .map((kegiatan) => Kegiatan.fromJson(kegiatan))
          .toList(),
    );
  }
}
