import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/services/navigation_service.dart';

import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/country_provider.dart';
import '../core/constants/routes.dart' as routes;

class CountryListViewScreen extends StatelessWidget {
  const CountryListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: FreeVisaFreeTicketTheme.gradientDecoration,
        ),
        title: Text(
          'Country',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: _buildCountriesItem(),
    );
  }

  /// Widget [_buildCountriesItem] : Display list of country name and its flag in horizontal list view
  Widget _buildCountriesItem() {
    final countryList = locator<CountryProvider>().countriesList;
    return ListView.builder(
      itemCount: countryList!.length,
      itemBuilder: (lCtx, index) {
        return Column(
          children: [
            if (index == 0) SizedBox(height: 10.h),
            ListTile(
              onTap: () {
                locator<NavigationService>()
                    .navigateTo(routes.countryJobsScreen);
              },
              leading: SvgPicture.network(
                'https://demo.freevisafreeticket.com/${countryList[index]!.flag}',
                height: 40.h,
                width: 40.w,
              ),
              title: Text(countryList[index]!.name!,
                  style: FreeVisaFreeTicketTheme.caption1Style),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: FreeVisaFreeTicketTheme.darkGrayColor,
              ),
            ),
            Divider(thickness: 1.h),
          ],
        );
      },
    );
  }
}
