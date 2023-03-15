// Package imports:
import 'package:hive/hive.dart' show Box, Hive;

// Project imports:
import '../modules/setting/model/setting.model.dart';
import '../theme/model/theme.model.dart';

class Boxes {
  static Box<ThemeProfile> themeProfile = Hive.box<ThemeProfile>(BoxNames.themeProfile);
  static Box<AppSetting> appSettings = Hive.box<AppSetting>(BoxNames.appSettings);

  static Map<Box<dynamic>, dynamic Function(dynamic json)> get allBoxes => {
        appSettings: (json) => AppSetting.fromJson(json),
      };
}

class BoxNames {
  static const String themeProfile = 'themeProfile';
  static const String appSettings = 'appSettings';
}

class HiveTypes {
  static const int themes = 0;
  static const int appSettings = 1;
}
