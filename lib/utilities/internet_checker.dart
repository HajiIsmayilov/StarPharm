import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../routes/route.dart';

class InternetChecker {
  final Connectivity _connectivity = Connectivity();

  Future<void> init() async {
    await _initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;

    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    ConnectivityResult type = result[0];

    if ((type != ConnectivityResult.wifi) &&
        (type != ConnectivityResult.mobile)) {
      Get.toNamed(RoutePath.wifi);
    } else if (type == ConnectivityResult.wifi ||
        type == ConnectivityResult.mobile) {
      Get.back();
    }
  }
}
