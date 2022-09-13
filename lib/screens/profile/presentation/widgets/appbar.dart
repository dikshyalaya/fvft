import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/theme/free_visa_free_ticket_theme.dart';

Widget profileScreenAppBar() => Container(
      height: 104.h,
      width: 750.w,
      decoration: BoxDecoration(
        gradient: FreeVisaFreeTicketTheme.appLinearGradient,
      ),
    );
