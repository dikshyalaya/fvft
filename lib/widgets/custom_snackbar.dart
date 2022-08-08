import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';

ScaffoldMessengerState showCustomSnackBar({
  required BuildContext context,
  required String message,
  bool isError = false,
  IconData? icon,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon ?? Icons.error,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                message,
                style: FreeVisaFreeTicketTheme.body2TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.whiteColor,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor:
            isError ? Colors.red : FreeVisaFreeTicketTheme.darkGreenColor,
      ),
    );
}
