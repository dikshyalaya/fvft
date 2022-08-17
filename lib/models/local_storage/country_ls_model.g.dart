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
      id: fields[0] as int?,
      name: fields[1] as String?,
      countryCode: fields[4] as String?,
      nativeName: fields[3] as String?,
      phoneCode: fields[5] as String?,
      flag: fields[6] as String?,
      capitalCity: fields[2] as String?,
      currency: fields[7] as String?,
      currencyName: fields[8] as String?,
      currencySymbol: fields[9] as String?,
      region: fields[10] as String?,
      subregion: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryLSModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.capitalCity)
      ..writeByte(3)
      ..write(obj.nativeName)
      ..writeByte(4)
      ..write(obj.countryCode)
      ..writeByte(5)
      ..write(obj.phoneCode)
      ..writeByte(6)
      ..write(obj.flag)
      ..writeByte(7)
      ..write(obj.currency)
      ..writeByte(8)
      ..write(obj.currencyName)
      ..writeByte(9)
      ..write(obj.currencySymbol)
      ..writeByte(10)
      ..write(obj.region)
      ..writeByte(11)
      ..write(obj.subregion);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryLSModel _$CountryLSModelFromJson(Map<String, dynamic> json) =>
    CountryLSModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      nativeName: json['nativeName'] as String?,
      phoneCode: json['phoneCode'] as String?,
      flag: json['flag'] as String?,
      capitalCity: json['capitalCity'] as String?,
      currency: json['currency'] as String?,
      currencyName: json['currencyName'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
    );

Map<String, dynamic> _$CountryLSModelToJson(CountryLSModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capitalCity': instance.capitalCity,
      'nativeName': instance.nativeName,
      'countryCode': instance.countryCode,
      'phoneCode': instance.phoneCode,
      'flag': instance.flag,
      'currency': instance.currency,
      'currencyName': instance.currencyName,
      'currencySymbol': instance.currencySymbol,
      'region': instance.region,
      'subregion': instance.subregion,
    };
