import 'package:flutter/material.dart';
import '../../core/services/hive_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/utilities/enum_utils.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/custom_list_item.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isToShowBackButton: true,
        appBarTitle: 'Settings',
        titleFontSize: 36.sp,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(thickness: 1.5),
            _buildLanguageTile(),
            _buildAppTheme(),
            SizedBox(height: 100.h)
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile() {
    return CustomListTile(
      title: 'Language',
      icon: Icons.language,
      onTap: () {},
      trailingWidget: PopupMenuButton<String>(
        icon: const Icon(Icons.filter_list),
        onSelected: (String result) {
          switch (result) {
            case 'English':
              break;
            case 'Nepali':
              break;
            default:
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            onTap: () async {
              bool exists = await locator<HiveService>()
                  .isExists(boxName: HiveBoxName.selectedLanCode.stringValue);
              if (exists) {
                await locator<HiveService>()
                    .updateBox('en', HiveBoxName.selectedLanCode.stringValue);
              } else {
                await locator<HiveService>()
                    .addBox('en', HiveBoxName.selectedLanCode.stringValue);
              }
            },
            value: 'English',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg',
                  width: 40.w,
                  height: 40.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20.w),
                const Text('English'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            onTap: () async {
              bool exists = await locator<HiveService>()
                  .isExists(boxName: HiveBoxName.selectedLanCode.stringValue);
              if (exists) {
                await locator<HiveService>()
                    .updateBox('ne', HiveBoxName.selectedLanCode.stringValue);
              } else {
                await locator<HiveService>()
                    .addBox('ne', HiveBoxName.selectedLanCode.stringValue);
              }
            },
            value: 'Nepali',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/492px-Flag_of_Nepal.svg.png',
                  width: 40.w,
                  height: 40.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20.w),
                const Text('Nepali'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppTheme() {
    return CustomListTile(
      title: 'App Theme',
      icon: Icons.room_preferences,
      onTap: () {},
      trailingWidget: PopupMenuButton<String>(
        icon: const Icon(Icons.filter_list),
        onSelected: (String result) {
          switch (result) {
            case 'Light':
              locator<ThemeProvider>().setThemeModel(ThemeMode.light);
              setState(() {});
              break;
            case 'Dark':
              locator<ThemeProvider>().setThemeModel(ThemeMode.dark);
              setState(() {});
              break;
            case 'System':
              locator<ThemeProvider>().setThemeModel(ThemeMode.system);
              setState(() {});
              break;
            default:
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Light',
            child: Text('Light'),
          ),
          const PopupMenuItem<String>(
            value: 'Dark',
            child: Text('Dark'),
          ),
          const PopupMenuItem<String>(
            value: 'System',
            child: Text('System'),
          ),
        ],
      ),
    );
  }
}
