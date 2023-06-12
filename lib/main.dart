import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart' show MyApp;
import 'src/constants/constants.dart';
import 'src/db/functions.dart';
import 'src/theme/themes/themes.dart';

Future<void> main() async {
  await _init();
  // await checkWifiConnection();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _init() async {
  if (!kIsWeb) WidgetsFlutterBinding.ensureInitialized();
  await initHiveDB();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}

Future<void> initHiveDB() async {
  await Hive.initFlutter('.${appName.toLowerCase()}');
  HiveFuntions.registerHiveAdepters();
  await HiveFuntions.openAllBoxes();
}
