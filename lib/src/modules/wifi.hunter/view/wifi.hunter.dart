import '../../../constants/constants.dart';
import '../../../utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/wifi.hunter.provider.dart';

class WifiHunterView extends ConsumerWidget {
  const WifiHunterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wifiHunterProvider);
    final notifier = ref.watch(wifiHunterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('WiFi Hunter')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        notifier.isLoading
                            ? Colors.red
                            : context.theme.primaryColor),
                  ),
                  onPressed: () async => await notifier.huntWifis(),
                  child: const Text('Hunt Networks'),
                ),
              ),
              notifier.wiFiHunterResult.results.isEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Text(
                        'No WiFi Found',
                        style: context.text.labelLarge!.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                          bottom: 20.0, left: 30.0, right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          notifier.wiFiHunterResult.results.length,
                          (i) {
                            final result = notifier.wiFiHunterResult.results[i];
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: ListTile(
                                leading: Text('${result.level} dbm'),
                                title: Text(result.SSID),
                                subtitle: Column(
                                  mainAxisAlignment: mainStart,
                                  crossAxisAlignment: crossStart,
                                  mainAxisSize: mainMin,
                                  children: [
                                    Text('BSSID : ${result.BSSID}'),
                                    Text(
                                        'Capabilities : ${result.capabilities}'),
                                    Text('Frequency : ${result.frequency}'),
                                    Text(
                                        'Channel Width : ${result.channelWidth}'),
                                    Text('Timestamp : ${result.timestamp}')
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
