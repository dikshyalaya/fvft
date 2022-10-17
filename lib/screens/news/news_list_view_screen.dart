import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/route_constants.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../models/news_model.dart';
import '../../providers/news_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_slider.dart';
import '../../core/constants/route_constants.dart' as routes;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewsListViewScreen extends StatefulWidget {
  const NewsListViewScreen({Key? key}) : super(key: key);

  @override
  State<NewsListViewScreen> createState() => _NewsListViewScreenState();
}

class _NewsListViewScreenState extends State<NewsListViewScreen> {
  bool _isInit = true;
  Future? _getAllFunc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isInit) {
      _getAllFunc = _loadAllFunc();
    }
    _isInit = false;
  }

  Future<void> _loadAllFunc() async {
    await Provider.of<NewsProvider>(context, listen: false).getListOfNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar( context , 
        appBarTitle: 'News',
        titleFontSize: 36.sp,
      ),
      body: FutureBuilder(
        future: _getAllFunc,
        builder: (fCtx, snapShotData) {
          return snapShotData.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  children: [
                    CustomImageSlider(height: 400.h),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          _buildCationAndShowMore(),
                          SizedBox(height: 10.h),
                          _buildListOfNews(),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildCationAndShowMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Latest News', style: FreeVisaFreeTicketTheme.heading1Style),
        InkWell(
          onTap: () {
            locator<NavigationService>().navigateTo(RouteConstants.latestNewsRoute);
          },
          borderRadius: BorderRadius.circular(10.w),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Show More',
              style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                color: const Color(0xFFFD5530),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListOfNews() {
    return Consumer<NewsProvider>(
      builder: (ctx, data, _) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.newsList.length,
          itemBuilder: (context, index) {
            return _buildNewsListItem(data.newsList[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
    );
  }

  Widget _buildNewsListItem(NewsModel news) {
    return InkWell(
      onTap: () {
        locator<NavigationService>()
            .navigateTo(RouteConstants.newsDetailRoute, arguments: {'news': news});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.newsCategoryList!.first.title!,
                  style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                    color: const Color(0xFFFD5530),
                  ),
                ),
                Text(news.newsTitle!,
                    style: FreeVisaFreeTicketTheme.caption1Style,
                    softWrap: true,
                    maxLines: 3),
                SizedBox(height: 10.h),
                Text(DateFormat.yMMMd().format(news.postedAt!),
                    style: FreeVisaFreeTicketTheme.bodyTextStyle),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            child: Image.network(
              news.featuredImageUrl != null
                  ? news.featuredImageUrl!
                  : 'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
              height: 150.w,
              width: 250.w,
              fit: BoxFit.fill,
              errorBuilder: (ctx, _, __) {
                return Image.network(
                  'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
                  height: 150.w,
                  width: 250.w,
                  fit: BoxFit.fill,
                );
              },
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
        ],
      ),
    );
  }
}
