import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/providers/job_provider.dart';

import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';
import '../../../core/constants/route_constants.dart' as routes;

Widget buildPreferredJobs(BuildContext context,  JobProvider value) {
  return globalViewLayout(context , 
    height: 520.h,
    width: 1.sw,
    leftHeaderTitle: 'Preferred Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(RouteConstants.latestJobListScreen, arguments: {
        'appBarTitle': 'Preferred Jobs',
      });
    },
    child: Padding(
      padding: EdgeInsets.only(left: 5.w, bottom: 10.h),
      child:  JobListViewScreen(data: value.jobListByJobCategory!,), //! TODO : prefered job
    ),
  
    isGradientBackground: false,
  );
}
