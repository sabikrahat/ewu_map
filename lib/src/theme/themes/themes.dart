import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../modules/setting/model/setting.model.dart';

import '../../db/isar.dart';
import '../model/theme.model.dart';
import 'dark/dark.theme.dart';
import 'light/light.theme.dart';

const fontFamily = 'Nunito';

final themeType = db.appSettings.getSync(0)?.theme ?? ThemeProfile.light;

SystemUiOverlayStyle get uiConfig => themeType == ThemeProfile.light ? lightUiConfig : darkUiConfig;

const Color white = Colors.white;
const Color black = Colors.black;
// const Color kPrimaryColor = Color(0xFF23336A);

final roundedButtonStyle = ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: borderRadius15));

final borderRadius10 = BorderRadius.circular(10);
final borderRadius12 = BorderRadius.circular(12);
final borderRadius15 = BorderRadius.circular(15);
final borderRadius30 = BorderRadius.circular(30);

final roundedRectangleBorder10 = RoundedRectangleBorder(borderRadius: borderRadius10);
final roundedRectangleBorder12 = RoundedRectangleBorder(borderRadius: borderRadius12);
final roundedRectangleBorder15 = RoundedRectangleBorder(borderRadius: borderRadius15);
final roundedRectangleBorder30 = RoundedRectangleBorder(borderRadius: borderRadius30);

