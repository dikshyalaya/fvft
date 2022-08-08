import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/utilities/logutils.dart';
import '../../models/news_model.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:html2md/html2md.dart' as html2md;

class NewsDetailScreen extends StatelessWidget {
  final NewsModel? news;

  const NewsDetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isToShowBackButton: true,
        isToShowTitle: false,
        titleFontSize: 36.sp,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news!.newsCategoryList!.first.title!,
              style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                color: const Color(0xFFFD5530),
              ),
            ),
            SizedBox(height: 10.h),
            Text(news!.newsTitle!,
                style: FreeVisaFreeTicketTheme.caption1Style,
                softWrap: true,
                maxLines: 3),
            SizedBox(height: 10.h),
            _buildFeatureImage(),
            SizedBox(height: 10.h),
            _buildJobPostedBy(),
            SizedBox(height: 10.h),
            MarkdownBody(
              data: html2md.convert(news!.newsContent!),
              shrinkWrap: true,
              fitContent: true,
              styleSheet: FreeVisaFreeTicketTheme.markdownStyleSheet,
              imageBuilder: (uri, title, alt) {
                try {
                  String imageUrl = uri.toString();
                  if (imageUrl.contains('data:image/png;base64,')) {
                    late Uint8List? bytes;
                    try {
                      bytes = base64.decode(
                        imageUrl.replaceAll('data:image/png;base64,', ''),
                      );
                    } catch (e) {
                      LogUtils.logError('error from here');
                    }
                    return Image.memory(
                      bytes!,
                      width: double.infinity,
                      height: 400.h,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Image.network(
                      'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY=',
                      fit: BoxFit.cover,
                      // errorBuilder: (context, error, stackTrace) =>
                      //     ContentBodyImage(imageUrl),
                    );
                  }
                } catch (e) {
                  LogUtils.logError('error 010');
                  return Image.network(uri.toString());
                }
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureImage() {
    return ClipRRect(
      child: Image.network(
        news!.featuredImageUrl!,
        height: 250.w,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (ctx, _, __) {
          return Image.network(
            'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
            height: 250.w,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        },
      ),
      borderRadius: BorderRadius.circular(10.w),
    );
  }

  Widget _buildJobPostedBy() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        'by ${news!.newsPostedUser!.name}',
        style: FreeVisaFreeTicketTheme.captionStyle,
      ),
      subtitle: Text(DateFormat.yMMMd().format(news!.postedAt!),
          style: FreeVisaFreeTicketTheme.bodyTextStyle),
      leading: Container(
        width: 100.w,
        height: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _buildNewsContent(
      {bool isImage = false, String? content, String? imageUrl}) {
    return isImage
        ? ClipRRect(
            child: Image.network(
              imageUrl!,
              height: 250.w,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (ctx, _, __) {
                return Image.network(
                  'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
                  height: 250.w,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            borderRadius: BorderRadius.circular(10.w),
          )
        : Text(content!,
            style: FreeVisaFreeTicketTheme.bodyTextStyle,
            textAlign: TextAlign.justify);
  }
}
