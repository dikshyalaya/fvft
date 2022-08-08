import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/services/hive_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/local_storage/cv_model.dart';
import '../repositories/cv_repository.dart';

class CVProvider with ChangeNotifier {
  CVModel? _userCv;

  CVModel? get myCv => _userCv;

  void setUpdatedCV(CVModel updatedCV) {
    _userCv = updatedCV;
    notifyListeners();
  }

  Future<void> addNewCv({required String? title,  required File file}) async {
    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'cv_file': await MultipartFile.fromFile(file.path),
      });
      final response = await CVRepository.addUpdateCV(formData);
      if (response.data != null && response.data['success']) {
        final bool isBoxExist = await locator<HiveService>()
            .isExists(boxName: HiveBoxName.userCV.stringValue);
        _userCv = CVModel.fromJson(response.data['data']);
        notifyListeners();
        if (isBoxExist) {
          await locator<HiveService>()
              .updateBox(_userCv, HiveBoxName.userCV.stringValue);
        } else {
          await locator<HiveService>()
              .addBox(_userCv, HiveBoxName.userCV.stringValue);
        }
      }
    } catch (e) {
      LogUtils.logError('Error Occurred While Uploading CV: $e');
    }
  }

  Future<void> getUserCVFromCache() async {
    _userCv =
        await locator<HiveService>().getBox(HiveBoxName.userCV.stringValue);
    notifyListeners();
  }

  Future<void> getUserCV() async {
    try {
      final response = await CVRepository.getCV();
      LogUtils.logGeneral(response.data);
      LogUtils.logGeneral(response.statusCode);
      if (response.data != null && response.data['success']) {
        final bool isBoxExist = await locator<HiveService>()
            .isExists(boxName: HiveBoxName.userCV.stringValue);
        _userCv = CVModel.fromJson(response.data['data']);
        notifyListeners();
        if (isBoxExist) {
          await locator<HiveService>()
              .updateBox(_userCv, HiveBoxName.userCV.stringValue);
        } else {
          await locator<HiveService>()
              .addBox(_userCv, HiveBoxName.userCV.stringValue);
        }
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error Occurred While Fetching User CV: ${e.response}');
      LogUtils.logError(
          'Dio Error Occurred While Fetching User CV: ${e.message}');
    } catch (e) {
      LogUtils.logError('Error Occurred While Fetching User CV: $e');
    }
  }

  Future<bool> deleteUserCV() async {
    try {
      final response = await CVRepository.deleteParticularCV(_userCv!.id);
      if (response.data != null && response.data['success']) {
        _userCv = null;
        notifyListeners();
        await locator<HiveService>()
            .deleteBox(boxName: HiveBoxName.userCV.stringValue);
        return true;
      }
      return false;
    } catch (e) {
      LogUtils.logError('Error Occurred While Deleting User CV: $e');
      return false;
    }
  }
}
