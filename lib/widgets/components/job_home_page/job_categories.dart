import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../screens/category/category_list_screen.dart';
import '../global_view_layout.dart';
import '../../../core/constants/routes.dart' as routes;

Widget buildJobCategoryList(
  BuildContext context,
) {
  return globalViewLayout(
    context,
    height: 350.h,
    leftHeaderTitle: 'Job Category',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>().navigateTo(
        routes.viewAllJobCategory,
      );
    },
    child: Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
      child: const CategoryListScreen(isToDisplayVertical: false),
    ),
    isGradientBackground: true,
  );
}
