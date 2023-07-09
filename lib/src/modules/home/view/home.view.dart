import 'dart:io';

import 'package:ewu_map/src/modules/home/model/ewu.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 1),
              child: const Text('1st Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 2),
              child: const Text('2nd Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 3),
              child: const Text('3rd Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 4),
              child: const Text('4th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 5),
              child: const Text('5th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 6),
              child: const Text('6th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 7),
              child: const Text('7th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 8),
              child: const Text('8th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await goToBaseFloorDesign(context, ref, 9),
              child: const Text('9th Floor'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async =>
                  await goToBaseFloorDesign(context, ref, 10),
              child: const Text('Department Corridor Live Trace'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async =>
                  await preCheckAndGoWifiHunterPage(context).then((res) async {
                if (res) {
                  await fadePush(context, const WifiHunterView());
                }
              }),
              child: const Text('Wifi Hunter Check'),
            ),
            const SizedBox(height: 15),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.green,
                    width: 5,
                  ),
                  top: BorderSide(
                    color: Colors.red,
                    width: 5,
                  ),
                  left: BorderSide(
                    color: Colors.yellow,
                    width: 5,
                  ),
                  right: BorderSide(
                    color: Colors.blue,
                    width: 5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> preCheckAndGoWifiHunterPage(BuildContext context) async {
  final snack = ScaffoldMessenger.of(context);
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    // final currStatus = await Permission.location.status;
    // if (currStatus == PermissionStatus.permanentlyDenied ||
    //     currStatus == PermissionStatus.denied) {
    //   final status = await Permission.location.request();
    //   if (status == PermissionStatus.permanentlyDenied ||
    //       status == PermissionStatus.denied) {
    //     snack.showSnackBar(
    //       const SnackBar(
    //         content: Text('Location permission is required*'),
    //         duration: Duration(seconds: 1),
    //       ),
    //     );
    //     return false;
    //   } else if (status == PermissionStatus.granted) {
    //     return true;
    //   }
    // }
    return false;
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

Future<void> goToBaseFloorDesign(
    BuildContext context, WidgetRef ref, int f) async {
  final nav = Navigator.of(context);
  final path = 'assets/files/floor_$f.json';
  if (await File(path).exists()) {
    final floor = await ref.watch(loadFloorProvider(path).future);
    await nav.push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => FloorDesign(floor: floor),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
      ),
    );
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No data for ${f}th floor'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
