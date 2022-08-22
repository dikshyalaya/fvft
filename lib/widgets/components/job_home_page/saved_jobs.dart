import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/constants/routes.dart' as routes;
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';

Widget buildSavedJobs() {
  return globalViewLayout(
    height: 520.h,
    width: 1.sw,
    leftHeaderTitle: 'Saved Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Saved Jobs',
      });
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 10.w),
      child: const LatestJobListViewScreen(),
    ),
    isGradientBackground: false,
    leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
    rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
  );
}
