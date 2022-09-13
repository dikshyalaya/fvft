import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/widgets/components/job_home_page/all_job.dart';
import '../../core/utilities/enum_utils.dart';
import '../../models/jobs_model.dart';
import 'post/job_post_list_view.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';

class JobListPostViewScreen extends StatelessWidget {
  final String? appBarTitle;
  final List<JobModel> jobs;
  final String? fromScreen;

  const JobListPostViewScreen(
      {Key? key,
      required this.appBarTitle,
      required this.jobs,
      this.fromScreen})
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
        body: JobListViewScreen(
          data: jobs,
          isToDisplayVertical: true,
          fromScreen: fromScreen,
        ));
  }
}
