import 'package:flutter/material.dart';
import '../../core/constants/assets_source.dart';
import '../../providers/country_provider.dart';
import 'post/job_post_list_view.dart';

import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../widgets/custom_image_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../category/category_list_screen.dart';
import '../../core/constants/routes.dart' as routes;

final List<Widget> _tagList = [
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'All Jobs',
      });
    },
    color: FreeVisaFreeTicketTheme.darkGreenColor,
    text: 'All Jobs',
  ),
  _buildTag(
    onTap: () {
      locator<NavigationService>()
          .navigateTo(routes.latestJobListScreen, arguments: {
        'appBarTitle': 'Latest Jobs',
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
  required Color color,
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

class TempJobScreen extends StatelessWidget {
  const TempJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _jobScreen();
  }

  Widget _jobScreen() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      children: [
        CustomImageSlider(
          height: 300.h,
          isHeightRequired: false,
        ),
        _buildSearchFiled(),
        SizedBox(height: 20.h),
        _buildTagList(),
        SizedBox(height: 20.h),
        _buildCountriesList(),
        _buildJobCategoryList(),
        _buildPreferredJobs(),
        _buildLatestJobs(),
        _buildCompanyList(),
        _buildSavedJobs(),
        SizedBox(height: 150.h),
      ],
    );
  }

  Widget _buildSearchFiled() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: FreeVisaFreeTicketTheme.lightGrayColor,
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 0),
      width: 600.w,
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: FreeVisaFreeTicketTheme.lightGrayColor,
              size: 60.sp,
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Search for your jobs...',
                hintStyle: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.lightGrayColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.w),
            child: Container(
              width: 200.w,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.w),
                  bottomRight: Radius.circular(8.w),
                ),
                color: Color.lerp(
                  FreeVisaFreeTicketTheme.secondaryColor,
                  FreeVisaFreeTicketTheme.primaryColor,
                  0.1,
                ),
              ),
              child: Center(
                child: Text(
                  'Search',
                  style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagList() {
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

  Widget _buildCountriesList() {
    return _globalViewLayout(
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: countryList!.length,
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
                Text(countryList[index].flagCode,
                    style: FreeVisaFreeTicketTheme.heading1Style),
                SizedBox(width: 20.w),
                Text(countryList[index].countryName,
                    style: FreeVisaFreeTicketTheme.caption1Style),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildJobCategoryList() {
    return _globalViewLayout(
      height: 350.h,
      leftHeaderTitle: 'Job Category',
      rightHeaderTitle: 'View All',
      onTapToRightTitle: () {
        locator<NavigationService>().navigateTo(
          routes.viewAllJobCategory,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
        child: const CategoryListScreen(isToDisplayVertical: false),
      ),
      isGradientBackground: true,
    );
  }

  Widget _buildPreferredJobs() {
    return _globalViewLayout(
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

  Widget _buildLatestJobs() {
    return _globalViewLayout(
      height: 520.h,
      width: 1.sw,
      leftHeaderTitle: 'Latest Jobs',
      rightHeaderTitle: 'View All',
      onTapToRightTitle: () {
        locator<NavigationService>()
            .navigateTo(routes.latestJobListScreen, arguments: {
          'appBarTitle': 'Latest Jobs',
        });
      },
      leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
      rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
      isGradientBackground: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
        child: const JobPostListView(),
      ),
    );
  }

  Widget _buildCompanyList() {
    return _globalViewLayout(
      height: 300.h,
      leftHeaderTitle: 'Browse By Company',
      rightHeaderTitle: 'View All',
      onTapToRightTitle: () {
        locator<NavigationService>().navigateTo(
          routes.companyListScreen,
        );
      },
      child: ListView.builder(
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
                            style:
                                FreeVisaFreeTicketTheme.caption1Style.copyWith(
                              color: FreeVisaFreeTicketTheme.secondaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '(550)',
                            style:
                                FreeVisaFreeTicketTheme.caption1Style.copyWith(
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
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
      isGradientBackground: true,
    );
  }

  Widget _buildSavedJobs() {
    return _globalViewLayout(
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
        child: const JobPostListView(),
      ),
      isGradientBackground: false,
      leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
      rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
    );
  }

  Widget _globalViewLayout({
    required double height,
    double? width,
    required String leftHeaderTitle,
    required String rightHeaderTitle,
    required void Function()? onTapToRightTitle,
    required Widget child,
    bool isGradientBackground = true,
    Color backgroundColor = FreeVisaFreeTicketTheme.whiteColor,
    Color leftTitleColor = FreeVisaFreeTicketTheme.whiteColor,
    Color rightTitleColor = FreeVisaFreeTicketTheme.whiteColor,
  }) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      decoration: isGradientBackground
          ? const BoxDecoration(
        gradient: FreeVisaFreeTicketTheme.appLinearGradient,
      )
          : BoxDecoration(color: backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  leftHeaderTitle,
                  style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                    color: leftTitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onTapToRightTitle,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerRight,
                  ),
                  child: Text(
                    rightHeaderTitle,
                    style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                      color: rightTitleColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
