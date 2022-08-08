import 'package:flutter/material.dart';
import 'category_list_screen.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TempCategoryListScreen extends StatelessWidget {
  const TempCategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.lerp(
          FreeVisaFreeTicketTheme.secondaryColor,
          FreeVisaFreeTicketTheme.primaryColor,
          0.1,
        ),
        title: Text(
          'Job Category',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: const CategoryListScreen(isToDisplayVertical: true),
      ),
    );
  }
}
