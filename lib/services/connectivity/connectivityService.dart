
import 'dart:async';

import 'package:connectivity/connectivity.dart';

enum ConnectivityStatus{
  Online,
  Offline
}

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();
  Stream<ConnectivityStatus> get stream =>connectionStatusController.stream;
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Online;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Online;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}