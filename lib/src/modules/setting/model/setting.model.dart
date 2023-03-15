import 'dart:convert' show json;

import 'package:hive/hive.dart';

import '../../../db/hive.dart';
import '../../../theme/model/theme.model.dart';

part 'setting.model.ext.dart';
part 'setting.model.g.dart';

@HiveType(typeId: HiveTypes.appSettings)
class AppSetting {
  AppSetting();

  @HiveField(0)
  bool firstRun = true;

  @HiveField(1)
  ThemeProfile theme = ThemeProfile.light;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'firstRun': firstRun,
        'theme': theme.name,
      };

  factory AppSetting.fromJson(String source) =>
      AppSetting.fromRawJson(json.decode(source));

  factory AppSetting.fromRawJson(Map<String, dynamic> json) => AppSetting()
    ..firstRun = json['firstRun'] as bool
    ..theme = ThemeProfile.values.firstWhere(
      (e) => e.name == json['theme'] as String,
      orElse: () => ThemeProfile.dark,
    );

  @override
  String toString() => toRawJson();
}
