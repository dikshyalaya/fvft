import 'package:flutter/material.dart';
import '../../core/services/hive_service.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/utilities/app_utils.dart';
import '../../core/utilities/enum_utils.dart';
import '../../core/utilities/singleton_msg.dart';
import '../../models/local_storage/country_ls_model.dart';
import '../../models/local_storage/country_prefs_model.dart';
import '../../models/local_storage/job_category_model.dart';
import '../../models/local_storage/job_prefs_model.dart';
import '../job_filter_provider.dart';
import 'user_country_prefs_provider.dart';
import 'user_job_prefs_provider.dart';
import '../../widgets/custom_snackbar.dart';

class JobPreferenceUIProvider with ChangeNotifier {
  String? _jobCategoryName;
  String? _countryName;
  CountryLSModel? _countryLSModel;
  JobCategoryModel? _jobCategoryModel;
  List<String> _countryList = [];
  List<String> _jobCategoryList = [];

  String? get jobCategoryName => _jobCategoryName;

  String? get countryName => _countryName;

  List<String> get countryList => _countryList;

  List<String> get jobCategoryList => _jobCategoryList;

  void setJobCategoryName(String? value) {
    _jobCategoryName = value!;
    notifyListeners();
  }

  void setCountryName(String? value) {
    _countryName = value!;
    notifyListeners();
  }

  void _filterJobCategoryByName() {
    final JobCategoryModel jobCategoryModel = locator<JobFilterProvider>()
        .jobCategoryList
        .firstWhere(
            (jobCategory) => jobCategory.jobCategory == _jobCategoryName);
    _jobCategoryModel = jobCategoryModel;
    notifyListeners();
  }

  void _filterCountryByName() {
    final CountryLSModel countryModel = locator<JobFilterProvider>()
        .countryList
        .firstWhere((country) => country.countryName == _countryName);
    _countryLSModel = countryModel;
    notifyListeners();
  }

  bool _isCountryInPrefs = false;
  bool _isJobCategoryInPrefs = false;

  void setIsCountryInPrefs(bool value) {
    _isCountryInPrefs = value;
    notifyListeners();
  }

  void setIsJobCategoryInPrefs(bool value) {
    _isJobCategoryInPrefs = value;
    notifyListeners();
  }

  // =========================== Load Prefs Data At Initial Phase =================================
  Future<void> loadPrefsJobCategory() async {
    final bool isBoxExist = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.jobCategoryPrefs.stringValue);
    if (isBoxExist) {
      _jobCategoryList = await locator<HiveService>()
          .getBox(HiveBoxName.jobCategoryPrefs.stringValue);
    } else {
      List<JobPrefsModel> _jobPrefsList =
          locator<UserJobPrefsProvider>().jobPrefsList;
      if (_jobPrefsList.isEmpty) return;
      await Future.forEach(_jobPrefsList, (e) async {
        final element = e as JobPrefsModel;
        await Future.forEach(locator<JobFilterProvider>().jobCategoryList,
            (exs) {
          final ex = exs as JobCategoryModel;
          if (ex.id == element.jobCategoryId) {
            _jobCategoryList.add(ex.jobCategory!);
          }
        });
      });
      await cacheJobCategoryPrefs();
    }
    setIsJobCategoryInPrefs(isBoxExist);
  }

  Future<void> loadPrefsCountry() async {
    final bool isBoxExist = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.countryPrefs.stringValue);
    if (isBoxExist) {
      _countryList = await locator<HiveService>()
          .getBox(HiveBoxName.countryPrefs.stringValue);
    } else {
      List<CountryPrefsModel> _countryPrefsList =
          locator<UserCountryPrefsProvider>().countryPrefsList;
      if (_countryPrefsList.isEmpty) return;
      await Future.forEach(_countryPrefsList, (e) async {
        final element = e as CountryPrefsModel;
        await Future.forEach(locator<JobFilterProvider>().countryList, (exs) {
          final ex = exs as CountryLSModel;
          if (ex.id == element.countryId) {
            _countryList.add(ex.countryName);
          }
        });
      });
      await cacheCountryPrefs();
    }
    setIsCountryInPrefs(isBoxExist);
  }

  Future<void> loadAtInit() async {
    await Future.wait([
      loadPrefsJobCategory(),
      loadPrefsCountry(),
    ]);
  }

// =========================== End To Load Prefs Data At Initial Phase =================================

// ======================= Re-Order List Index ==================================================

  String removeCountryByIndex(int index) {
    return _countryList.removeAt(index);
  }

  void addNewCountry(
      {required int newIndex, required int oldIndex, required String value}) {
    final CountryPrefsModel cModel =
        locator<UserCountryPrefsProvider>().removeCountryIndex(oldIndex);
    _countryList.insert(newIndex, value);
    locator<UserCountryPrefsProvider>().addNewCountry(newIndex, cModel);
    //call update function - update on background
    unawaited(locator<UserCountryPrefsProvider>().updateCountryPrefsList());
  }

  String removeJobCategoryIndex(int index) {
    return _jobCategoryList.removeAt(index);
  }

  void addNewJobCategory(
      {required int newIndex, required int oldIndex, required String value}) {
    final JobPrefsModel jpModel =
        locator<UserJobPrefsProvider>().removeJobCategoryByIndex(oldIndex);
    _jobCategoryList.insert(newIndex, value);
    locator<UserJobPrefsProvider>().addNewJobCategory(newIndex, jpModel);
    //call update function - update on background
    unawaited(locator<UserJobPrefsProvider>().updateJobCategoryPrefsList());
  }

// ================ End of Re-Order List Index ==================================================

