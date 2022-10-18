import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'Profile Preview'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _profileAvator(),
            const SizedBox(height: 10),
            _informationCard(context, title: 'Personal Information'),
            const SizedBox(height: 10),
            _informationCard(context, title: 'Contact Information'),
            const SizedBox(height: 10),
            _informationCard(context, title: 'Education Qualification'),
          ],
        ),
      ),
    );
  }

  _informationCard(BuildContext context,
      {required String title, double height = 250, double? width}) {
    if (width == null) {
      width = MediaQuery.of(context).size.width * .9;
    }
    return Stack(
      children: [
        Container(
          color: Colors.grey.shade300,
          height: height,
          width: width,
        ),
        Positioned(
            child: Container(
          height: 30,
          color: Colors.blue[400],
          width: width,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )),
        Positioned(
          top: 60,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text("Name: "),
                SizedBox(
                  height: 10,
                ),
                Text("Gender: "),
                SizedBox(
                  height: 10,
                ),
                Text("Marital Status: "),
                SizedBox(
                  height: 10,
                ),
                Text("Date Of Birth: "),
                SizedBox(
                  height: 10,
                ),
                Text("Height: "),
                SizedBox(
                  height: 10,
                ),
                Text("Weight: "),
                SizedBox(
                  height: 10,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text("Rabin Acharya"),
                SizedBox(
                  height: 10,
                ),
                Text("Male"),
                SizedBox(
                  height: 10,
                ),
                Text("Single"),
                SizedBox(
                  height: 10,
                ),
                Text("27th Sept, 2004"),
                SizedBox(
                  height: 10,
                ),
                Text("I76 CM"),
                SizedBox(
                  height: 10,
                ),
                Text("Weight: 55 KG "),
                SizedBox(
                  height: 10,
                ),
              ]),
            ],
          ),
        )
      ],
    );
  }

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
            ],
          ),
        ),
      );
}
