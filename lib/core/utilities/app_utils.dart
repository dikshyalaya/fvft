import 'dart:typed_data';

import '../../models/job_application_model.dart';
import '../../models/job_model.dart';
import '../../models/local_storage/country_ls_model.dart';
import '../../models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

void unawaited(Future<void> future) {}

Future<void> launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

/// FUNC [convertDynamicToString] : Convert dynamic list to string list
List<String> convertDynamicToString(List<dynamic> dynamicValue) {
  return dynamicValue.map((dynamicData) => dynamicData as String).toList();
}

List<double> convertDynamicToDouble(List<dynamic> dynamicValue) {
  return dynamicValue.map((dynamicData) => dynamicData as double).toList();
}

/// FUNC [convertDynamicToString] : Convert dynamic list to string list
List<Map<String, dynamic>> convertDynamicListToMap(List<dynamic> dynamicValue) {
  return dynamicValue
      .map((dynamicData) => dynamicData as Map<String, dynamic>)
      .toList();
}

List<NewsContentModel>? convertDynamicListToNewsContent(
    List<dynamic> dynamicValue) {
  return dynamicValue
      .map((dynamicData) => NewsContentModel.fromJson(dynamicData))
      .toList();
}

List<NewsCategoriesModel>? convertDynamicListToNewsCategories(
    List<dynamic> dynamicValue) {
  return dynamicValue
      .map((dynamicData) => NewsCategoriesModel.fromJson(dynamicData))
      .toList();
}

// ! TODO : Uncomment this line
// List<JobShiftModel>? convertDynamicListToJobShift(List<dynamic> dynamicValue) {
//   return dynamicValue
//       .map((dynamicData) => JobShiftModel.fromJson(dynamicData))
//       .toList();
// }

List<CountryLSModel>? convertDynamicListToCountry(List<dynamic> dynamicValue) {
  return dynamicValue
      .map<CountryLSModel>(
          (dynamicData) => CountryLSModel.fromJson(dynamicData))
      .toList();
}

List<JobApplicationModel>? convertDynamicListToJobApplication(
    List<dynamic> dynamicValue) {
  return dynamicValue
      .map<JobApplicationModel>(
          (dynamicData) => JobApplicationModel.fromJson(dynamicData))
      .toList();
}

List<Uint8List> convertDynamicToUint8List(List<dynamic> dynamicValue) {
  return dynamicValue.map((dynamicData) => dynamicData as Uint8List).toList();
}
