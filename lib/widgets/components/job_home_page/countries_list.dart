import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/country_provider.dart';
import '../global_view_layout.dart';
import '../../../core/constants/route_constants.dart' as routes;

Widget buildCountriesList(
  BuildContext context,
) {
  return globalViewLayout(
    context,
    height: 150.h,
    leftHeaderTitle: 'Country',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>().navigateTo(
        RouteConstants.countryListViewScreen,
      );
    },
    child: _buildCountriesItem(context),
    isGradientBackground: false,
  );
}

/// Widget [_buildCountriesItem] : Display list of country name and its flag in horizontal list view
Widget _buildCountriesItem(
  BuildContext context,
) {
  final countryList = locator<CountryProvider>().countriesList;

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: countryList!.length,
      itemBuilder: (lCtx, index) {
        log(countryList[index].toString());
        return InkWell(
          onTap: () {
            locator<NavigationService>().navigateTo(RouteConstants.countryJobsScreen);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
            child: Chip(
              elevation: 5,
              backgroundColor: Theme.of(context).primaryColor,
              labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.network(
                    'https://demo.freevisafreeticket.com/${countryList[index]!.flag!}',
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(width: 20.w),
                  Text(countryList[index]!.name!,
                      style: FreeVisaFreeTicketTheme.caption1Style),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
