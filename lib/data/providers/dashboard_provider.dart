import 'package:sinagaemas/data/models/kegiatan_model.dart';
import 'package:sinagaemas/data/models/ormas_model.dart';
import 'package:sinagaemas/data/models/ormas_skkko.dart';
import 'package:sinagaemas/data/models/ormas_verification.dart';
import 'package:sinagaemas/services/network_services.dart';

class DashboardProvider {
  Future<OrmasModel> getOrmas() async {
    try {
      final response = await apiService.get('/ormas');
      return OrmasModel.fromJson(response.data);
    } catch (e) {
      return OrmasModel.fromJson({});
    }
  }

  Future<SkkkoVerification> getSkkkoData() async {
    try {
      final response = await apiService.get('/skkko');
      return SkkkoVerification.fromJson(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<OrmasVerification> getOrmasVerification() async {
    try {
      final response = await apiService.get('/verifikasi');
      return OrmasVerification.fromJson(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<LaporanKegiatan> getKegiatan() async {
    try {
      final response = await apiService.get('/kegiatan');
      return LaporanKegiatan.fromJson(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
