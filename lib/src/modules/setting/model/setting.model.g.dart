// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingAdapter extends TypeAdapter<AppSetting> {
  @override
  final int typeId = 2;

  @override
  AppSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSetting()
      ..firstRun = fields[0] as bool
      ..theme = fields[1] as ThemeProfile;
  }

  @override
  void write(BinaryWriter writer, AppSetting obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstRun)
      ..writeByte(1)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
