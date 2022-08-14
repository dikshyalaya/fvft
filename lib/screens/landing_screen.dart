import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../core/constants/assets_source.dart';
import 'job/main_job_screen.dart';
import 'more_info_screen.dart';
import 'status_screen.dart';
import 'profile_screen.dart';
import 'package:provider/provider.dart';

import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../providers/auth_provider.dart';
import '../providers/cv_provider.dart';
import '../providers/paginations/job_pagination_provider.dart';

import 'info/information_screen.dart';

class TempLandingScreen extends StatefulWidget {
  const TempLandingScreen({Key? key}) : super(key: key);

  @override
  _TempLandingScreenState createState() => _TempLandingScreenState();
}

class _TempLandingScreenState extends State<TempLandingScreen> {
  int _currentIndex = 2;

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Status';
      case 1:
        return 'Info';
      case 2:
        return 'Job';
      case 3:
        return 'Profile';
      case 4:
        return 'More';
      default:
        return 'Status';
    }
  }

  Widget _switchedScreen() {
    switch (_currentIndex) {
      case 0:
        return const StatusScreen(); //takes to the status page of the applied jobs
      case 1:

      // TODO : products section implement pressing functionality
        return const  InformationScreen(); //const CategoryListScreen();
      case 2:
        return const TempJobScreen();
      case 3:
        return const TempProfileScreen();

      case 4:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: locator<AuthProvider>()),
            ChangeNotifierProvider.value(value: locator<CVProvider>()),
          ],
          child: const MoreInfoScreen(), // const ProfileScreen(),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _switchedScreen(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final currentUser = locator<AuthProvider>().currentUser;
    final bool hasUserData = currentUser != null;
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            tileMode: TileMode.repeated,
            colors: <Color>[
              FreeVisaFreeTicketTheme.secondaryColor,
              FreeVisaFreeTicketTheme.primaryColor,
            ],
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
          AssetsSource.freeVisaFreeTicketLogo,
        ),
      ),
      centerTitle: !hasUserData,
      actions: !hasUserData
          ? []
          : [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Center(
                    child: Text(
                      'ENG',
                      style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                        color: FreeVisaFreeTicketTheme.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: const Icon(Icons.message),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: const Icon(Icons.notification_important_outlined),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: FreeVisaFreeTicketTheme.whiteColor,
                    child: currentUser.imageUrl == null
                        ? Image.asset(AssetsSource.freeVisaFreeTicketLogo)
                        : Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ClipOval(
                              child: Image.network(
                                currentUser.imageUrl!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, _, __) {
                                  return Image.asset(
                                    AssetsSource.freeVisaFreeTicketLogo,
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
      title: Text(
        _getAppBarTitle(),
        style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
          color: FreeVisaFreeTicketTheme.whiteColor,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return ConvexAppBar(
      gradient: const LinearGradient(
        colors: [
          FreeVisaFreeTicketTheme.secondaryColor,
          FreeVisaFreeTicketTheme.primaryColor,
        ],
      ),
      color: FreeVisaFreeTicketTheme.whiteColor.withOpacity(0.7),
      items: const [
        TabItem(icon: Icons.dashboard, title: 'Status', isIconBlend: true),
        TabItem(icon: Icons.info_outline, title: 'Info'),
        TabItem(icon: Icons.search, title: 'Job'),
        TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
        TabItem(icon: Icons.read_more, title: 'More'),
      ],
      style: TabStyle.react,
      initialActiveIndex: _currentIndex,
      onTap: (int index) => {
        locator<JobPaginationProvider>().setIsToShowFilterBtn(false),
        setState(() => _currentIndex = index)
      },
    );
  }
}
