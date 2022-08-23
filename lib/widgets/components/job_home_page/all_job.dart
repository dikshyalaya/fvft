import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../providers/job_provider.dart';
import '../../../screens/job/post/job_post_list_item.dart';
import '../../../screens/job/post/job_post_list_view.dart';
import '../global_view_layout.dart';
import '../../../core/constants/routes.dart' as routes;

Widget buildNewJobs() {
  return globalViewLayout(
    height: 550.h,
    width: 1.sw,
    leftHeaderTitle: 'All Jobs',
    rightHeaderTitle: 'View All',
    onTapToRightTitle: () {
      locator<NavigationService>()
          .navigateTo(routes.allJobListScreen, arguments: {
        'appBarTitle': 'All Jobs',
      });
    },
    leftTitleColor: FreeVisaFreeTicketTheme.secondaryColor,
    rightTitleColor: FreeVisaFreeTicketTheme.darkGrayColor,
    isGradientBackground: false,
    child: Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
      child: AllJobsListViewScreen(),
    ),
  );
}

class AllJobsListViewScreen extends StatefulWidget {
  final bool? isToDisplayVertical;
  AllJobsListViewScreen({
    Key? key,
    this.isToDisplayVertical = false,
  }) : super(key: key);

  @override
  State<AllJobsListViewScreen> createState() => _AllJobsListViewScreenState();
}

class _AllJobsListViewScreenState extends State<AllJobsListViewScreen> {
  final ScrollController _controller = ScrollController();
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
              else if (data.allJobList!.isEmpty)
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

  _buildCountriesJobItem() {
    return Expanded(
      child: Consumer<JobProvider>(
        builder: (ctx, data, _) {
          print(data.allJobList);
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
                            // log('message : ${data.allJobList?[index].applyBefore}',
                                // name: "all job list ");
                            return JobPostListItem(
                                jobs: data.allJobList?[index],
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
}
