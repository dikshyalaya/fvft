import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../widgets/custom_textformfield.dart';

/// Screen [ChangePasswordScreen] : Update Logged In User Password
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:FreeVisaFreeTicketTheme.gradientDecoration,
        ),
        title: Text(
          'Change Password',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            clipBehavior: Clip.none,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              // SvgPicture.asset(
              //   AssetsSource.iconForgotPassword,
              //   width: double.infinity,
              //   height: 500.h,
              // ),
              SizedBox(height: 50.h),
              Text(
                'User ID: abcaman@gmail.com',
                style: FreeVisaFreeTicketTheme.caption1Style,
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                isDense: true,
                borderRadius: 10.w,
                onChanged: (value) {},
                labelText: 'Old Password',
                isPassword: true,
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                isDense: true,
                borderRadius: 10.w,
                onChanged: (value) {},
                labelText: 'New Password',
                isPassword: true,
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                isDense: true,
                borderRadius: 10.w,
                onChanged: (value) {},
                labelText: 'Confirm Password',
                isPassword: true,
              ),
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50.w),
                    child: Container(
                      width: 200.w,
                      height: 60.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        gradient:  LinearGradient(
                          colors: const [
                            FreeVisaFreeTicketTheme.primaryColor,
                            FreeVisaFreeTicketTheme.secondaryColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                          color: FreeVisaFreeTicketTheme.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
