import 'package:flutter/material.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'job_application_listview.dart';

class TempJobAppliedScreen extends StatelessWidget {
  const TempJobAppliedScreen({Key? key}) : super(key: key);

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
          'Applied Jobs',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: const JobApplicationListView(),
    );
  }
}
