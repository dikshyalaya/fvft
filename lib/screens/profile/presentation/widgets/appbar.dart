import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/theme/free_visa_free_ticket_theme.dart';

import '../../../../core/constants/assets_source.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/services/service_locator.dart';

AppBar profileScreenAppBar(BuildContext context, {required String title}) =>
    AppBar(
      leading: InkWell(
        onTap: () {
          if (Navigator.canPop(context)) {
            locator<NavigationService>().pop(context);
          }
        },
        child: const Padding(
            padding: EdgeInsets.all(2.0), child: Icon(Icons.menu)),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
      ),
      actions: [
        const Center(
          child: Text(
            'ENG',
            style: TextStyle(fontSize: 16),
          ),
        ),
        _iconWithNotification(icon: Icons.email_outlined, notificationCount: 4),
        _iconWithNotification(
            icon: Icons.notifications_on_outlined, notificationCount: 3),
        const SizedBox(
          width: 8,
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 16,
            backgroundImage:
                Image.asset(AssetsSource.freeVisaFreeTicketLogo).image,
          ),
        ),
        const SizedBox(
          width: 4,
        )
      ],
    );

Widget _iconWithNotification(
        {required IconData icon, int notificationCount = 0}) =>
    Center(
      child: Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 20,
              )),
          Positioned(
              top: 5,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  '$notificationCount',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ))
        ],
      ),
    );
