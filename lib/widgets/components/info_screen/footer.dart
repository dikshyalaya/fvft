import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/free_visa_free_ticket_theme.dart';

Widget infoFooter() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FreeVisaFreeTicketTheme.secondaryColor,
            FreeVisaFreeTicketTheme.primaryColor,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Text(
            'For more information, please contact here',
            style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
              color: FreeVisaFreeTicketTheme.whiteColor,
            ),
          ),
          const Divider(
            thickness: 1,
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
          SizedBox(height: 10.h),
          _buildMoreInfo(
            title: 'Phone',
            value: '+977-14256457',
          ),
          SizedBox(height: 10.h),
          _buildMoreInfo(
            title: 'Email',
            value: 'support@freevisafreeticket.com',
          ),
          SizedBox(height: 10.h),
          _buildMoreInfo(
            title: 'Facebook',
            value: 'fb.com/freevisafreeticket',
          ),
          SizedBox(height: 10.h),
          _buildMoreInfo(
            title: 'Web',
            value: 'htttps://www.freevisafreeticket.com',
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );

Widget _buildMoreInfo({
  required String? title,
  required String? value,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          '$title:',
          style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Text(
          '     $value',
          style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
    ],
  );
}
