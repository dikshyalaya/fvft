import 'package:hive/hive.dart';

part 'country_ls_model.g.dart';

@HiveType(typeId: 0, adapterName: 'CountryLSModelAdapter')
class CountryLSModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String countryName;
  @HiveField(2)
  final String countryCode;
  @HiveField(3)
  final String flagCode;

  CountryLSModel({
    required this.flagCode,
    required this.countryName,
    required this.countryCode,
    required this.id,
  });

  factory CountryLSModel.fromJson(Map<String, dynamic> json) => CountryLSModel(
      id: json['id'],
      countryCode: json['country_code'],
      countryName: json['name'],
      flagCode: json['flag']);
}
