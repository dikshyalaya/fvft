// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_prefs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryPrefsAdapterName extends TypeAdapter<CountryPrefsModel> {
  @override
  final int typeId = 4;

  @override
  CountryPrefsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryPrefsModel(
      id: fields[0] as int?,
      countryId: fields[1] as int?,
      sortId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryPrefsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.countryId)
      ..writeByte(2)
      ..write(obj.sortId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryPrefsAdapterName &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
