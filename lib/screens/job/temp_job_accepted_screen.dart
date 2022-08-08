import 'package:flutter/material.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'job_accepted_listview.dart';

class TempJobAcceptedScreen extends StatelessWidget {
  const TempJobAcceptedScreen({Key? key}) : super(key: key);

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
          'Short Listed Application',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: const JobAcceptedListView(),
    );
  }
}
