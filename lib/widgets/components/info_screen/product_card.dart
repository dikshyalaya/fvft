import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_source.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';

Widget products()=>   Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              _buildImageTile(
                title: 'Santi Overseas Pvt. Ltd.',
                image: AssetsSource.santi,
                tileColor: Colors.green,
              ),
              SizedBox(width: 20.w),
              _buildImageTile(
                title: 'Free Visa Free Ticket',
                image: AssetsSource.freeVisaFreeTicketLogo,
                tileColor: FreeVisaFreeTicketTheme.secondaryColor,
              ),
            ],
          ),
        );

        Widget _buildImageTile({
  required String title,
  required String image,
  required Color? tileColor,
}) =>
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: FreeVisaFreeTicketTheme.body4TextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_down_sharp,
              color: FreeVisaFreeTicketTheme.primaryColor,
            ),
            label: Text(
              'Read More',
              style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                color: FreeVisaFreeTicketTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
