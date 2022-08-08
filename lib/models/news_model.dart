import 'package:flutter/material.dart';
import '../core/utilities/app_utils.dart';

class NewsContentStyle with ChangeNotifier {
  final bool? isBold;
  final bool? isItalic;
  final bool? isUnderline;

  NewsContentStyle(
      {this.isBold = false, this.isItalic = false, this.isUnderline = false});

  factory NewsContentStyle.fromJson(Map<String, dynamic> json) =>
      NewsContentStyle(
          isUnderline: json['is_underline'],
          isItalic: json['is_italic'],
          isBold: json['is_bold']);
}

class NewsContentModel with ChangeNotifier {
  final String? contentType;
  final String? content;
  final bool? isStyled;
  final bool? isTitle;
  final bool? isSubTitle;
  final String? imageUrl;
  final NewsContentStyle? newsContentStyle;

  NewsContentModel({
    this.isTitle,
    this.content,
    this.contentType,
    this.isStyled,
    this.isSubTitle,
    this.newsContentStyle,
    this.imageUrl,
  });

  factory NewsContentModel.fromJson(Map<String, dynamic> json) =>
      NewsContentModel(
        content: json['content'],
        contentType: json['type'],
        imageUrl: json['url'],
        isStyled: json['is_styled'] ?? false,
        isTitle: json['is_title'] ?? false,
        isSubTitle: json['is_subtitle'] ?? false,
        newsContentStyle: json['style'] == null
            ? null
            : NewsContentStyle.fromJson(json['style']),
      );
}

class NewsCategoriesModel with ChangeNotifier {
  final int? id;
  final String? title;

  NewsCategoriesModel({this.id, this.title});

  factory NewsCategoriesModel.fromJson(Map<String, dynamic> json) =>
      NewsCategoriesModel(id: json['id'], title: json['title']);
}

class NewsPostedUserModel with ChangeNotifier {
  final String? name;
  final String? imageUrl;

  NewsPostedUserModel({this.imageUrl, this.name});

  factory NewsPostedUserModel.fromJson(Map<String, dynamic> json) =>
      NewsPostedUserModel(imageUrl: json['profile_url'], name: json['name']);
}

class NewsModel with ChangeNotifier {
  final int? newsId;
  final String? newsTitle;

  //final List<NewsContentModel>? newsContents;
  final String? newsContent;
  final String? featuredImageUrl;
  final List<NewsCategoriesModel>? newsCategoryList;
  final NewsPostedUserModel? newsPostedUser;
  final DateTime? postedAt;
  final DateTime? updatedAt;

  NewsModel({
    this.newsId,
    this.featuredImageUrl,
    this.newsCategoryList = const [],
    //this.newsContents = const [],
    required this.newsContent,
    this.newsTitle,
    this.newsPostedUser,
    this.postedAt,
    this.updatedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        newsId: json['id'],
        newsTitle: json['title'],
        // newsContents: json['body'] == null
        //     ? null
        //     : convertDynamicListToNewsContent(json['body']),
        newsContent: json['body']??'',
        featuredImageUrl: json['feature_img'],
        newsCategoryList: json['categories'] == null
            ? null
            : convertDynamicListToNewsCategories(json['categories']),
        newsPostedUser: json['posted_by'] == null
            ? null
            : NewsPostedUserModel.fromJson(json['posted_by']),
        postedAt: DateTime.parse(json['created_at']).toLocal(),
        updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      );
}
