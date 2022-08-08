import 'package:flutter/material.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/paginations/category_jobs_pagination_provider.dart';
import '../../job/post/job_post_list_item.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryJobListScreen extends StatefulWidget {
  final int jobCategoryId;
  final String jobCategoryName;

  const CategoryJobListScreen(
      {Key? key, required this.jobCategoryId, required this.jobCategoryName})
      : super(key: key);

  @override
  State<CategoryJobListScreen> createState() => _CategoryJobListScreenState();
}

class _CategoryJobListScreenState extends State<CategoryJobListScreen> {
  // The controller for the ListView
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    locator<CategoryJobsPaginationProvider>()
        .setJobCategoryId(widget.jobCategoryId);
    locator<CategoryJobsPaginationProvider>().loadInitialData();
    _controller
        .addListener(locator<CategoryJobsPaginationProvider>().loadMoreData);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _controller
        .removeListener(locator<CategoryJobsPaginationProvider>().loadMoreData);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isToShowBackButton: true,
        appBarTitle: "${widget.jobCategoryName}'s Job",
        titleFontSize: 36.sp,
      ),
      body: Consumer<CategoryJobsPaginationProvider>(
        builder: (ctx, data, _) {
          return data.isFirstLoadRunning
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      _buildCountriesJobItem(data),
                    ],
                  ),
                );
        },
      ),
    );
  }

  /// Widget [_buildCountriesJobItem] : Display list of job based on user selected countries
  Widget _buildCountriesJobItem(final CategoryJobsPaginationProvider data) {
    return Expanded(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: data.jobList.isEmpty
            ? Center(
                child: Text(
                  'There is no any job in this category',
                  style: FreeVisaFreeTicketTheme.caption1Style,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemBuilder: (lCtx, index) {
                        return JobPostListItem(jobs: data.jobList[index]);
                      },
                      itemCount: data.jobList.length,
                    ),
                  ),
                  // when the _loadMore function is running
                  if (data.isLoadMoreRunning)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
      ),
    );
  }
}
