import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:provider/provider.dart';

import '../core/services/hive_service.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../providers/auth_provider.dart';
import '../core/constants/routes.dart' as routes;

import '../providers/cv_provider.dart';
import '../widgets/login_to_continue_widget.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return locator<AuthProvider>().currentUser == null
        ? const Center(child: LoginToContinueWidget())
        : _buildListOfActionTile(context);
  }

  Widget _buildListOfActionTile(final context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: ListView(
        children: [
          _buildNewsTitle(),
          _buildLatestNews(),
          _buildAccountSetting(context),
          ..._buildProfileSettings(context),
          _buildJobSetting(),
          _buildPreferredJobs(),
          Divider(thickness: 4.w),
          _buildJobAlert(),
          _buildSupport(),
          _buildSettings(),
          Divider(thickness: 4.w),
          _buildJobApplicationGuide(),
          Divider(thickness: 4.w),
          _buildAbout(),
          Divider(thickness: 4.w),
          _buildContact(),
          Divider(thickness: 4.w),
          _buildTermsAndCondition(),
          Divider(thickness: 4.w),
          _buildPrivacy(),
          Divider(thickness: 4.w),
          _buildFeedbackAndSupport(),
          Divider(thickness: 4.w),
          _buildAboutApp(),
        ],
      ),
    );
  }

  Widget _buildNewsTitle() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(routes.allNewsRoute);
      },
      title: 'News',
      isMenuTitle: true,
    );
  }

  Widget _buildLatestNews() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(routes.allNewsRoute);
      },
      icon: Icons.newspaper,
      title: 'Latest News',
    );
  }

  Widget _buildAccountSetting(final context) {
    return _buildListTile(
      onTap: () {},
      title: 'Account Settings',
      isMenuTitle: true,
      trailingButton: TextButton(
        child: const Text('Log Out'),
        onPressed: () async {
          bool shouldLogout = await showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text(
                    'Do you want to logout?',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  buttonPadding: EdgeInsets.zero,
                  actionsPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          locator<NavigationService>().pop(true);
                          await Future.wait([
                            locator<HiveService>().deleteBox(
                                boxName: HiveBoxName.userToken.stringValue),
                            locator<HiveService>().deleteBox(
                                boxName: HiveBoxName.userData.stringValue),
                            locator<HiveService>().deleteBox(
                                boxName: HiveBoxName.userCV.stringValue),
                            locator<HiveService>().deleteBox(
                                boxName: HiveBoxName.banner.stringValue),
                          ]);
                          locator<AuthProvider>().setCurrentUser(null);
                          // locator<NavigationService>()
                          //     .pushReplacementNamed(routes.loginRoute);
                          locator<NavigationService>()
                              .pushReplacementNamed(routes.tempLoginScreen);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 26.sp),
                        )),
                    TextButton(
                        onPressed: () {
                          locator<NavigationService>().pop(false);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 26.sp),
                        )),
                  ],
                );
              });
          if (shouldLogout) {}
        },
      ),
    );
  }

  List<Widget> _buildProfileSettings(final context) {
    return [
      if (locator<AuthProvider>().currentUser != null) ...[
        _buildListTile(
          onTap: () {
            locator<NavigationService>().navigateTo(routes.editProfileRoute);
          },
          icon: Icons.account_circle_outlined,
          title: 'Edit Profile',
        ),
        Divider(thickness: 4.w),
        _buildListTile(
          onTap: () {
          },
          icon: Icons.account_circle_outlined,
          title: 'Upload Profile',
        ),
        Divider(thickness: 4.w),
        Consumer<CVProvider>(
          builder: (ctx, data, _) {
            return _buildListTile(
              onTap: () {
                if (data.myCv == null) {
                  locator<NavigationService>().navigateTo(routes.uploadCvRoute);
                } else {
                  locator<NavigationService>().navigateTo(routes.viewCvRoute);
                }
              },
              icon: Icons.file_copy_rounded,
              title: data.myCv == null ? 'Upload Your CV' : 'View CV',
            );
          },
        ),
        Divider(thickness: 4.w),
        _buildListTile(
          onTap: () {
            locator<NavigationService>().navigateTo(routes.changePasswordRoute);
          },
          icon: Icons.lock_outline,
          title: 'Change Password',
        ),
        Divider(thickness: 4.w),
        _buildListTile(
          onTap: () {},
          icon: Icons.person_remove_outlined,
          title: 'Delete My Account',
        ),
      ],
    ];
  }

  Widget _buildJobSetting() {
    return _buildListTile(
      onTap: () {},
      title: 'Job Settings',
      isMenuTitle: true,
    );
  }

  Widget _buildPreferredJobs() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(routes.jobPreferenceRoute);
      },
      icon: Icons.person_search,
      title: 'Preferred Job',
    );
  }

  Widget _buildJobAlert() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.notifications_none,
      title: 'Job Alerts',
    );
  }

  Widget _buildSupport() {
    return _buildListTile(
      onTap: () {},
      title: 'Support',
      isMenuTitle: true,
    );
  }

  Widget _buildSettings() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(routes.settingsRoute);
      },
      icon: Icons.settings,
      title: 'Settings',
    );
  }

  Widget _buildJobApplicationGuide() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.book_outlined,
      title: 'Job Application Guideline',
    );
  }

  Widget _buildAbout() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.info_outline,
      title: 'About Free Visa Free Ticket',
    );
  }

  Widget _buildContact() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.mail_outline,
      title: 'Contact Us',
    );
  }

  Widget _buildTermsAndCondition() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(
          routes.webViewRoute,
          arguments: {
            'appBarTitle': 'Terms & Condition',
            'urlToRender': 'https://jagaranmaharjan.github.io/',
          },
        );
      },
      icon: Icons.note_outlined,
      title: 'Terms & Conditions',
    );
  }

  Widget _buildPrivacy() {
    return _buildListTile(
      onTap: () {
        locator<NavigationService>().navigateTo(
          routes.webViewRoute,
          arguments: {
            'appBarTitle': 'Privacy Policy',
            'urlToRender': 'https://jagaranmaharjan.github.io/',
          },
        );
      },
      icon: Icons.privacy_tip_outlined,
      title: 'Privacy Policy',
    );
  }

  Widget _buildFeedbackAndSupport() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.feedback_outlined,
      title: 'Feedback & Support',
    );
  }

  Widget _buildAboutApp() {
    return _buildListTile(
      onTap: () {},
      icon: Icons.mobile_screen_share,
      title: 'About Application',
    );
  }

  Widget _buildListTile({
    required void Function()? onTap,
    required String title,
    Widget? trailingButton,
    bool isMenuTitle = false,
    IconData? icon,
  }) =>
      ListTile(
        onTap: onTap,
        hoverColor: Colors.transparent,
        tileColor: isMenuTitle
            ? FreeVisaFreeTicketTheme.lightWhiteColor
            : Colors.white,
        leading: icon != null ? Icon(icon) : null,
        title: Text(
          title,
          style: FreeVisaFreeTicketTheme.body3TextStyle.copyWith(
            fontSize: 28.sp,
            fontWeight: isMenuTitle ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: trailingButton,
      );
}
