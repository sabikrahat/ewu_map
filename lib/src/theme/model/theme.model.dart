import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../db/hive.dart';
import '../themes/dark/dark.theme.dart';
import '../themes/light/light.theme.dart';

part 'theme.model.ext.dart';
part 'theme.model.g.dart';

@HiveType(typeId: HiveTypes.themes)
enum ThemeProfile {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
}
