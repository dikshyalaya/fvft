import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/providers/job_provider.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';
import '../../../core/constants/routes.dart' as routes;

Widget buildLatestJobs(JobProvider value) {
  return globalViewLayout(
    height: 550.h,
    width: 1.sw,
    leftHeaderTitle: 'Latest Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Latest Jobs',
        'jobs' : value.newJobList!,
      
      });
    },
    leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
    rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
    isGradientBackground: false,
    child: Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
      child:  JobListViewScreen(data: value.newJobList!,),
    ),
  );
}
