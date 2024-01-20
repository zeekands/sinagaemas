import 'package:get/get.dart';
import 'package:sinagaemas/data/models/kegiatan_model.dart';
import 'package:sinagaemas/data/providers/dashboard_provider.dart';
import 'package:sinagaemas/services/di_service.dart';
import 'package:sinagaemas/utils/base_state.dart';

class LaporanKegiatanController extends GetxController {
  final dataKegiatan = BaseState<List<Kegiatan>>().obs;

  @override
  void onInit() async {
    super.onInit();
    await getKegiatan();
  }

  Future<void> getKegiatan() async {
    dataKegiatan.value = dataKegiatan.value.updateToLoading();
    try {
      final response = await DashboardProvider().getKegiatan();

      final dataFiltered = response.kegiatanList
          .where((element) => element.dataOrmasId == prefs.getInt("idOrmas"))
          .toList();

      dataKegiatan.value = dataKegiatan.value.updateToHasData(dataFiltered);
    } catch (e) {
      dataKegiatan.value = dataKegiatan.value.updateToHasError(e.toString());
    }
  }

  @override
  Future<void> refresh() async {
    await getKegiatan();
  }
}
