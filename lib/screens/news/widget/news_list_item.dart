import 'package:flutter/material.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewsListItem extends StatelessWidget {
  const NewsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(RouteConstants.newsDetailRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sports',
                  style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                    color: const Color(0xFFFD5530),
                  ),
                ),
                Text('Topic of the news',
                    style: FreeVisaFreeTicketTheme.caption1Style,
                    softWrap: true,
                    maxLines: 3),
                SizedBox(height: 10.h),
                Text('20 Jan 2021',
                    style: FreeVisaFreeTicketTheme.bodyTextStyle),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            child: Image.network(
              'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
              height: 150.w,
              width: 250.w,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
        ],
      ),
    );
  }
}
