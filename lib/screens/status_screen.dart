import 'package:flutter/material.dart';
import '../core/services/navigation_service.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/routes.dart' as routes;

import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../providers/auth_provider.dart';
import '../providers/job_application_provider.dart';
import '../widgets/login_to_continue_widget.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return locator<AuthProvider>().currentUser == null
        ? const LoginToContinueWidget()
        : ListView(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            children: [
              SizedBox(height: 20.h),
              _buildStatusTitle(),
              ..._buildStatusActions(),
              _buildSelectedApplication(),
            ],
          );
  }

  Widget _buildStatusTitle() {
    return Text(
      'Application Status',
      textAlign: TextAlign.center,
      style: FreeVisaFreeTicketTheme.heading3Style.copyWith(
        color: FreeVisaFreeTicketTheme.darkGrayColor,
      ),
    );
  }

  List<Widget> _buildStatusActions() {
    return [
      Divider(thickness: 5.w),
      Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatusTile(
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
              child: _buildStatusTile(
                onTap: () {},
                color: FreeVisaFreeTicketTheme.darkGreenColor,
                totalValue: '10',
                title: 'Application Viewed',
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatusTile(
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
              child: _buildStatusTile(
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
              child: _buildStatusTile(
                onTap: () {},
                color: FreeVisaFreeTicketTheme.primaryColor,
                totalValue: '10',
                title: 'Selected for Interview',
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatusTile(
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

  Widget _buildStatusTile({
    required void Function()? onTap,
    required Color? color,
    required String totalValue,
    required String title,
  }) {
    return SizedBox(
      height: 200.h,
      child: InkWell(
        radius: 50.w,
        onTap: onTap,
        child: Card(
          color: color,
          shadowColor: FreeVisaFreeTicketTheme.whiteColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
            side: BorderSide(
              color: FreeVisaFreeTicketTheme.whiteColor,
              width: 2.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: FreeVisaFreeTicketTheme.whiteColor,
                  child: Text(
                    totalValue,
                    style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
                      color: color,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  title,
                  style: FreeVisaFreeTicketTheme.body2TextStyle.copyWith(
                    color: FreeVisaFreeTicketTheme.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedApplication() {
    return Card(
      color: FreeVisaFreeTicketTheme.darkGreenColor,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListTile(
        onTap: () {
          locator<JobApplicationProvider>()
              .setJobStatusBtnName(JobStatus.accepted);
          locator<NavigationService>()
              .navigateTo(routes.tempShortListedJobScreen);
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
}
