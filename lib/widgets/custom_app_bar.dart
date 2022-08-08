import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';

PreferredSizeWidget customAppBar({
  String? appBarTitle,
  bool isToShowTitle = true,
  bool isToCenterTitle = true,
  bool isToShowBackButton = true,
  List<Widget>? actions,
  Color? backgroundColor,
  Color? backBtnColor,
  double? titleFontSize,
  TabBar? bottomWidget,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: backgroundColor ?? Colors.transparent,
    title: !isToShowTitle
        ? null
        : customTitle(appBarTitle!, fontSize: titleFontSize),
    centerTitle: isToCenterTitle,
    leading: !isToShowBackButton
        ? null
        : customBackButton(backBtnColor: backBtnColor),
    actions: actions ?? [],
    bottom: bottomWidget,
  );
}

Widget customBackButton({final Color? backBtnColor}) {
  return IconButton(
    icon: CircleAvatar(
      backgroundColor: backBtnColor ?? FlexColor.greenLightPrimary,
      child: Icon(
        Icons.arrow_back,
        color: FreeVisaFreeTicketTheme.darkGrayColor,
        size: 60.w,
      ),
    ),
    onPressed: () {
      locator<NavigationService>().goBack();
    },
  );
}

Widget customTitle(String title, {double? fontSize}) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w),
    child: Text(
      title,
      style: fontSize == null
          ? FreeVisaFreeTicketTheme.heading1Style
          : FreeVisaFreeTicketTheme.heading1Style,
    ),
  );
}
