// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeProfileAdapter extends TypeAdapter<ThemeProfile> {
  @override
  final int typeId = 0;

  @override
  ThemeProfile read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeProfile.light;
      case 1:
        return ThemeProfile.dark;
      default:
        return ThemeProfile.light;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeProfile obj) {
    switch (obj) {
      case ThemeProfile.light:
        writer.writeByte(0);
        break;
      case ThemeProfile.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
