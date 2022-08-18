import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/utilities/enum_utils.dart';
import '../../models/job_model.dart';
import '../../models/jobs_model.dart';
import '../../providers/job_application_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/unorder_list_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class JobDetailScreen extends StatelessWidget {
  final JobModel? jobDetail;

  const JobDetailScreen({Key? key, required this.jobDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: ListView(
          shrinkWrap: true,
          addRepaintBoundaries: false,
          addAutomaticKeepAlives: false,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          children: [
            _buildJobImage(),
            SizedBox(height: 30.h),
            _buildJobDetail(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildApplyBtn(context));
  }

  Widget _buildJobImage() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 550.h,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.w),
              bottomLeft: Radius.circular(30.w),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.w),
              bottomLeft: Radius.circular(30.w),
            ),
            child: Image.network(
              jobDetail!.featureImageUrl != null
                  ? jobDetail!.featureImageUrl!
                  : 'https://www.oberlo.com/media/1603897950-job.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          top: AppBar().preferredSize.height,
          child: customBackButton(),
        ),
        Positioned(
          right: 10.w,
          top: AppBar().preferredSize.height,
          child: IconButton(
            icon: CircleAvatar(
              child: Icon(
                Icons.share,
                size: 45.w,
              ),
            ),
            // onPressed: () async => await launchURL(
            //     'https://demo.freevisafreeticket.com/job/${jobDetail.jobId}'),
            onPressed: () => Share.share(
                'https://demo.freevisafreeticket.com/job/${jobDetail!.jobId}'),
            iconSize: 52.w,
            splashRadius: 5.w,
          ),
        ),
        Positioned(
          right: 20.w,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
            child: Text(
              // jobDetail!.siteLocation!.country!.countryName!, //! TODO uncommet this
"he",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              jobDetail!.jobTitle!,
              textAlign: TextAlign.center,
              style: FreeVisaFreeTicketTheme.captionStyle,
            ),
          ),
          // Center(child: Chip(label: Text(jobDetail!!))),  //! TODO : Uncomment this line
          SizedBox(height: 15.h),
          Text(
            jobDetail!.company!.companyName!,
            style: FreeVisaFreeTicketTheme.caption1Style,
          ),
          SizedBox(height: 15.h),
          // _buildJobDetailCard(),
          Text('Job Description', style: FreeVisaFreeTicketTheme.caption1Style),
          SizedBox(height: 15.h),
          Text(jobDetail!.jobDescription!,
              style: FreeVisaFreeTicketTheme.bodyTextStyle),
          SizedBox(height: 15.h),
          Text('Job Shifts', style: FreeVisaFreeTicketTheme.caption1Style),
          SizedBox(height: 15.h),
          // UnorderedList( //! TODO : Uncomment this line
          //     [...jobDetail!.jobShifts!.map((e) => e.jobShift!).toList()]),
          SizedBox(height: 15.h),
          Text('Requirements', style: FreeVisaFreeTicketTheme.caption1Style),
          SizedBox(height: 15.h),
          UnorderedList([
            '${jobDetail!.jobExperience!} experience in this field',
            // jobDetail!.educationLevel!,  //! TODO : Uncomment this line
          ]),
          SizedBox(height: 15.h),
          if (jobDetail!.benefits != null) ...[
            Text('Benefits', style: FreeVisaFreeTicketTheme.caption1Style),
            SizedBox(height: 15.h),
            Text(jobDetail!.benefits!,
                style: FreeVisaFreeTicketTheme.bodyTextStyle),
            SizedBox(height: 15.h),
          ],
          if (!jobDetail!.hideSalary!) ...[
            RichText(
              text: TextSpan(
                text:
                    'Salary ${jobDetail!.salaryCurrency == null ? ' ' : '(${jobDetail!.salaryCurrency}) '}: ',
                children: [
                  TextSpan(
                    text: '${jobDetail!.salaryFrom} - ${jobDetail!.salaryTo}',
                    style: FreeVisaFreeTicketTheme.bodyTextStyle,
                  ),
                ],
                style: FreeVisaFreeTicketTheme.caption1Style,
              ),
            ),
            SizedBox(height: 15.h),
          ],
          SizedBox(height: 200.h),
        ],
      ),
    );
  }

  Widget _buildApplyBtn(final context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: locator<ThemeProvider>().themeMode == ThemeMode.dark
          ? Colors.black
          : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Apply Until: ',
                children: [
                  TextSpan(
                    text: DateFormat.yMMMd().format(jobDetail!.expiryDate!),
                    style: FreeVisaFreeTicketTheme.bodyTextStyle,
                  ),
                ],
                style: FreeVisaFreeTicketTheme.caption1Style,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Consumer<JobApplicationProvider>(
              builder: (ctx, data, _) {
                return data.isApplyingForJob
                    ? const Center(child: CircularProgressIndicator())
                    : TextButton(
                        onPressed: data.jobStatusBtnName ==
                                JobStatus.applyNow.stringValue
                            ? () async => await data.applyForJob(
                                  context,
                                  jobId: jobDetail!.jobId,
                                  isFromJobDetailScreen: true,
                                )
                            : null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            return FlexColor.greenLightPrimary;
                          }),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20.w),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                          ),
                        ),
                        child: Text(
                          data.jobStatusBtnName,
                          style: FreeVisaFreeTicketTheme.caption1Style
                              .copyWith(color: Colors.white),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
