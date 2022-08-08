import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/service_locator.dart';
import '../../providers/theme_provider.dart';

class FreeVisaFreeTicketTheme {
  static Decoration? gradientDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(50.w),
    gradient: FreeVisaFreeTicketTheme.appLinearGradient,
  );

  static const Gradient appLinearGradient = LinearGradient(
    begin:  Alignment(-1.0, -1.0),
    end: Alignment(1.0, 4.0),
    colors:  [
      FreeVisaFreeTicketTheme.primaryColor,
      FreeVisaFreeTicketTheme.secondaryColor,
    ],
  );
  static const Color primaryColor = Color.fromRGBO(32, 146, 255, 1);

  // caption color
  static const Color secondaryColor = Color.fromRGBO(4, 78, 248, 1);

  static Color? primaryAndSecondaryColor = Color.lerp(
    FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
    FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
    0.8,
  );

  // view all color
  static const Color highlightedTextColor = Color.fromRGBO(8, 51, 88, 1);

  // tag color
  static const Color darkGreenColor = Color.fromRGBO(33, 150, 83, 1);
  static const Color darkBlueColor = Color.fromRGBO(47, 128, 237, 1);
  static const Color lightOrangeColor = Color.fromRGBO(242, 153, 74, 1);
  static const Color lightRedColor = Color.fromRGBO(235, 87, 87, 1);
  static const Color darkVioletColor = Color.fromRGBO(155, 81, 224, 1);

  // used in applied btn
  static const Color darkGrayColor = Color.fromRGBO(104, 104, 104, 1);

  // use in fav btn
  static const Color darkRedColor = Color.fromRGBO(250, 25, 25, 1);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);

  // use in icon
  static const Color lightGrayColor = Color.fromRGBO(165, 165, 165, 1);
  static const Color lightWhiteColor = Color.fromRGBO(237, 237, 237, 1);

  static const Color purpleColor = Color.fromRGBO(103, 78, 254, 1);
  static const Color darkPurpleColor = Color.fromRGBO(182, 11, 186, 1);

  // use in information Screen
  static const Color lightGray = Color(0xFFF2F2F2);

  static const FlexScheme usedFlexScheme = FlexScheme.green;

  /// FUNC [primaryThemeData] : get the primary theme for app
  static ThemeData get primaryThemeData => FlexColorScheme.light(
        scheme: usedFlexScheme,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.lerp(
                FreeVisaFreeTicketTheme.primaryColor,
                FreeVisaFreeTicketTheme.secondaryColor,
                0.8,
              ),
            ),
        // Use comfortable on desktops instead of compact, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: 'Poppins',
      ).toTheme;

  /// FUNC [darkThemeData] : get the dark theme for app
  static ThemeData get darkThemeData => FlexColorScheme.dark(
        scheme: usedFlexScheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: 'Poppins',
      ).toTheme;

  static TextStyle get heading1Style => TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get heading2Style => TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.w600,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get heading3Style => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get captionStyle => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get caption1Style => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w500,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get bodyTextStyle => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get body1TextStyle => TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w400,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get body2TextStyle => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get body3TextStyle => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        color: locator<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontFamily: 'Poppins',
      );

  static TextStyle get body4TextStyle => TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'Poppins',
      );

  static TextStyle get tabBarStyle => TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w500,
      );

  static MarkdownStyleSheet get markdownStyleSheet =>
      MarkdownStyleSheet.fromTheme(
        ThemeData(
          textTheme: TextTheme(
            caption: captionStyle,
            subtitle1: caption1Style,
            subtitle2: bodyTextStyle,
            bodyText1: body1TextStyle,
            bodyText2: body2TextStyle,
            headline1: heading1Style,
            headline2: heading2Style,
            headline3: heading3Style,
            headline4: captionStyle,
            headline5: caption1Style,
            headline6: bodyTextStyle,
          ),
        ),
      );
}
