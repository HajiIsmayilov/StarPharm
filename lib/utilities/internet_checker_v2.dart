import 'package:ac_connectivity/ac_connectivity.dart';
import 'package:grock/grock.dart';

import '../enums/interner_state.dart';
import '../routes/route.dart';

class InternetCheckerV2 {
  late InternetState? internetState = null;
  void Check() {
    Connectivity().getConnectivityPlusStream().listen((state) {
      print(state);
      ConnectivityResult type = state[0];
      try {
        if ((type != ConnectivityResult.wifi) &&
            (type != ConnectivityResult.mobile)) {
          if (internetState == null || internetState == InternetState.On) {
            internetState = InternetState.Off;
            Grock.navigationKey.currentState!.pushNamed(RoutePath.wifi);
          }
        } else if (type == ConnectivityResult.wifi ||
            type == ConnectivityResult.mobile) {
          if (internetState == InternetState.Off) {
            internetState = InternetState.On;
            Grock.navigationKey.currentState?.pop();
          }
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
