import 'dart:async';

import '../../../utils/log/log.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wifi_hunter/wifi_hunter.dart';
import 'package:wifi_hunter/wifi_hunter_result.dart';

typedef WifiHunterNotifier
    = AutoDisposeNotifierProvider<WifiHunterProvider, void>;

final wifiHunterProvider = WifiHunterNotifier(WifiHunterProvider.new);

class WifiHunterProvider extends AutoDisposeNotifier {
  WiFiHunterResult wiFiHunterResult = WiFiHunterResult();

  bool isLoading = false;

  @override
  build() {}

  Future<void> huntWifis() async {
    isLoading = true;
    ref.notifyListeners();
    try {
      wiFiHunterResult = (await WiFiHunter.huntWiFiNetworks)!;
      log.i('Wifi: ${wiFiHunterResult.results.length}');
      isLoading = false;
      ref.notifyListeners();
    } on PlatformException catch (e) {
      log.e(e.toString());
      isLoading = false;
      ref.notifyListeners();
    }
  }
}
