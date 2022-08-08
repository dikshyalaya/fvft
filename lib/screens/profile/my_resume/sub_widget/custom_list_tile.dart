import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/free_visa_free_ticket_theme.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? date;
  final void Function()? onTap;
  final void Function()? editTap;

  const CustomListTile(
      {Key? key,
      @required this.title,
      @required this.subTitle,
      @required this.date,
      @required this.onTap,
      @required this.editTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: onTap,
        contentPadding:
            EdgeInsets.only(left: 20.w, right: 10.w, top: 10.h, bottom: 10.h),
        title: Text(
          title ?? '',
          style: FreeVisaFreeTicketTheme.bodyTextStyle
              .copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subTitle ?? '',
              style: FreeVisaFreeTicketTheme.body1TextStyle,
            ),
            Text(
              date ?? '',
              style: FreeVisaFreeTicketTheme.body2TextStyle,
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete_forever,
            size: 40.w,
            color: Colors.red,
          ),
          onPressed: editTap,
        ),
      ),
    );
  }
}
