import 'package:sinagaemas/data/models/ormas_model.dart';
import 'package:sinagaemas/services/network_services.dart';

class DashboardProvider {
  Future<OrmasModel> getOrmas(String authorization) async {
    try {
      client.options.headers['Authorization'] = "Bearer $authorization";
      final response = await client.get('/ormas');
      return OrmasModel.fromJson(response.data);
    } catch (e) {
      return OrmasModel.fromJson({});
    }
  }
}
