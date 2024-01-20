import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinagaemas/services/network_services.dart';

final locator = GetIt.instance;

final prefs = locator<SharedPreferences>();

Future<void> setupLocator() async {
  await initSharedPref();
  locator.registerSingleton<HttpService>(HttpService());
}

Future<void> initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPref);
}
