import 'package:flutter/material.dart';
import '../core/services/service_locator.dart';
import '../models/local_storage/country_ls_model.dart';
import '../models/local_storage/job_category_model.dart';
import 'paginations/job_pagination_provider.dart';
import 'job_provider.dart';

class JobFilterProvider with ChangeNotifier {
  List<CountryLSModel?> _countryList = [];
  List<JobCategoryModel> _jobCategoryList = [];

  int _page = 1;
  int? _selectedCountryId = -1;
  int? _selectedJobCategoryId = -1;
  bool _isToClearJobList = false;

  List<CountryLSModel?> get countryList => _countryList;

  List<JobCategoryModel> get jobCategoryList => _jobCategoryList;

  int get page => _page;

  int? get selectedCountryId => _selectedCountryId;

  int? get selectedJobCategoryId => _selectedJobCategoryId;

  bool get isToClearJobList => _isToClearJobList;

  void setCountry(List<CountryLSModel?> countries) {
    _countryList = countries;
    notifyListeners();
    setCountryNameList();
  }

  void setJobCategory(List<JobCategoryModel> jobCategories) {
    _jobCategoryList = jobCategories;
    notifyListeners();
    setJobCategoryNameList();
  }

  void setPage(int newPage) {
    _page = newPage;
    notifyListeners();
  }

  void setSelectedCountryId(int? countryId) {
    _selectedCountryId = countryId;
    notifyListeners();
  }

  void setSelectedJobCategoryId(int jobCategoryId) {
    _selectedJobCategoryId = jobCategoryId;
    notifyListeners();
  }

  void setIsToClearJobList(bool isToClearJobs) {
    _isToClearJobList = isToClearJobs;
    notifyListeners();
  }

  void increasePageNo() {
    _page += 1;
    notifyListeners();
  }

//! TODO :Uncomment this function
  // Future<void> loadListOfFilterJobs() async {
  //   await locator<JobProvider>().getListOfJobs(
  //     pageNo: _page,
  //     countryId: _selectedCountryId,
  //     isToClearJobList: _isToClearJobList,
  //     jobCategoryId: _selectedJobCategoryId,
  //   );
  // }

  // ================ Filter Country Name & Job Category Name ================
  final List<String?> _countryNameList = [];
  final List<String?> _jobCategoryNameList = [];

  List<String?> get countryNameList => _countryNameList;

  List<String?> get jobCategoryNameList => _jobCategoryNameList;
  final GlobalKey<FormState> filterFormKey = GlobalKey<FormState>();

  void setCountryNameList() {
    if (_countryList.isEmpty) return;
    for (var country in _countryList) {
      // _countryNameList.add(country!.countryName); //! TODO:  Uncomment this
    }
    notifyListeners();
  }

  void setJobCategoryNameList() {
    if (_jobCategoryList.isEmpty) return;
    for (var jobCategory in _jobCategoryList) {
      _jobCategoryNameList.add(jobCategory.jobCategory!);
    }
    notifyListeners();
  }

  // void setCountryIdByCountryName(String? countryName) {
  //   if (_countryList.isEmpty) return;
  //   _selectedCountryId = _countryList
  //       .firstWhere((element) => element!.countryName == countryName)!
  //       .id;
  //   notifyListeners();
  // }

  void setCategoryIdByCategoryName(String? categoryName) {
    if (_jobCategoryList.isEmpty) return;
    _selectedJobCategoryId = _jobCategoryList
        .firstWhere((element) => element.jobCategory == categoryName)
        .id!;
    notifyListeners();
  }

  Future<void> filterJob() async {
    if (!filterFormKey.currentState!.validate()) {
      locator<JobPaginationProvider>().setHasError(true);
      return;
    }
    filterFormKey.currentState!.save();
    locator<JobPaginationProvider>().setHasError(false);
    setIsToClearJobList(true);
    locator<JobPaginationProvider>().clearJobs();
    // locator<JobPaginationProvider>().loadInitialData(); //TODO : UNCOMMENT THIS LINE
    locator<JobPaginationProvider>().setIsToShowFilterBtn(false);
  }
}
