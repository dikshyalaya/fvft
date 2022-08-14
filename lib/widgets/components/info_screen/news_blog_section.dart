import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_source.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';


// Blog and news Section Top Heading
Widget blogNewsTitle()=> Container(
          height: 80.h,
          color: FreeVisaFreeTicketTheme.lightGray,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News Update And Blog',
                style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.primaryColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                    color: FreeVisaFreeTicketTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );

// Blog and News Section Card
Widget newsBlogCard( {String ? title , date })=>     SizedBox(
          height: 200.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image.asset(AssetsSource.skill),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title ?? "EU says 'Putin must and will fail' as it agress new sancyions",
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date ?? 'Friday, 25 Feb 2022',
                              style: FreeVisaFreeTicketTheme.body2TextStyle
                                  .copyWith(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_circle_down,
                                color: FreeVisaFreeTicketTheme.primaryColor,
                              ),
                              label: Text(
                                'More',
                                style: FreeVisaFreeTicketTheme.body1TextStyle
                                    .copyWith(
                                  color: FreeVisaFreeTicketTheme.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
       