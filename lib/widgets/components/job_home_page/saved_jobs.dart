import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/constants/route_constants.dart' as routes;
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/job_provider.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';

Widget buildSavedJobs( BuildContext context , JobProvider value) {
  return globalViewLayout(
context , 
    height: 520.h,
    width: 1.sw,
    leftHeaderTitle: 'Saved Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(
          RouteConstants.latestJobListScreen, arguments: {
        'appBarTitle': 'Saved Jobs',
        'jobs' : value.allJobList
      });
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 10.w),
      child: JobListViewScreen(data: value.newJobList!,),  //! Saved Jobs
    ),
    isGradientBackground: false,
   
  );
}
