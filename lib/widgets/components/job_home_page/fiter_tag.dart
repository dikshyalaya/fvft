import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/constants/routes.dart' as routes;
import '../../../models/jobs_model.dart';
import '../../../providers/job_provider.dart';

Widget buildTagList() {
  return SizedBox(
    height: 80.h,
    width: double.infinity,
    child: ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0.0 : 10.0),
          child: _tagList[index],
        );
      },
      itemCount: _tagList.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}

final value = locator<JobProvider>();
final List<Widget> _tagList = [
  _buildTag(
    onTap: () {
      locator<NavigationService>().navigateTo(routes.latestJobListScreen,
          arguments: {'appBarTitle': 'All Jobs', 'jobs': value.allJobList!});
    },
    color: FreeVisaFreeTicketTheme.darkGreenColor,
    text: 'All Jobs',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Latest Jobs',
        'jobs': value.newJobList!,
      });
    },
    color: FreeVisaFreeTicketTheme.darkBlueColor,
    text: 'Latest Job',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>().navigateTo(
        routes.viewAllJobCategory,
      );
    },
    color: FreeVisaFreeTicketTheme.lightOrangeColor,
    text: 'Job Category',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Preferred Jobs',
      });
    },
    color: FreeVisaFreeTicketTheme.lightRedColor,
    text: 'Preferred Job',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Saved Jobs',
      });
    },
    color: FreeVisaFreeTicketTheme.secondaryColor,
    text: 'Saved Job',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Featured',
      });
    },
    color: FreeVisaFreeTicketTheme.darkPurpleColor,
    text: 'Featured',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>().navigateTo(routes.countryListViewScreen);
    },
    color: FreeVisaFreeTicketTheme.darkGrayColor,
    text: 'Country',
  ),
  _buildTag(
    onTap: () {
      // locator<NavigationService>()
      //     .navigateTo(routes.latestJobListScreen, arguments: {
      //   'appBarTitle': 'Saved Jobs',
      // });
    },
    color: FreeVisaFreeTicketTheme.purpleColor,
    text: 'Company',
  ),
];
Widget _buildTag({
  required void Function()? onTap,
  required Color? color,
  required String text,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10.w),
    child: Chip(
      backgroundColor: color,
      label: Text(
        text,
        style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
          color: FreeVisaFreeTicketTheme.whiteColor,
        ),
      ),
    ),
  );
}
