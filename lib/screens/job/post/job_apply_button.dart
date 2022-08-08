import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/utilities/enum_utils.dart';
import '../../../providers/job_application_provider.dart';
import 'package:provider/provider.dart';

class JobApplyButton extends StatelessWidget {
  final int? jobId;

  const JobApplyButton({Key? key, required this.jobId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobApplicationProvider>(
      builder: (ctx, data, _) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: data.isApplyingForJob && data.selectedJobId == jobId
                ? 150.w
                : null,
            height: 60.h,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              gradient: FreeVisaFreeTicketTheme.appLinearGradient,
            ),
            child: TextButton(
              key: UniqueKey(),
              onPressed: data.jobStatusBtnName ==
                      JobStatus.applyNow.stringValue
                  ? () async => await data.applyForJob(context, jobId: jobId)
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                // padding: MaterialStateProperty.all(
                //   EdgeInsets.symmetric(horizontal: 20.w),
                // ),
                // shape: MaterialStateProperty.all(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.w),
                //   ),
                // ),
              ),
              child: data.isApplyingForJob && data.selectedJobId == jobId
                  ? FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child:
                            const Center(child: CircularProgressIndicator(color: FreeVisaFreeTicketTheme.whiteColor,)),
                      ),
                      fit: BoxFit.contain,
                    )
                  : Text(
                      data.jobStatusBtnName,
                      style: FreeVisaFreeTicketTheme.caption1Style
                          .copyWith(color: Colors.white),
                    ),
            ),
          ),
        );
      },
    );
  }
}
