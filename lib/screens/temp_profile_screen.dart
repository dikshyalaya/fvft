import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/assets_source.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_button.dart';

import '../core/services/service_locator.dart';

import '../widgets/login_to_continue_widget.dart';

class TempProfileScreen extends StatelessWidget {
  const TempProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = locator<AuthProvider>().currentUser;
    return user == null
        ? const LoginToContinueWidget()
        : ListView(
            shrinkWrap: true,
            addRepaintBoundaries: false,
            addAutomaticKeepAlives: false,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            border: Border.all(
                              color: FreeVisaFreeTicketTheme.darkGrayColor,
                              width: 1.w,
                            ),
                          ),
                          child: user.imageUrl != null
                              ? Image.network(
                                  user.imageUrl!,
                                  fit: BoxFit.contain,
                                )
                              : Image.asset(
                                  AssetsSource.freeVisaFreeTicketLogo,
                                ),
                          height: 320.w,
                          width: 300.w,
                        ),
                        Positioned(
                          right: -15,
                          bottom: -10,
                          child: Container(
                            margin: EdgeInsets.all(2.w),
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: FreeVisaFreeTicketTheme.whiteColor,
                              border: Border.all(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                                width: 1.w,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: FreeVisaFreeTicketTheme.darkGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            width: double.infinity,
                            height: 60.h,
                            color: FreeVisaFreeTicketTheme.darkGrayColor,
                            child: Text(
                              user.middleName != null
                                  ? '${user.firstName} ${user.middleName} ${user.lastName}'
                                  : '${user.firstName} ${user.lastName}',
                              style:
                                  FreeVisaFreeTicketTheme.captionStyle.copyWith(
                                color: FreeVisaFreeTicketTheme.whiteColor,
                              ),
                            ),
                          ),
                          Text(
                            '20% Complete',
                            style:
                                FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                              color: FreeVisaFreeTicketTheme.darkGrayColor,
                            ),
                          ),
                          Text(
                            'Please complete your profile to be effective',
                            style:
                                FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                              color: FreeVisaFreeTicketTheme.darkGrayColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          CustomButton(
                            onTap: () {
                            },
                            title: 'Edit Profile',
                            width: 250.w,
                            height: 80.h,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            borderRadius: 50.w,
                            color: FreeVisaFreeTicketTheme.lightWhiteColor,
                            textColor: FreeVisaFreeTicketTheme.primaryColor,
                            btnTitleFontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Personal Information'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _buildTitleAndValue(title: 'Name', value: 'Santosh Thapa'),
                    _buildTitleAndValue(title: 'Gender', value: 'Male'),
                    _buildTitleAndValue(
                        title: 'Material Status', value: 'Single'),
                    _buildTitleAndValue(
                        title: 'Date of Birth', value: '2002 July 25'),
                    _buildTitleAndValue(title: 'Height', value: '168 CM'),
                    _buildTitleAndValue(title: 'Weight', value: '65 KG'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Passport Details'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _buildTitleAndValue(
                        title: 'Passport No.', value: '987654321'),
                    _buildTitleAndValue(
                        title: 'Passport Exp.', value: '2030 May 20'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Contact Information'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _buildTitleAndValue(title: 'Mobile', value: '9876543210'),
                    _buildTitleAndValue(
                        title: 'Email ID', value: 'test@test.com'),
                    _buildTitleAndValue(
                        title: 'Address',
                        value:
                            'Bagmati Pardesh, Chitwan\nBharatpur 15, Chaubiskothi'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Experience'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _buildNormalText(
                        '1. Police, 15 Years 6 Months, Government Service, Nepal'),
                    _buildNormalText(
                        '2. Security Guard, 3 Years 4 Months, Security Service, Malaysia, Sasa Secuirty'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Education'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildNormalText('S.L.C (Grade 10)')],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Training'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNormalText('1. Fire Safety'),
                    _buildNormalText('2. Weapon Handling'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Skills'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNormalText('1. Light Driving'),
                    _buildNormalText('2. Heavy Driving'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Language'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndValue(title: '1. English', value: 'Good'),
                    _buildTitleAndValue(title: '2. Hindi', value: 'Very Good'),
                    _buildTitleAndValue(title: '3. Malay', value: 'Excellent'),
                    _buildTitleAndValue(title: '4. Chinese', value: 'Fair'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Preferred Jobs'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNormalText('1. Security Guard'),
                    _buildNormalText('2. Security Supervisor'),
                    _buildNormalText('3. Salesman'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildSection('Preferred Country'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNormalText('1. Malaysia'),
                    _buildNormalText('2. UAE')
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              // _buildSection('Full Image'),
              // SizedBox(height: 10.h),
            ],
          );
  }

  Widget _buildSection(String title) {
    return Container(
      color: FreeVisaFreeTicketTheme.lightWhiteColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
              color: FreeVisaFreeTicketTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: FreeVisaFreeTicketTheme.whiteColor,
              border: Border.all(
                color: FreeVisaFreeTicketTheme.darkGrayColor,
                width: 1.w,
              ),
            ),
            child: const Icon(
              Icons.edit,
              color: FreeVisaFreeTicketTheme.darkGrayColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndValue({
    required String? title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            // flex: 1,
            child: Text(
              '$title:',
              style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                color: FreeVisaFreeTicketTheme.darkGrayColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                color: FreeVisaFreeTicketTheme.darkGrayColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        title,
        style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
          color: FreeVisaFreeTicketTheme.darkGrayColor,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
