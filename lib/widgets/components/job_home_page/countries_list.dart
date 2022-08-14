import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_visa_free_ticket/core/utilities/environment.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/country_provider.dart';
import '../global_view_layout.dart';
import '../../../core/constants/routes.dart' as routes;

Widget buildCountriesList() {
  return globalViewLayout(
    height: 150.h,
    leftHeaderTitle: 'Country',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>().navigateTo(
        routes.countryListViewScreen,
      );
    },
    child: _buildCountriesItem(),
    leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
    rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
    backgroundColor: FreeVisaFreeTicketTheme.lightGrayColor.withOpacity(0.15),
    isGradientBackground: false,
  );
}

/// Widget [_buildCountriesItem] : Display list of country name and its flag in horizontal list view
Widget _buildCountriesItem() {
  final countryList = locator<CountryProvider>().countriesList;
  print(countryList!.length);
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: countryList.length,
    itemBuilder: (lCtx, index) {
      return Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
        child: Chip(
          elevation: 5,
          backgroundColor: FreeVisaFreeTicketTheme.whiteColor,
          labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.network(
                'https://demo.freevisafreeticket.com/${countryList[index]!.flagCode!}',
                height: 40.h,
                width: 40.w,
              ),
              SizedBox(width: 20.w),
              Text(countryList[index]!.countryName!,
                  style: FreeVisaFreeTicketTheme.caption1Style),
              Text(' ( ${countryList[index]!.nativeName!} )',
                  style: FreeVisaFreeTicketTheme.caption1Style),
            ],
          ),
        ),
      );
    },
  );
}
