import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/free_visa_free_ticket_theme.dart';
import 'useful_info_item.dart';

Widget usefulInformationHeading()=> Container(
          alignment: Alignment.center,
          decoration: FreeVisaFreeTicketTheme.gradientDecoration,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'USEFUL INFORMATION',
                      style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    TextButton(
                      onPressed: () {
                        // TODO : Im
                      },
                      child: Text(
                        'More',
                        style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                          color: FreeVisaFreeTicketTheme.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => usefulInfoCardItems()[index],
                shrinkWrap: true,
                itemCount: usefulInfoCardItems().length,
              ),
            ],
          ),
        );