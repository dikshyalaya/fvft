// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_ls_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryLSModelAdapter extends TypeAdapter<CountryLSModel> {
  @override
  final int typeId = 0;

  @override
  CountryLSModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryLSModel(
      nativeName: fields[4] as String?,
      flagCode: fields[3] as String?,
      countryName: fields[1] as String?,
      countryCode: fields[2] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryLSModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.countryName)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.flagCode)
     ..writeByte(4)
     ..write(obj.nativeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryLSModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
