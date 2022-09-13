import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h;
    return Scaffold(
      appBar: profileScreenAppBar(),
      body: Stack(
        children: [
          Container(),
          _profileBackgroundShade(),
          _profileAvator(),
        ],
      ),
    );
  }

  _profileBackgroundShade() => Positioned(
        top: -240.h,
        left: 0.h,
        right: 0.h,
        child: Container(
          height: 440.h,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(250.r),
              bottomRight: Radius.circular(250.r),
            ),
          ),
        ),
      );

  _profileAvator() => Positioned(
        right: 0.h,
        left: 0.h,
        top: 50.h,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 170.r,
                child: CircleAvatar(
                  radius: 168.r,
                  backgroundColor: Colors.white,
                  child:const  Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
              Positioned(
                  right: 12.w,
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 24,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
}
