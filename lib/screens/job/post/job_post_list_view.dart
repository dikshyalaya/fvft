import 'package:flutter/material.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/job_filter_provider.dart';
import '../../../providers/job_provider.dart';
import '../../../providers/paginations/job_pagination_provider.dart';
import 'package:provider/provider.dart';

import 'job_post_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobPostListView extends StatefulWidget {
  final bool? isToDisplayVertical;

  const JobPostListView({
    Key? key,
    this.isToDisplayVertical = false,
  }) : super(key: key);

  @override
  _JobPostListViewState createState() => _JobPostListViewState();
}

class _JobPostListViewState extends State<JobPostListView>
    with AutomaticKeepAliveClientMixin<JobPostListView> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    final jobPaginationProvider = locator<JobPaginationProvider>();
    if (jobPaginationProvider.jobList.isEmpty) {
      // jobPaginationProvider.loadInitialData(); //TODO : uncomment this line
    }
    jobPaginationProvider.setScrollController(_controller);
    _controller.addListener(jobPaginationProvider.loadMoreData);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(locator<JobPaginationProvider>().loadMoreData);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobProvider>(
      builder: (ctx, data, _) {
        return Container(
          width: 1.sw,
          height: widget.isToDisplayVertical! ? 1.sh : 300.h,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              if (data.isLoading)
                const Expanded(
                    child: Center(child: CircularProgressIndicator()))
              else if (data.newJobList!.isEmpty)
                Expanded(
                    child: Center(
                        child: Text(
                  'No Jobs posted',
                  textAlign: TextAlign.center,
                  style: FreeVisaFreeTicketTheme.bodyTextStyle,
                )))
              else
                _buildCountriesJobItem(),
            ],
          ),
        );
      },
    );
  }

  /// Widget [_buildCountriesJobItem] : Display list of job based on user selected countries
  Widget _buildCountriesJobItem() {
    return Expanded(
      child: Consumer<JobProvider>(
        builder: (ctx, data, _) {
          return data.newJobList == null
              ? const SizedBox.shrink()
              : Container(
                  width: 1.sw,
                  height: widget.isToDisplayVertical! ? 1.sh : 300.h,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _controller,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  widget.isToDisplayVertical! ? 20.w : 10.w),
                          scrollDirection: widget.isToDisplayVertical!
                              ? Axis.vertical
                              : Axis.horizontal,
                          itemBuilder: (lCtx, index) {
                            return JobPostListItem(
                                jobs: data.newJobList?[index],
                                isHorizontalView: !widget.isToDisplayVertical!);
                          },
                          itemCount: data.newJobList!.length,
                        ),
                      ),
                      // when the _loadMore function is running
                      if (data.isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
