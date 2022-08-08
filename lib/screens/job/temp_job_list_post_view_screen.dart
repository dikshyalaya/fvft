import 'package:flutter/material.dart';
import 'post/job_post_list_view.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';

class JobListPostViewScreen extends StatelessWidget {
  final String? appBarTitle;

  const JobListPostViewScreen({Key? key, required this.appBarTitle})
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
        title: Text(
          appBarTitle!,
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: const JobPostListView(isToDisplayVertical: true),
    );
  }
}
