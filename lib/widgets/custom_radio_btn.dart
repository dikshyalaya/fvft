import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../providers/theme_provider.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T? value;
  final T? groupValue;
  final String? label;
  final String? text;
  final ValueChanged<T?>? onChanged;

  const MyRadioOption({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 50.w,
      height: 50.w,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: locator<ThemeProvider>().isLightTheme()
                ? Colors.white
                : FlexColor.greyLawDarkPrimaryVariant.withOpacity(0.5),
          ),
        ),
        color: isSelected ? FlexColor.greenLightPrimary : Colors.white,
      ),
      child: Center(
        child: Container(
          height: 45.w,
          width: 45.w,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(
                color: locator<ThemeProvider>().isLightTheme()
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            color: isSelected ? FlexColor.greenLightPrimary : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text!,
      style: FreeVisaFreeTicketTheme.caption1Style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () => onChanged!(value),
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
          child: Row(
            children: [
              _buildLabel(),
              SizedBox(width: 10.w),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
