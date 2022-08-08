import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/constants/assets_source.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../core/utilities/app_utils.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/job_application_model.dart';
import 'paginations/category_jobs_pagination_provider.dart';
import 'paginations/job_pagination_provider.dart';
import '../repositories/job_repository.dart';
import '../widgets/custom_snackbar.dart';
import '../core/constants/routes.dart' as routes;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'auth_provider.dart';
import 'job_provider.dart';

class JobApplicationProvider with ChangeNotifier {
  List<JobApplicationModel> _onProcessJobList = [];
  List<JobApplicationModel> _acceptedJobList = [];
  List<JobApplicationModel> _rejectedJobList = [];

  List<JobApplicationModel> get onProcessJobList => _onProcessJobList;

  List<JobApplicationModel> get acceptedJobList => _acceptedJobList;

  List<JobApplicationModel> get rejectedJobList => _rejectedJobList;

  void setOnProcessJob(List<JobApplicationModel> value) {
    _onProcessJobList = value;
    notifyListeners();
  }

  void setAcceptedJob(List<JobApplicationModel> value) {
    _acceptedJobList = value;
    notifyListeners();
  }

  void setRejectedJob(List<JobApplicationModel> value) {
    _rejectedJobList = value;
    notifyListeners();
  }

  // =========================== Function to fetch user applied jobs i.e. pending, accepted and on process =========================

  Future<void> getOnProcessJobList() async {
    try {
      final response = await JobRepository.onProcessJobList();
      if (response.data != null && response.data['success']) {
        _onProcessJobList.clear();
        _onProcessJobList
            .addAll(convertDynamicListToJobApplication(response.data['data'])!);
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Error: Get on process job list: ${e.response}');
      LogUtils.logError('Dio Error: Get on process job list: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error: Get on process job list: $e');
    }
  }

  Future<void> getAcceptedJobList() async {
    try {
      final response = await JobRepository.acceptedJobList();
      if (response.data != null && response.data['success']) {
        _acceptedJobList.clear();
        _acceptedJobList
            .addAll(convertDynamicListToJobApplication(response.data['data'])!);
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Error: Get on accepted job list: ${e.response}');
      LogUtils.logError('Dio Error: Get on accepted job list: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error: Get on accepted job list: $e');
    }
  }

  Future<void> getPendingJobList() async {
    try {
      final response = await JobRepository.onPendingJobList();
      if (response.data != null && response.data['success']) {
        _rejectedJobList.clear();
        _rejectedJobList
            .addAll(convertDynamicListToJobApplication(response.data['data'])!);
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Error: Get on pending job list: ${e.response}');
      LogUtils.logError('Dio Error: Get on pending job list: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error: Get on pending job list: $e');
    }
  }

  // =========================== End function to fetch user applied jobs i.e. pending, accepted and on process =========================

  // ==================== Apply for new job, display alert dialog related to job apply, ====================
  bool isApplyingForJob = false;
  int selectedJobId = -1;

  Future<void> applyForJob(final context,
      {int? jobId, bool isFromJobDetailScreen = false}) async {
    if (locator<AuthProvider>().currentUser == null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure you want to apply for job?',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Please press Yes to login and apply for job.',
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            actions: <Widget>[
              InkWell(
                child: const Text(
                  'Cancel',
                  style: TextStyle(),
                ),
                onTap: () {
                  locator<NavigationService>().goBack();
                },
              ),
              const SizedBox(width: 4.0),
              ActionChip(
                label: const Text(
                  '   Yes   ',
                  // style: TextStyle(
                  //   color: C,
                  // ),
                ),
                backgroundColor: Colors.transparent,
                onPressed: () {
                  locator<NavigationService>().goBack();
                  locator<NavigationService>()
                      .pushReplacementNamed(routes.tempLoginScreen);
                  // locator<NavigationService>()
                  //     .pushReplacementNamed(routes.loginRoute);
                },
              ),
            ],
          );
        },
      );
    } else {
      isApplyingForJob = true;
      selectedJobId = jobId!;
      notifyListeners();
      final List result = await Future.wait([
        _applyForNewJob(jobId),
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              Future.delayed(const Duration(seconds: 5), () {
                locator<NavigationService>().goBack();
              });
              return AlertDialog(
                actionsPadding: EdgeInsets.zero,
                title: Text(
                  'Your job application is being registered.',
                  style: FreeVisaFreeTicketTheme.caption1Style,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(AssetsSource.onProcessAnimation1),
                    Text(
                      'Please ! wait for a few seconds...',
                      style: FreeVisaFreeTicketTheme.body1TextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: const [],
              );
            }),
      ]);
      if (result.first) {
        locator<JobProvider>().removeJobByJobId(jobId);
        locator<JobProvider>().removeJobFromJobCategoryByJobId(jobId);
        locator<CategoryJobsPaginationProvider>().removeJobByJobId(jobId);
        locator<JobPaginationProvider>().removeJobByJobId(jobId);
      }
      showCustomSnackBar(
          context: context,
          message: result.first
              ? 'Job Applied Successful'
              : 'Job Applied Unsuccessful',
          isError: !result.first);
      isApplyingForJob = false;
      notifyListeners();
      if (isFromJobDetailScreen) {
        locator<NavigationService>().goBack();
      }
    }
  }

  Future<bool> _applyForNewJob(int jobId) async {
    try {
      final response = await JobRepository.applyJob(jobId);
      if (response.data != null && response.data['success']) {
        _onProcessJobList
            .add(JobApplicationModel.fromJson(response.data['data']));
        notifyListeners();
        return true;
      }
      return false;
    } on DioError catch (e) {
      LogUtils.logError('Dio Error: Apply for job: ${e.response}');
      LogUtils.logError('Dio Error: Apply for job: ${e.message}');
      return false;
    } catch (e) {
      LogUtils.logError('Error: Apply for job: $e');
      return false;
    }
  }

// ==================== End Apply for new job, display alert dialog related to job apply, ====================

  String jobStatusBtnName = JobStatus.applyNow.stringValue;

  void setJobStatusBtnName(JobStatus jobStatus) {
    jobStatusBtnName = jobStatus.stringValue;
    notifyListeners();
  }
}
