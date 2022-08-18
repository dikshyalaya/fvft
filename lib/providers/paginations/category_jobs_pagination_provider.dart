import 'package:flutter/material.dart';
import '../../core/services/service_locator.dart';

import '../../models/jobs_model.dart';
import '../job_provider.dart';

class CategoryJobsPaginationProvider with ChangeNotifier {
  // =============================================================
  //      DO NOT MODIFY IT, IF YOU DON'T HAVE PROPER IDEA ON IT
  //==============================================================
  int _page = 1;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<JobModel> _jobList = [];
  late ScrollController? _controller;
  int? _jobCategoryId;

  int get page => _page;

  bool get hasNextPage => _hasNextPage;

  bool get isFirstLoadRunning => _isFirstLoadRunning;

  bool get isLoadMoreRunning => _isLoadMoreRunning;

  List<JobModel> get jobList => _jobList;

  void setScrollController(ScrollController scrollController) {
    _controller = scrollController;
  }

  void setJobCategoryId(int? jobCategoryId) {
    _jobCategoryId = jobCategoryId;
    notifyListeners();
  }

  void loadInitialData() async {
    _isFirstLoadRunning = true;
    try {
      final data = locator<JobProvider>();
      await data.getJobListByJobCategory(
          pageNo: _page, jobCategoryId: _jobCategoryId!);
      if (data.jobListByJobCategory!.isNotEmpty) {
        // _jobList = data.jobListByJobCategory!; //! TODO : Uncomment this line
        notifyListeners();
      }
    } catch (err) {
      print('Something went wrong first loading');
    }
    _isFirstLoadRunning = false;
    notifyListeners();
  }

  void loadMoreData() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller!.position.extentAfter < 10) {
      _isLoadMoreRunning = true;
      _page += 1; // Increase _page by 1
      try {
        final data = locator<JobProvider>();
        await data.getJobListByJobCategory(
            pageNo: _page, jobCategoryId: _jobCategoryId!);
        if (data.jobListByJobCategory!.isNotEmpty) {
          // _jobList.addAll(data.jobListByJobCategory!); //! Uncomment this line
          notifyListeners();
        } else {
          _hasNextPage = false;
          notifyListeners();
        }
      } catch (err) {
        print('Something went wrong while loading more data!');
      }
      _isLoadMoreRunning = false;
      notifyListeners();
    }
  }

  void removeJobByJobId(int? jobId) {
    _jobList.removeWhere((element) => element.jobId == jobId);
    notifyListeners();
  }
}
