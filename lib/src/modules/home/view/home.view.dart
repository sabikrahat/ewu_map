import 'package:ewu_map/src/modules/home/model/ewu.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/custom.routes.dart';
import '../../floor.design/view/floor.design.dart';
import '../../setting/view/setting.view.dart';
import '../../wifi.hunter/view/wifi.hunter.dart';
import '../provider/home.provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Body(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async => await fadePush(context, const SettingView()),
        child: const Icon(Icons.settings),
      ),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadMapProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text(error.toString())),
          data: (data) => Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 0),
                    child: const Text('Ground Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 1),
                    child: const Text('1st Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 2),
                    child: const Text('2nd Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 3),
                    child: const Text('3rd Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 4),
                    child: const Text('4th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 5),
                    child: const Text('5th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 6),
                    child: const Text('6th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 7),
                    child: const Text('7th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 8),
                    child: const Text('8th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 9),
                    child: const Text('9th Floor'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await goToBaseDesign(context, data, 10),
                    child: const Text('Department Corridor Live Trace'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async =>
                        await preCheckAndGoWifiHunterPage(context)
                            .then((res) async {
                      if (res) {
                        await fadePush(context, const WifiHunterView());
                      }
                    }),
                    child: const Text('Wifi Hunter Check'),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
  }
}

Future<bool> preCheckAndGoWifiHunterPage(BuildContext context) async {
  final snack = ScaffoldMessenger.of(context);
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    final currStatus = await Permission.location.status;
    if (currStatus == PermissionStatus.permanentlyDenied ||
        currStatus == PermissionStatus.denied) {
      final status = await Permission.location.request();
      if (status == PermissionStatus.permanentlyDenied ||
          status == PermissionStatus.denied) {
        snack.showSnackBar(
          const SnackBar(
            content: Text('Location permission is required*'),
            duration: Duration(seconds: 1),
          ),
        );
        return false;
      } else if (status == PermissionStatus.granted) {
        return true;
      }
    }
    return true;
  } else {
    snack.showSnackBar(
      const SnackBar(
        content: Text('Only available on mobile devices.'),
        duration: Duration(seconds: 1),
      ),
    );
    return false;
  }
}

Future<void> goToBaseDesign(BuildContext context, EwuMap data, int f) async {
  if (data.floors.any((e) => e.floor == f)) {
    await fadePush(context,
        FloorDesign(floor: data.floors.firstWhere((e) => e.floor == f)));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No data for ${f}th floor'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
