
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/constants/routes.dart' as routes;

import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/utilities/enum_utils.dart';
import '../../../providers/job_application_provider.dart';
import 'status_tile.dart';


List<Widget> buildStatusActions() {
  return [
    Divider(thickness: 5.w),
    Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {
                
                locator<JobApplicationProvider>()
                    .setJobStatusBtnName(JobStatus.onProcess);
                locator<NavigationService>()
                    .navigateTo(routes.tempAppliedJobScreen);
              },
              color: FreeVisaFreeTicketTheme.lightOrangeColor,
              totalValue: '10',
              title: 'Applied Jobs',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {},
              color: FreeVisaFreeTicketTheme.darkGreenColor,
              totalValue: '10',
              title: 'Application Viewed',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {},
              color: FreeVisaFreeTicketTheme.purpleColor,
              totalValue: '10',
              title: 'Applied Not Viewed',
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {
                locator<JobApplicationProvider>()
                    .setJobStatusBtnName(JobStatus.accepted);
                locator<NavigationService>()
                    .navigateTo(routes.tempShortListedJobScreen);
              },
              color: FreeVisaFreeTicketTheme.darkPurpleColor,
              totalValue: '10',
              title: 'Short-listed Application',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {},
              color: FreeVisaFreeTicketTheme.primaryColor,
              totalValue: '10',
              title: 'Selected for Interview',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildStatusTile(
              onTap: () {
                locator<JobApplicationProvider>()
                    .setJobStatusBtnName(JobStatus.rejected);
                locator<NavigationService>()
                    .navigateTo(routes.tempRejectedApplication);
              },
              color: FreeVisaFreeTicketTheme.darkRedColor,
              totalValue: '10',
              title: 'Rejected Application',
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    ),
    Divider(thickness: 5.w),
  ];
}
