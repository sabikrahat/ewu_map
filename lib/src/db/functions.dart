// Package imports:
import 'package:hive/hive.dart' show Hive;

// Project imports:
import '../modules/setting/model/setting.model.dart';
import '../theme/model/theme.model.dart';
import 'hive.dart' show BoxNames, Boxes;

class HiveFuntions {
  static void registerHiveAdepters() {
    Hive.registerAdapter(ThemeProfileAdapter());
    Hive.registerAdapter(AppSettingAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<ThemeProfile>(BoxNames.themeProfile);
    await Hive.openBox<AppSetting>(BoxNames.appSettings);
  }

  static Future<void> closeAllBoxes() async {
    await Boxes.themeProfile.close();
    await Boxes.appSettings.close();
  }

  static Future<void> clearAllBoxes() async {
    await Boxes.themeProfile.clear();
    await Boxes.appSettings.clear();
  }

  static Future<void> deleteAllBoxes() async {
    await Hive.deleteBoxFromDisk(BoxNames.themeProfile);
    await Hive.deleteBoxFromDisk(BoxNames.appSettings);
  }
}
