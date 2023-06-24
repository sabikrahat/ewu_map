import 'dart:async';

import '../../../utils/log/log.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wifi_hunter/wifi_hunter.dart';
import 'package:wifi_hunter/wifi_hunter_result.dart';

typedef RawWifiHunterNotifier
    = AutoDisposeAsyncNotifierProvider<RawWifiHunterProvider, void>;

final rawWiifiHunterProvider = RawWifiHunterNotifier(RawWifiHunterProvider.new);

class RawWifiHunterProvider extends AutoDisposeAsyncNotifier {
  WiFiHunterResult wiFiHunterResult = WiFiHunterResult();

  late List<WiFiHunterResultEntry> _entries;

  bool isLoading = false;

  late Timer _timer;

  @override
  FutureOr build() async {
    _entries = await huntWifis() ?? [];
    _stream();
  }

  Future<List<WiFiHunterResultEntry>?> huntWifis() async {
    isLoading = true;
    ref.notifyListeners();
    try {
      wiFiHunterResult = (await WiFiHunter.huntWiFiNetworks)!;
      log.i('Wifi: ${wiFiHunterResult.results.length}');
      isLoading = false;
      ref.notifyListeners();
      return wiFiHunterResult.results;
    } on PlatformException catch (e) {
      log.e(e.toString());
      isLoading = false;
      ref.notifyListeners();
      return null;
    }
    
  }

  List<WiFiHunterResultEntry> get rawEntries => _entries;

  List<WiFiHunterResultEntry> get customEntries => _entries;

  _stream() {
    // set a  stream which will call the huntWifis() method every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      log.i('Wifi: updating...');
      _entries = await huntWifis() ?? _entries;
      isLoading = false;
      ref.notifyListeners();
    });
  }

  stop() {
    _timer.cancel();
  }
}
