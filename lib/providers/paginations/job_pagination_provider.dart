import 'package:flutter/material.dart';
import '../../core/services/service_locator.dart';
import '../../core/utilities/logutils.dart';
import '../../models/job_model.dart';
import '../../models/local_storage/country_ls_model.dart';
import '../job_provider.dart';

import '../country_provider.dart';
import '../job_filter_provider.dart';

class JobPaginationProvider with ChangeNotifier {
  // ============Job Post Screen (Job) Pagination ======================
  //      DO NOT MODIFY IT, IF YOU DON'T HAVE PROPER IDEA ON IT
  //==============================================================
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<JobModel> _jobList = [];
  late ScrollController? _controller;

  bool get hasNextPage => _hasNextPage;

  bool get isFirstLoadRunning => _isFirstLoadRunning;

  bool get isLoadMoreRunning => _isLoadMoreRunning;

  List<JobModel> get jobList => _jobList;

  void clearJobs() {
    _jobList.clear();
    notifyListeners();
  }

  void loadInitialData() async {
    _isFirstLoadRunning = true;
    try {
      final data = locator<JobProvider>();
      await locator<JobFilterProvider>().loadListOfFilterJobs();
      if (data.jobList!.isNotEmpty) {
        _jobList = data.jobList!;
        notifyListeners();
      }
    } catch (err) {
      LogUtils.logError(
          'Ignore This Error: Something went wrong while loading job data at initial phase!');
    }
    _isFirstLoadRunning = false;
    notifyListeners();
  }

  void setScrollController(ScrollController newController) {
    _controller = newController;
  }

  void loadMoreData() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller!.position.extentAfter < 10) {
      _isLoadMoreRunning = true;
      try {
        final data = locator<JobProvider>();
        locator<JobFilterProvider>().increasePageNo();
        await locator<JobFilterProvider>().loadListOfFilterJobs();
        if (data.jobList!.isNotEmpty) {
          _jobList.addAll(data.jobList!);
        } else {
          _hasNextPage = false;
        }
      } catch (err) {
        LogUtils.logError(
            'Ignore This Error: Something went wrong while loading more job data!');
      }
      _isLoadMoreRunning = false;
      notifyListeners();
    }
  }

// ============ End of Job Post Screen (Job) Pagination =====================

// ============Job Post Screen (Country) Pagination ======================
//      DO NOT MODIFY IT, IF YOU DON'T HAVE PROPER IDEA ON IT
//==============================================================
  int _countryPage = 1;
  bool _countryHasNextPage = true;
  bool _isFirstLoadCountry = false;
  bool _isLoadMoreCountry = false;
  List<CountryLSModel?> _countryList = [];
  late ScrollController? _countryController;

  int get countryPage => _countryPage;

  bool get countryHasNextPage => _countryHasNextPage;

  bool get isFirstLoadCountry => _isFirstLoadCountry;

  bool get isLoadMoreCountry => _isLoadMoreCountry;

  List<CountryLSModel?> get countryList => _countryList;

  void setCountryScrollController(ScrollController newController) {
    _countryController = newController;
  }

  void loadCountryInitialData() async {
    if (locator<CountryProvider>().countriesList!.isEmpty) {
      _isFirstLoadCountry = true;
      try {
        final data = locator<CountryProvider>();
        await data.getListOfCountries(pageNo: _countryPage);
        if (data.countriesList!.isNotEmpty) {
          _countryList = data.countriesList!;
        }
      } catch (err) {
        LogUtils.logError(
            'Ignore This Error: Something went wrong while loading country data at initial phase!');
      }
      _isFirstLoadCountry = false;
      notifyListeners();
    } else {
      _countryList = locator<CountryProvider>().countriesList!;
      //notifyListeners();
    }
  }

  void loadMoreCountries() async {
    if (locator<CountryProvider>().countriesList!.isEmpty) {
      if (_countryHasNextPage == true &&
          _isFirstLoadCountry == false &&
          _isLoadMoreCountry == false &&
          _countryController!.position.extentAfter < 10) {
        _isLoadMoreCountry = true;
        _countryPage += 1;
        try {
          final data = locator<CountryProvider>();
          await data.getListOfCountries(pageNo: _countryPage);
          if (data.countriesList!.isNotEmpty) {
            _countryList.addAll(data.countriesList!);
          } else {
            _countryHasNextPage = false;
          }
        } catch (err) {
          LogUtils.logError(
              'Ignore This Error: Something went wrong while loading more country data!');
        }
        _isLoadMoreCountry = false;
        notifyListeners();
      }
    } else {
      _countryList = locator<CountryProvider>().countriesList!;
      notifyListeners();
    }
  }

// ============ End of Job Post Screen (Country) Pagination =====================

  Future<void> selectedCountryJob(int index) async {
    final jobFilterProvider = locator<JobFilterProvider>();
    if (jobFilterProvider.selectedCountryId == _countryList[index]!.id) {
      jobFilterProvider.setSelectedCountryId(-1);
    } else {
      jobFilterProvider.setSelectedCountryId(_countryList[index]!.id);
    }
    jobFilterProvider.setIsToClearJobList(true);
    jobFilterProvider.setSelectedJobCategoryId(-1);
    jobFilterProvider.setPage(1);
    clearJobs();
    loadInitialData();
    jobFilterProvider.setIsToClearJobList(false);
    notifyListeners();
  }

//===============Filter Job Option ==================

  bool _isToShowFilterBtn = false;
  bool _hasError = false;

  bool get isToShowFilterBtn => _isToShowFilterBtn;

  bool get hasError => _hasError;

  void setIsToShowFilterBtn(bool value) {
    _isToShowFilterBtn = value;
    notifyListeners();
  }

  void toggleFilterBtn() {
    _isToShowFilterBtn = !_isToShowFilterBtn;
    notifyListeners();
  }

  void setHasError(bool value) {
    _hasError = value;
    notifyListeners();
  }

//===============End of Filter Job Option ==================

  void removeJobByJobId(int? jobId) {
    _jobList.removeWhere((element) => element.jobId == jobId);
    notifyListeners();
  }
}
