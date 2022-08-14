import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';

Widget globalViewLayout({
  required double? height,
  double? width,
  required String leftHeaderTitle,
  required String rightHeaderTitle,
  void Function()? onTapToRightTitle,
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
