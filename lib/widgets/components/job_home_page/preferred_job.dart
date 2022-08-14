import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';
import '../../../core/constants/routes.dart' as routes;

Widget buildPreferredJobs() {
  return globalViewLayout(
    height: 520.h,
    width: 1.sw,
    leftHeaderTitle: 'Preferred Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Preferred Jobs',
      });
    },
    child: Padding(
      padding: EdgeInsets.only(left: 5.w, bottom: 10.h),
      child: const JobPostListView(),
    ),
    leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
    rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
    backgroundColor: FreeVisaFreeTicketTheme.lightGrayColor.withOpacity(0.15),
    isGradientBackground: false,
  );
}
