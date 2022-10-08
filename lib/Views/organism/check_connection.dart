import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnections {
  checkConnect() async {
    var connectionCheck = await Connectivity().checkConnectivity();
    if (connectionCheck == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
