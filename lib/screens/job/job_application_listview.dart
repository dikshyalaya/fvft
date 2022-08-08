import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../providers/job_application_provider.dart';
import 'post/job_post_list_item.dart';
import '../../widgets/custom_button.dart';
import 'package:provider/provider.dart';

class JobApplicationListView extends StatelessWidget {
  const JobApplicationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobApplicationProvider>(
      builder: (ctx, data, _) {
        return RefreshIndicator(
          onRefresh: () async => await data.getOnProcessJobList(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: data.onProcessJobList.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'You have not applied to any job to show',
                        style: FreeVisaFreeTicketTheme.bodyTextStyle,
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        onTap: () async => await data.getOnProcessJobList(),
                        height: 100.h,
                        width: 400.w,
                        color: FlexColor.greenLightPrimary,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        title: 'Refresh',
                        textColor: Colors.white,
                        borderRadius: 10.w,
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    itemBuilder: (lCtx, index) {
                      return JobPostListItem(
                          jobs: data.onProcessJobList[index].job!);
                    },
                    itemCount: data.onProcessJobList.length,
                  ),
          ),
        );
      },
    );
  }
}
