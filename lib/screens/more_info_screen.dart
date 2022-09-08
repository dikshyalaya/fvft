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
    return _buildListOfActionTile(context);
  }

  Widget _buildListOfActionTile(final context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: ListView(
        children: [
          locator<AuthProvider>().currentUser == null
              ? const SizedBox()
              : _buildAccountSetting(context),
          ..._buildProfileSettings(context),
          locator<AuthProvider>().currentUser == null
              ? const SizedBox()
              : _buildJobSetting(context),
          locator<AuthProvider>().currentUser == null
              ? const SizedBox()
              : _buildPreferredJobs(context),
          locator<AuthProvider>().currentUser == null
              ? const SizedBox()
              : Divider(thickness: 4.w),
          locator<AuthProvider>().currentUser == null
              ? const SizedBox()
              : _buildJobAlert(context),
          _buildSupport(context),
          _buildSettings(context),
          Divider(thickness: 4.w),
          _buildJobApplicationGuide(context),
          Divider(thickness: 4.w),
          _buildAbout(context),
          Divider(thickness: 4.w),
          _buildContact(context),
          Divider(thickness: 4.w),
          _buildTermsAndCondition(context),
          Divider(thickness: 4.w),
          _buildPrivacy(context),
          Divider(thickness: 4.w),
          _buildFeedbackAndSupport(context),
          Divider(thickness: 4.w),
          _buildAboutApp(context),
        ],
      ),
    );
  }

  Widget _buildNewsTitle(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {
        locator<NavigationService>().navigateTo(routes.allNewsRoute);
      },
      title: 'News',
      isMenuTitle: true,
    );
  }

  Widget _buildLatestNews(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {
        locator<NavigationService>().navigateTo(routes.allNewsRoute);
      },
      icon: Icons.newspaper,
      title: 'Latest News',
    );
  }

  Widget _buildAccountSetting(final context) {
    return _buildListTile(
      context,
      onTap: () {},
      title: 'Account Settings',
      isMenuTitle: true,
      trailingButton: TextButton(
        child: const Text('Log Out'),
        onPressed: () async {
          bool shouldLogout = await (showDialog(
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
                          locator<NavigationService>()
                              .pushReplacementNamed(routes.loginRoute);
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
              }) as Future<bool>);
          if (shouldLogout) {}
        },
      ),
    );
  }

  List<Widget> _buildProfileSettings(BuildContext context) {
    return [
      if (locator<AuthProvider>().currentUser != null) ...[
        _buildListTile(
          context,
          onTap: () {
            locator<NavigationService>().navigateTo(routes.editProfileRoute);
          },
          icon: Icons.account_circle_outlined,
          title: 'Edit Profile',
        ),
        Divider(thickness: 4.w),
        _buildListTile(
          context,
          onTap: () {},
          icon: Icons.account_circle_outlined,
          title: 'Upload Profile',
        ),
        Divider(thickness: 4.w),
        Consumer<CVProvider>(
          builder: (ctx, data, _) {
            return _buildListTile(
              context,
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
          context,
          onTap: () {
            locator<NavigationService>().navigateTo(routes.changePasswordRoute);
          },
          icon: Icons.lock_outline,
          title: 'Change Password',
        ),
        Divider(thickness: 4.w),
        _buildListTile(
          context,
          onTap: () {},
          icon: Icons.person_remove_outlined,
          title: 'Delete My Account',
        ),
      ],
    ];
  }

  Widget _buildJobSetting(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      title: 'Job Settings',
      isMenuTitle: true,
    );
  }

  Widget _buildPreferredJobs(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {
        locator<NavigationService>().navigateTo(routes.jobPreferenceRoute);
      },
      icon: Icons.person_search,
      title: 'Preferred Job',
    );
  }

  Widget _buildJobAlert(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.notifications_none,
      title: 'Job Alerts',
    );
  }

  Widget _buildSupport(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      title: 'Support',
      isMenuTitle: true,
    );
  }

  Widget _buildSettings(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {
        locator<NavigationService>().navigateTo(routes.settingsRoute);
      },
      icon: Icons.settings,
      title: 'Settings',
    );
  }

  Widget _buildJobApplicationGuide(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.book_outlined,
      title: 'Job Application Guideline',
    );
  }

  Widget _buildAbout(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.info_outline,
      title: 'About Free Visa Free Ticket',
    );
  }

  Widget _buildContact(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.mail_outline,
      title: 'Contact Us',
    );
  }

  Widget _buildTermsAndCondition(BuildContext context) {
    return _buildListTile(
      context,
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

  Widget _buildPrivacy(BuildContext context) {
    return _buildListTile(
      context,
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

  Widget _buildFeedbackAndSupport(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.feedback_outlined,
      title: 'Feedback & Support',
    );
  }

  Widget _buildAboutApp(BuildContext context) {
    return _buildListTile(
      context,
      onTap: () {},
      icon: Icons.mobile_screen_share,
      title: 'About Application',
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required void Function()? onTap,
    required String title,
    Widget? trailingButton,
    bool isMenuTitle = false,
    IconData? icon,
  }) =>
      ListTile(
        onTap: onTap,
        tileColor: Theme.of(context).primaryColor,
        leading: icon != null ? Icon(icon) : null,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 28.sp,
                fontWeight: isMenuTitle ? FontWeight.bold : FontWeight.normal,
              ),
        ),
        trailing: trailingButton,
      );
}
