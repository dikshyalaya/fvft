import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/utilities/enum_utils.dart';
import '../../../providers/job_application_provider.dart';
import 'package:free_visa_free_ticket/core/constants/route_constants.dart' as routes;

Widget buildSelectedApplication() {
  return Card(
    color: FreeVisaFreeTicketTheme.darkGreenColor,
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: ListTile(
      onTap: () {
        locator<JobApplicationProvider>()
            .setJobStatusBtnName(JobStatus.accepted);
        locator<NavigationService>()
            .navigateTo(RouteConstants.tempShortListedJobScreen);
      },
      title: Text(
        'Final Selected Application',
        style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
          color: FreeVisaFreeTicketTheme.whiteColor,
        ),
      ),
      trailing: CircleAvatar(
        radius: 22,
        backgroundColor: FreeVisaFreeTicketTheme.whiteColor,
        child: Text(
          '10',
          style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
            color: FreeVisaFreeTicketTheme.darkGreenColor,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ),
  );
}
