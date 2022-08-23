import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/providers/company_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/assets_source.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/constants/routes.dart' as routes;
import '../global_view_layout.dart';

Widget buildCompanyList() {
  return globalViewLayout(
    height: 300.h,
    leftHeaderTitle: 'Browse By Company',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>().navigateTo(
        routes.companyListScreen,
      );
    },
    child: Consumer<CompanyProvider>(
      builder: ((context, value, child) => ListView.builder(
            padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 3,
                child: SizedBox(
                  height: 200.h,
                  width: 600.w,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsSource.freeVisaFreeTicketLogo,
                        width: 200.w,
                        height: 200.h,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Huwaei Malaysia Sdn. Bhd.',
                                style: FreeVisaFreeTicketTheme.caption1Style
                                    .copyWith(
                                  color: FreeVisaFreeTicketTheme.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '(550)',
                                style: FreeVisaFreeTicketTheme.caption1Style
                                    .copyWith(
                                  color: FreeVisaFreeTicketTheme.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: value.companiesList.length,
            scrollDirection: Axis.horizontal,
          )),
    ),
    isGradientBackground: true,
  );
}
