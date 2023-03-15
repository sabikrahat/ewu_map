import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../db/hive.dart';
import '../../../utils/log/log.dart';
import '../model/setting.model.dart';

// final _settingsStream = db.appSettings.watchObject(0, fireImmediately: true);

// final _settingsStreamProvider = StreamProvider((_) => _settingsStream);

// typedef AppSettingsNotifier = NotifierProvider<SettingProvider, AppSetting>;

// final settingsProvider = AppSettingsNotifier(SettingProvider.new);

// class SettingProvider extends Notifier<AppSetting> {
//   @override
//   AppSetting build() =>
//       ref.watch(_settingsStreamProvider).value ?? AppSetting();
// }


final _settingsStream = Boxes.appSettings
    .watch(key: appName)
    .map((event) => event.value as AppSetting);

final _settingsStreamProvider = StreamProvider((_) => _settingsStream);

typedef AppSettingsNotifier = NotifierProvider<SettingProvider, AppSetting>;

final settingsProvider = AppSettingsNotifier(SettingProvider.new);

class SettingProvider extends Notifier<AppSetting> {
  @override
  AppSetting build() =>
      ref.watch(_settingsStreamProvider).value ??
      Boxes.appSettings.get(appName) ??
      AppSetting();

  Future<bool> changeInitSetting(AppSetting setting) async {
    log.i('First Time Run. Initializing...');
    // await compute(_changeInit, _Data(setting));
    await Boxes.appSettings.put(appName, setting);
    log.i('Final State: ${Boxes.appSettings.get(appName).toString()}');
    state = Boxes.appSettings.get(appName) ?? state;
    return true;
  }
}
