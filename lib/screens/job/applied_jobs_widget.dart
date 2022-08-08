import 'package:flutter/material.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../providers/auth_provider.dart';

import '../../core/services/service_locator.dart';
import '../../core/utilities/enum_utils.dart';
import '../../providers/job_application_provider.dart';
import '../../widgets/login_to_continue_widget.dart';
import 'job_accepted_listview.dart';
import 'job_application_listview.dart';
import 'job_pending_listview.dart';

class AppliedJobsWidget extends StatefulWidget {
  const AppliedJobsWidget({Key? key}) : super(key: key);

  @override
  _AppliedJobsWidgetState createState() => _AppliedJobsWidgetState();
}

class _AppliedJobsWidgetState extends State<AppliedJobsWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      locator<JobApplicationProvider>()
                          .setJobStatusBtnName(JobStatus.accepted);
                      setState(() {
                        _index = 0;
                      });
                    },
                    child: SizedBox(
                      height: 80.h,
                      child: Center(
                        child: Text(
                          'Accepted',
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 5.w,
                  height: 80.h,
                  color: Colors.green,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      locator<JobApplicationProvider>()
                          .setJobStatusBtnName(JobStatus.onProcess);
                      setState(() {
                        _index = 1;
                      });
                    },
                    child: SizedBox(
                      height: 80.h,
                      child: Center(
                        child: Text(
                          'Pending',
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 5.w,
                  height: 80.h,
                  color: Colors.green,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      locator<JobApplicationProvider>()
                          .setJobStatusBtnName(JobStatus.rejected);
                      setState(() {
                        _index = 2;
                      });
                    },
                    child: SizedBox(
                      height: 80.h,
                      child: Center(
                        child: Text(
                          'Rejected',
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 3.h,
              color: Colors.green,
            ),
          ],
        ),
        Expanded(
          child: _index == 0
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
        ),
      ],
    );
  }
}
