import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/job_prefrences/job_preference_ui_provider.dart';
import 'widget/country_prefs_tab_view.dart';
import 'widget/job_category_prefs_tab_view.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class JobPreferenceScreen extends StatefulWidget {
  const JobPreferenceScreen({Key? key}) : super(key: key);

  @override
  _JobPreferenceScreenState createState() => _JobPreferenceScreenState();
}

class _JobPreferenceScreenState extends State<JobPreferenceScreen>
    with SingleTickerProviderStateMixin {
  bool _isInit = true;
  int _currentTabIndex = 0;
  late TabController _controller;
  Future? _future;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(
      () => {
        Provider.of<JobPreferenceUIProvider>(context, listen: false)
            .setIsToVisibleDraggableSheet(false),
        setState(
          () => {
            _currentTabIndex = _controller.index,
          },
        ),
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _future = _loadAllPrefsData();
    }
    _isInit = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadAllPrefsData() async {
    await Provider.of<JobPreferenceUIProvider>(context, listen: false)
        .loadAtInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTitle: 'Job Preference',
        // backgroundColor: FreeVisaFreeTicketTheme.primaryColor,
        bottomWidget: TabBar(
          controller: _controller,
          indicatorWeight: 3,
          indicatorColor: FreeVisaFreeTicketTheme.primaryColor,
          labelStyle: TextStyle(
            fontSize: 24.sp,
          ),
          labelPadding: EdgeInsets.zero,
          onTap: (value) => {
            Provider.of<JobPreferenceUIProvider>(context, listen: false)
                .setIsToVisibleDraggableSheet(false),
            setState(() => {
                  _currentTabIndex = value,
                }),
          },
          tabs: [
            _buildTabs('Country'),
            _buildTabs('Job Category'),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: CountryPrefsTabView(
              future: _future!,
              refreshState: () {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            child: JobCategoryPrefsTabView(
              future: _future!,
              refreshState: () {
                setState(() {});
              },
            ),
            height: 1.sh,
            width: 1.sw,
          ),
        ],
      ),
      floatingActionButton: Consumer<JobPreferenceUIProvider>(
        builder: (ctx, data, _) {
          return data.isToVisibleDraggableSheet
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70.w,
                  ),
                  backgroundColor: FlexColor.greenLightPrimary,
                  elevation: 5,
                  onPressed: data.toggleDraggableSheet,
                );
        },
      ),
    );
  }

  Tab _buildTabs(String tabTitle) {
    return Tab(
      child: Text(
        tabTitle,
        style: FreeVisaFreeTicketTheme.tabBarStyle.copyWith(
          color: FreeVisaFreeTicketTheme.blackColor,
        ),
      ),
    );
  }
}
