import 'package:flutter/material.dart' show runApp;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/app.dart' show MyApp;
import 'src/db/isar.dart' show openDB;
import 'src/theme/themes/themes.dart';

void main() async {
  await openDB();
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}
