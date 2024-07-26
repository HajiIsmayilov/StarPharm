import 'package:ac_connectivity/ac_connectivity.dart';
import 'package:get/get.dart';

import '../routes/route.dart';

class InternetCheckerV2 {
  void Check() {
    Connectivity().getConnectivityPlusStream().listen((state) {
      print(state);

      ConnectivityResult type = state[0];

      if ((type != ConnectivityResult.wifi) &&
          (type != ConnectivityResult.mobile)) {
        Get.toNamed(RoutePath.wifi);
      } else if (type == ConnectivityResult.wifi ||
          type == ConnectivityResult.mobile) {
        Get.back();
      }
    });
  }
}
