import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/constants/route_constants.dart';
import 'package:free_visa_free_ticket/core/services/navigation_service.dart';
import 'package:free_visa_free_ticket/core/services/service_locator.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'PROFILE'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _profileOptionHeader(),
            InkWell(
                onTap: () {
                  locator<NavigationService>()
                      .navigateTo(RouteConstants.personalInfoScreem);
                },
                child: _cardHeader(
                    icon: Icons.info, title: 'Personal Information')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  locator<NavigationService>()
                      .navigateTo(RouteConstants.personalContactInfo);
                },
                child: _cardHeader(
                    icon: Icons.email, title: 'Contact Information')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  locator<NavigationService>()
                      .navigateTo(RouteConstants.profileEducation);
                },
                child: _cardHeader(icon: Icons.school, title: 'Education')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  locator<NavigationService>()
                      .navigateTo(RouteConstants.profileSkills);
                },
                child: _cardHeader(icon: Icons.settings, title: 'Skills')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  // locator<NavigationService>()
                  //     .navigateTo(RouteConstants.profileExperience);
                },
                child:
                    _cardHeader(icon: Icons.safety_check, title: 'Experience')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  // locator<NavigationService>()
                  //     .navigateTo(RouteConstants.jobPreferenceRoute);
                },
                child: _cardHeader(icon: Icons.work, title: 'Job Preference')),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
                onTap: () {
                  // locator<NavigationService>()
                  //     .navigateTo(RouteConstants.profilePhotos);
                },
                child: _cardHeader(icon: Icons.photo_album, title: 'Photos')),
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _saveButton() => Container(
  //       height: 50,
  //       width: 150,
  //       decoration: BoxDecoration(
  //         color: Colors.blue,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: const Center(
  //         child: Text(
  //           'Save',
  //           style: TextStyle(color: Colors.white, fontSize: 18),
  //         ),
  //       ),
  //     );

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

  Widget _buildHeader(BuildContext context) => Stack(
        children: [
          Container(
            height: 500.h,
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
            ),
          ),
          _profileAvator(),
          _candidateInfo(),
        ],
      );

  _candidateInfo() => Positioned(
        top: 280.h,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Text(
              "SANTOSH THAPa".toUpperCase(),
              style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            Text(
              "Plumber,Electrican".toUpperCase(),
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            Text(
              "youremail@gmail.com".toUpperCase(),
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            Text(
              "+9779846843336".toUpperCase(),
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ],
        ),
      );

  _profileBackgroundShade(BuildContext context) => Positioned(
        left: 0.h,
        right: 0.h,
        child: ClipPath(
          clipper: ProfileHomeShadeClipper(),
          child: Container(
            height: 350.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
      );

  _profileAvator() => Positioned(
        right: 0.h,
        left: 0.h,
        top: 80.h,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 80.r,
                child: CircleAvatar(
                  radius: 78.r,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),
              ),
              Positioned(
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 24.r,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 25.sp,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
}

class ProfileHomeShadeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.addOval(Rect.fromCircle(center: Offset.zero, radius: 100));
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
