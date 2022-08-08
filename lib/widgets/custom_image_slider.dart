import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/service_locator.dart';
import '../providers/news_provider.dart';
import '../providers/theme_provider.dart';

class CustomImageSlider extends StatefulWidget {
  final bool isHeightRequired;
  final double? height;

  const CustomImageSlider({
    Key? key,
    this.height,
    this.isHeightRequired = true,
  }) : super(key: key);

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: widget.height ?? 900.h,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          flex: 8,
          child: CarouselSlider(
            items: !locator<NewsProvider>().isBannerFromCache
                ? locator<NewsProvider>()
                    .bannerUrlList
                    .map(
                      (item) => Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                    .toList()
                : locator<NewsProvider>()
                    .imageList
                    .map(
                      (item) => Image.memory(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                    .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                height: double.infinity,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        if (widget.isHeightRequired) SizedBox(height: 20.h),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: locator<NewsProvider>()
                .bannerUrlList
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (locator<ThemeProvider>().isLightTheme()
                            ? FlexColor.greyLawDarkPrimaryVariant
                            : FlexColor.greenLightPrimary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
