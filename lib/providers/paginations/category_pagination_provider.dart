import 'package:flutter/material.dart';
import '../../core/services/service_locator.dart';
import '../../models/local_storage/job_category_model.dart';

import '../job_provider.dart';

class CategoryPaginationProvider with ChangeNotifier {
  // =============================================================
  //      DO NOT MODIFY IT, IF YOU DON'T HAVE PROPER IDEA ON IT
  //==============================================================
  int _page = 1;
  bool _hasNextPage = true;
  bool _isLoadingInitialData = false;
  bool _isLoadingMoreData = false;
  List<JobCategoryModel> _jobCategoryList = [];

  // The controller for the ListView
  ScrollController? _controller = ScrollController();

  int get currentPage => _page;

  bool get hasNextPage => _hasNextPage;

  bool get isLoadingInitialData => _isLoadingInitialData;

  bool get isLoadingMoreData => _isLoadingMoreData;

  List<JobCategoryModel> get jobCategoryList => _jobCategoryList;

  ScrollController get controller => _controller!;

  void disposeScrollController() => _controller!.removeListener(loadMoreData);

  void scrollControllerListener() => _controller!.addListener(loadMoreData);

  void loadInitialData() async {
    if (locator<JobProvider>().jobCategoriesList!.isEmpty) {
      _isLoadingInitialData = true;
      try {
        final data = locator<JobProvider>();
        await data.getListOfJobsCategories(pageNo: _page);
        if (data.jobCategoriesList!.isNotEmpty) {
          _jobCategoryList = data.jobCategoriesList!;
        }
        _isLoadingInitialData = false;
        notifyListeners();
      } catch (err) {
        _isLoadingInitialData = false;
        notifyListeners();
      }
    } else {
      _jobCategoryList = locator<JobProvider>().jobCategoriesList!;
      // notifyListeners();
    }
  }

  void loadMoreData() async {
    if (locator<JobProvider>().jobCategoriesList!.isEmpty) {
      if (_hasNextPage == true &&
          _isLoadingInitialData == false &&
          _isLoadingMoreData == false &&
          _controller!.position.extentAfter < 10) {
        _isLoadingMoreData = true;
        notifyListeners();
        _page += 1;
        try {
          final data = locator<JobProvider>();
          await data.getListOfJobsCategories(pageNo: _page);
          if (data.jobCategoriesList!.isNotEmpty) {
            _jobCategoryList.addAll(data.jobCategoriesList!);
          } else {
            _hasNextPage = false;
          }
          _isLoadingMoreData = false;
          notifyListeners();
        } catch (err) {
          _isLoadingMoreData = false;
          notifyListeners();
        }
      }
    } else {
      _jobCategoryList = locator<JobProvider>().jobCategoriesList!;
      // notifyListeners();
    }
  }
}
