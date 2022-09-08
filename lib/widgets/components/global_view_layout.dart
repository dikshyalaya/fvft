import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';

Widget globalViewLayout(
  BuildContext context , 
  {
  required double? height,
  double? width,
  required String leftHeaderTitle,
  required String rightHeaderTitle,
  void Function()? onTapToRightTitle,
  required Widget child,
  bool isGradientBackground = true,
  // Color backgroundColor =Theme.of(context).primaryColor,
  // Color leftTitleColor = FreeVisaFreeTicketTheme.whiteColor,
  // Color rightTitleColor = FreeVisaFreeTicketTheme.whiteColor,
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
        : BoxDecoration(color: Theme.of(context).primaryColor),
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
                  color: Theme.of(context).textTheme.caption!.color,
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
                    color: Theme.of(context).textTheme.caption!.color,
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
