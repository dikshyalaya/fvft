import 'package:flutter/material.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'job_pending_listview.dart';

class TempJobRejectedScreen extends StatelessWidget {
  const TempJobRejectedScreen({Key? key}) : super(key: key);

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
          'Rejected Application',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: const JobPendingListView(),
    );
  }
}


/*
? (locator<AuthProvider>().currentUser == null
? const LoginToContinueWidget()
: const JobAcceptedListView())
: _index == 1
? (locator<AuthProvider>().currentUser == null
? const LoginToContinueWidget()
: const JobApplicationListView())
: (locator<AuthProvider>().currentUser == null
? const LoginToContinueWidget()
: const JobPendingListView()),
// */