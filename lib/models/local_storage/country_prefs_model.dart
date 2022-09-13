import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// part 'country_prefs_model.g.dart';

@HiveType(typeId: 4, adapterName: 'CountryPrefsAdapterName')
class CountryPrefsModel with ChangeNotifier {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? countryId;
  @HiveField(2)
  final int? sortId;

  CountryPrefsModel({this.id, this.countryId, this.sortId});

  factory CountryPrefsModel.fromJson(Map<String, dynamic> json) =>
      CountryPrefsModel(
        id: json['id'],
        countryId: json['country_id'],
        sortId: json['order_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'country_id': countryId,
        'order_by': sortId,
      };
}
