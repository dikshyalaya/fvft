import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/widgets/components/job_home_page/all_job.dart';
import '../../core/utilities/enum_utils.dart';
import 'post/job_post_list_view.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';

class JobListPostViewScreen extends StatelessWidget {
  final String? appBarTitle;
  final JobListViewScreen jobScreen;

  const JobListPostViewScreen(
      {Key? key,
      required this.appBarTitle,
      this.jobScreen = JobListViewScreen.latest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.lerp(
            FreeVisaFreeTicketTheme.secondaryColor,
            FreeVisaFreeTicketTheme.primaryColor,
            0.1,
          ),
          title: Text(appBarTitle!,
              style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                color: FreeVisaFreeTicketTheme.whiteColor,
              )),
        ),
        body: jobScreen == JobListViewScreen.latest
            ? const LatestJobListViewScreen(
                isToDisplayVertical: true,
              )
            : AllJobsListViewScreen(
                isToDisplayVertical: true,
              ));
  }
}