// ======================== Handle Form ==============================================

  bool _visibleDraggableSheet = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get isToVisibleDraggableSheet => _visibleDraggableSheet;

  GlobalKey<FormState> get formKey => _formKey;

  GlobalKey<FormState> get formKey1 => _formKey1;

  bool get isLoading => _isLoading;

  void toggleDraggableSheet() {
    _visibleDraggableSheet = !_visibleDraggableSheet;
    notifyListeners();
  }

  void setIsToVisibleDraggableSheet(bool value) {
    _visibleDraggableSheet = value;
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> saveCountry() async {
    if (!formKey1.currentState!.validate()) return;
    formKey1.currentState!.save();
    setIsLoading(true);
    _filterCountryByName();
    final CountryPrefsModel countryPrefsModel =
        await locator<UserCountryPrefsProvider>()
            .addNewCountryInPrefs(countryId: _countryLSModel!.id);
    if (countryPrefsModel.id != null) {
      _countryList.add(_countryLSModel!.countryName);
      _countryName = null;
      notifyListeners();
      await cacheCountryPrefs();
      showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message:
            'Country ${_countryLSModel!.countryName} has been added to your preferences',
        isError: false,
      );
    } else {
      showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message:
            'Failed to add country ${_countryLSModel!.countryName} to your preferences',
        isError: true,
      );
    }
    setIsLoading(false);
    toggleDraggableSheet();
  }

  Future<void> saveJobCategory() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    setIsLoading(true);
    _filterJobCategoryByName();
    final JobPrefsModel jobPrefsModel = await locator<UserJobPrefsProvider>()
        .addNewJobCategoryInPrefs(jobCategoryId: _jobCategoryModel!.id!);
    if (jobPrefsModel.id != null) {
      _jobCategoryList.add(_jobCategoryModel!.jobCategory!);
      _jobCategoryName = null;
      notifyListeners();
      await cacheJobCategoryPrefs();
      showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message:
            'Job Category ${_jobCategoryModel!.jobCategory} has been added to your preferences',
        isError: false,
      );
    } else {
      showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message:
            'Failed to add job category ${_jobCategoryModel!.jobCategory} to your preferences',
        isError: true,
      );
    }
    setIsLoading(false);
    toggleDraggableSheet();
  }

// ========================= End To Handle Form ===================================

// ======================== Delete Particular Prefs ===============================
  Future<void> deleteParticularJobFromPrefs(String jobCategory) async {
    final JobCategoryModel jobCategoryModel = locator<JobFilterProvider>()
        .jobCategoryList
        .firstWhere((jb) => jb.jobCategory == jobCategory);
    final JobPrefsModel jobPrefsModel = locator<UserJobPrefsProvider>()
        .jobPrefsList
        .firstWhere((element) => element.jobCategoryId == jobCategoryModel.id);

    final bool result = await locator<UserJobPrefsProvider>()
        .deleteParticularJobCategory(prefsId: jobPrefsModel.id!);
    if (result) {
      locator<UserJobPrefsProvider>().removeJobById(jobPrefsModel.id!);
      _jobCategoryList
          .removeWhere((element) => element == jobCategoryModel.jobCategory);
      notifyListeners();
      await cacheJobCategoryPrefs();
      showCustomSnackBar(
          context: locator<NavigationService>().getNavigationContext(),
          message:
              'Job Category ${jobCategoryModel.jobCategory} has been deleted successfully !',
          isError: !result);
    } else {
      showCustomSnackBar(
          context: locator<NavigationService>().getNavigationContext(),
          message:
              'Failed To Delete Job Category ${jobCategoryModel.jobCategory} !',
          isError: result);
    }
  }

  Future<void> deleteParticularCountryFromPrefs(String country) async {
    final CountryLSModel countryModel = locator<JobFilterProvider>()
        .countryList
        .firstWhere((cs) => cs.countryName == country);

    final CountryPrefsModel countryPrefsModel =
        locator<UserCountryPrefsProvider>()
            .countryPrefsList
            .firstWhere((element) => element.countryId == countryModel.id);
    final bool result = await locator<UserCountryPrefsProvider>()
        .deleteParticularCountry(prefsId: countryPrefsModel.id!);
    if (result) {
      locator<UserCountryPrefsProvider>()
          .removeCountryById(countryPrefsModel.id!);
      _countryList
          .removeWhere((element) => element == countryModel.countryName);
      notifyListeners();
      await cacheCountryPrefs();
      showCustomSnackBar(
          context: locator<NavigationService>().getNavigationContext(),
          message:
              'Country ${countryModel.countryName} has been deleted successfully !',
          isError: !result);
    } else {
      showCustomSnackBar(
          context: locator<NavigationService>().getNavigationContext(),
          message: 'Failed To Delete Country ${countryModel.countryName} !',
          isError: result);
    }
  }

// ======================= End To Delete Particular Prefs ==========================

// ============================ Cache User Prefs ===================================
  @caching
  Future<void> cacheCountryPrefs() async {
    if (_isCountryInPrefs) {
      await locator<HiveService>()
          .updateBox(_countryList, HiveBoxName.countryPrefs.stringValue);
    } else {
      await locator<HiveService>()
          .addBox(_countryList, HiveBoxName.countryPrefs.stringValue);
    }
  }

  @caching
  Future<void> cacheJobCategoryPrefs() async {
    if (_isJobCategoryInPrefs) {
      await locator<HiveService>().updateBox(
          _jobCategoryList, HiveBoxName.jobCategoryPrefs.stringValue);
    } else {
      await locator<HiveService>()
          .addBox(_jobCategoryList, HiveBoxName.jobCategoryPrefs.stringValue);
    }
  }

// ====================== End Cache User Prefs ======================================
}
