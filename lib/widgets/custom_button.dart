import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Widget [CustomButton] : CustomButton for creating custom button
class CustomButton extends StatelessWidget {
  //Variable
  final void Function()? onTap;
  final String? title;
  final Color? color;
  final Color? textColor;
  final Color? disableColor;
  final double? height, width;
  final EdgeInsets? padding;
  final bool? isLoading;
  final double? borderRadius;
  final FontWeight? btnTitleFontWeight;
  final bool? isToHideTile;
  final Widget? widget;
  final double elevation;

  const CustomButton({
    Key? key,
    this.onTap,
    this.title,
    this.color,
    //this.disableColor = FreeVisaFreeTicketTheme.primaryDark,
    this.disableColor = FlexColor.greyLawDarkPrimary,
    this.width,
    this.height,
    this.isLoading = false,
    this.padding,
    //this.textColor = FreeVisaFreeTicketTheme.white,
    this.textColor = FlexColor.greyLawDarkPrimary,
    this.borderRadius,
    this.btnTitleFontWeight,
    this.isToHideTile = false,
    this.widget,
    this.elevation = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 460.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disableColor;
            }
            return color;
          }),
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(
            padding ??
                EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 25.h,
                ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
        ),
        onPressed: isLoading! ? null : onTap,
        child: isLoading!
            ? SizedBox(
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 3,
                ),
                height: 32.w,
                width: 32.w,
              )
            : isToHideTile!
                ? widget
                : Text(
                    title!,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 32.sp,
                      fontWeight: btnTitleFontWeight ?? FontWeight.w600,
                      color: textColor,
                    ),
                  ),
      ),
    );
  }
}
