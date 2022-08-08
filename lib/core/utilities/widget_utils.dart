import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool checkTextMaxLineExceedOrNot(
    {required String title, int? maxLines, double? maxWidth}) {
  final tp = TextPainter(
      text: TextSpan(text: title),
      maxLines: maxLines ?? 1,
      textDirection: TextDirection.ltr);
  tp.layout(maxWidth: maxWidth ?? 480.w);
  return tp.didExceedMaxLines;
}
