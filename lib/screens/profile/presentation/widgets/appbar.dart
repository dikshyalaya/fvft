import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/theme/free_visa_free_ticket_theme.dart';

import '../../../../core/constants/assets_source.dart';

AppBar profileScreenAppBar() => AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
          AssetsSource.freeVisaFreeTicketLogo,
        ),
      ),
      title: const Text(
        'PROFILE',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      actions: [
        const Center(
          child: Text(
            'ENG',
            style: TextStyle(fontSize: 20),
          ),
        ),
        _iconWithNotification(icon: Icons.email_outlined, notificationCount: 4),
        const SizedBox(
          width: 5,
        ),
        _iconWithNotification(
            icon: Icons.notifications_on_outlined, notificationCount: 3),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23,
            backgroundImage:
                Image.asset(AssetsSource.freeVisaFreeTicketLogo).image,
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );

Widget _iconWithNotification(
        {required IconData icon, int notificationCount = 0}) =>
    Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 40,
            )),
        Positioned(
            top: 5,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                '$notificationCount',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ))
      ],
    );
