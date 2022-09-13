import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _profileOptionHeader(),
            _cardHeader(icon: Icons.info, title: 'Personal Information'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.email, title: 'Contact Information'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.school, title: 'Education'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.settings, title: 'Skills'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.safety_check, title: 'Experience'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.work, title: 'Job Preference'),
            const Divider(
              thickness: 1.5,
            ),
            _cardHeader(icon: Icons.photo_album, title: 'Photos'),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _profileCompletionStatus(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCompletionStatus() => Container(
        height: 250.h,
        color: Colors.blue.shade300,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 42,
                  child: Text(
                    '75%',
                    style: TextStyle(
                        color: Color.fromARGB(255, 180, 139, 77), fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Profile Completeness',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        'Complete your profile to 100% to increase the chance \nof getting shortlisted for the right job!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget _cardHeader({required IconData icon, required String title}) =>
      ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 18,
          ),
        ),
      );

  Widget _profileOptionHeader() => Container(
        height: 54,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Profile',
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 60.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                    child: Text(
                  'View',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              )
            ],
          ),
        ),
      );

  Widget _buildHeader() => Stack(
        children: [
          Container(
            height: 650.h,
          ),
          _profileBackgroundShade(),
          _profileAvator(),
          _candidateInfo(),
        ],
      );

  _candidateInfo() => Positioned(
        top: 420.h,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Text(
              "SANTOSH THAPa".toUpperCase(),
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Plumber,Electrican".toUpperCase(),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "youremail@gmail.com".toUpperCase(),
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "+9779846843336".toUpperCase(),
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );

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
                  child: const Icon(
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
