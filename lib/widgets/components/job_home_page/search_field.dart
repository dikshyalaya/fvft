import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/free_visa_free_ticket_theme.dart';

Widget buildSearchFiled() {
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
