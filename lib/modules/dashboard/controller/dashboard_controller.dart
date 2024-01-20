import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sinagaemas/data/models/ormas_model.dart';
import 'package:sinagaemas/data/models/ormas_skkko.dart';
import 'package:sinagaemas/data/models/ormas_verification.dart';
import 'package:sinagaemas/data/providers/dashboard_provider.dart';
import 'package:sinagaemas/services/di_service.dart';
import 'package:sinagaemas/utils/base_state.dart';

class DashboardController extends GetxController {
  final dataOrmas = BaseState<List<OrmasItem>>().obs;
  final dataSkkko = BaseState<List<SkkkoItem>>().obs;
  final dataVerifikasi = BaseState<List<OrmasItemVerification>>().obs;
  var data = [];

  @override
  void onInit() async {
    super.onInit();

    await getOrmas();
    await getSkkkoData();
    await getOrmasVerification();
  }

  Future<void> getOrmas() async {
    dataOrmas.value = dataOrmas.value.updateToLoading();
    try {
      final response = await DashboardProvider().getOrmas();
      var filteredOrmas = response.data.data
          .where((element) => element.userId == prefs.getInt('idUser'))
          .toList();
      dataOrmas.value = dataOrmas.value.updateToHasData(filteredOrmas);
      prefs.setInt('idOrmas', filteredOrmas.first.id);
    } catch (e) {
      dataOrmas.value = dataOrmas.value.updateToHasError(e.toString());
    }
  }

  Future<void> getSkkkoData() async {
    dataSkkko.value = dataSkkko.value.updateToLoading();
    try {
      final response = await DashboardProvider().getSkkkoData();
      var filteredSkkko = response.data.data
          .where((element) => element.userId == prefs.getInt('idUser'))
          .toList();
      dataSkkko.value = dataSkkko.value.updateToHasData(filteredSkkko);
    } catch (e) {
      dataSkkko.value = dataSkkko.value.updateToHasError(e.toString());
    }
  }

  Future<void> getOrmasVerification() async {
    dataVerifikasi.value = dataVerifikasi.value.updateToLoading();
    try {
      final response = await DashboardProvider().getOrmasVerification();

      final filteredDataBySkkko = response.data.data
          .where((element) =>
              element.idSkkko.toString() ==
              dataSkkko.value.data?.first.id.toString())
          .toList();

      dataVerifikasi.value =
          dataVerifikasi.value.updateToHasData(filteredDataBySkkko);
    } catch (e) {
      dataVerifikasi.value =
          dataVerifikasi.value.updateToHasError(e.toString());
    }
  }

  @override
  Future<void> refresh() async {
    await getOrmas();
    await getSkkkoData();
    await getOrmasVerification();
  }
}
