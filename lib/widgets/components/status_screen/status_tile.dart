import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/free_visa_free_ticket_theme.dart';

Widget buildStatusTile({
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
