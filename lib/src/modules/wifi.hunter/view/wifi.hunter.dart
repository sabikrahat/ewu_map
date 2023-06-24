import 'package:ewu_map/src/modules/home/view/home.view.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            notifier.stop();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const HomeView()),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('WiFi Hunter'),
        actions: [
          IconButton(
            onPressed: notifier.isLoading ? null : () => notifier.huntWifis(),
            icon: notifier.isLoading
                ? const CircularProgressIndicator()
                : Text('${notifier.rawEntries.length}'),
          ),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(wifiHunterProvider).when(
          error: (err, _) => Center(child: Text(err.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (_) {
            final notifier = ref.watch(wifiHunterProvider.notifier);
            return notifier.customEntries.isEmpty
                ? const Center(child: Text('No WiFi Found'))
                : ListView.builder(
                    itemCount: notifier.customEntries.length,
                    itemBuilder: (_, idx) {
                      final result = notifier.customEntries[idx];
                      return ListTile(
                        leading: Text('${result.level} dbm'),
                        title: Text(result.SSID),
                        subtitle: Text(result.BSSID),
                      );
                    },
                  );
          },
        );
  }
}
