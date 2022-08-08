import 'package:flutter/material.dart';
import 'widget/news_list_item.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestNewsScreen extends StatelessWidget {
  const LatestNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTitle: 'Latest News',
        titleFontSize: 36.sp,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return const NewsListItem();
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
