import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_visa_free_ticket/core/utilities/environment.dart';
import 'package:intl/intl.dart';
import '../../models/jobs_model.dart';
import 'post/job_apply_button.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../models/job_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempJobDetailScreen extends StatelessWidget {
  final JobModel? jobDetail;

  const TempJobDetailScreen({
    Key? key,
    required this.jobDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Job Details',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
        flexibleSpace: Container(
          decoration: FreeVisaFreeTicketTheme.gradientDecoration,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        children: [
          SizedBox(height: 20.h),
          Card(
            elevation: 7,
            shadowColor: FreeVisaFreeTicketTheme.primaryColor,
            // margin: EdgeInsets.symmetric(horizontal: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.w),
            ),
            clipBehavior: Clip.none,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(40.w),
              child: SizedBox(
                height: 400.h,
                width: 1.sw,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildJobImageItem(),
                            flex: 2,
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                '${jobDetail!.company?.companyName ?? 'N/A '}',
                                  style: FreeVisaFreeTicketTheme.caption1Style
                                      .copyWith(
                                    color:
                                        FreeVisaFreeTicketTheme.darkGrayColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    // TODO :  SVG Flag

                                    SvgPicture.network(
                                      'https://demo.freevisafreeticket.com/${jobDetail!.country!.flag!}',
                                      height: 40.h,
                                      width: 40.w,
                                    ),

                                    SizedBox(width: 10.w),
                                    Text(
                                      jobDetail!.country?.name! ?? 'N/A',
                                      style: FreeVisaFreeTicketTheme
                                          .caption1Style
                                          .copyWith(
                                        color: FreeVisaFreeTicketTheme
                                            .darkGrayColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 60.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FreeVisaFreeTicketTheme.primaryColor,
                            FreeVisaFreeTicketTheme.secondaryColor,
                          ],
                        ),
                      ),
                      child: Text(
                        '${jobDetail!.jobTitle} (${jobDetail!.numberOfPositions})',
                        style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                          color: FreeVisaFreeTicketTheme.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Salary:    ',
                              children: [
                                TextSpan(
                                  text: 'Rs. ${jobDetail!.nepSalary ?? 'N/A'}',
                                  style: FreeVisaFreeTicketTheme.caption1Style
                                      .copyWith(
                                    color: FreeVisaFreeTicketTheme.primaryColor,
                                  ),
                                ),
                              ],
                              style: FreeVisaFreeTicketTheme.caption1Style
                                  .copyWith(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Apply Before:    ',
                              children: [
                                TextSpan(
                                  text: jobDetail!.applyBefore == null
                                      ? 'N/A'
                                      : DateFormat.yMMMd()
                                          .format(jobDetail!.applyBefore!),
                                  style: FreeVisaFreeTicketTheme.caption1Style
                                      .copyWith(
                                    color: FreeVisaFreeTicketTheme.primaryColor,
                                  ),
                                ),
                              ],
                              style: FreeVisaFreeTicketTheme.caption1Style
                                  .copyWith(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: FreeVisaFreeTicketTheme.darkRedColor,
                                  ),
                                ),
                                Text(
                                  'Save Job',
                                  style: FreeVisaFreeTicketTheme.body1TextStyle
                                      .copyWith(
                                    color:
                                        FreeVisaFreeTicketTheme.darkGrayColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => Share.share(
                                      'https://demo.freevisafreeticket.com/job/${jobDetail!.jobId}'),
                                  icon: const Icon(
                                    Icons.share,
                                    color:
                                        FreeVisaFreeTicketTheme.darkGrayColor,
                                  ),
                                ),
                                Text(
                                  'Share',
                                  style: FreeVisaFreeTicketTheme.body1TextStyle
                                      .copyWith(
                                    color:
                                        FreeVisaFreeTicketTheme.darkGrayColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            child: JobApplyButton(
                              jobId: 1,
                              // key: jobs.jobId == null
                              //     ? UniqueKey()
                              //     : ValueKey(jobs.jobId!.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            height: 60.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FreeVisaFreeTicketTheme.primaryColor,
                  FreeVisaFreeTicketTheme.secondaryColor,
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Text(
              'Job Details',
              style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                color: FreeVisaFreeTicketTheme.whiteColor,
              ),
            ),
          ),
          _buildTitleValue(title: 'Job title', value: jobDetail!.jobTitle!),
          _buildTitleValue(
              title: 'Required Numbers',
              value: jobDetail!.numberOfPositions ?? 'null'),
          _buildTitleValue(
              title: 'Job Category',
              value: jobDetail!.category!.jobCategory ??
                  'null'), //! TODO :  implement job model in here
          _buildTitleValue(
              title: 'Working Hours Per Day',
              value:
                  '${jobDetail!.workingHours ?? 'x'} Hours'), //! TODO :  implement the working hours per day
          _buildTitleValue(
              title: 'Working Days Per Week',
              value:
                  '${jobDetail!.workingDays ?? 'x'} Days'), //! TODO : Implment the working days per week
          _buildTitleValue(
            title: 'Job Posted On',
            value: jobDetail!.createdAt == null
                ? 'NA'
                : DateFormat.yMMMd().format(
                    jobDetail!.createdAt!,
                  ),
          ), //! TODO : I
          _buildTitleValue(
            title: 'Apply Before',
            value: jobDetail!.applyBefore == null
                ? 'NA'
                : DateFormat.yMMMd().format(
                    jobDetail!.applyBefore!,
                  ),
          ),
          _buildTitleValue(
              title: 'Contract Period',
              value: '${jobDetail!.contactYear ?? 'x'} Years'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job Description :',
                  style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  jobDetail!.jobDescription ??
                      '1. Investigate And Respond To Security Alarms, Incidents, And Emergencies In A Timely\n'
                          '2. Provide Support To Emergency Personnel, Including Police, Fire, Paramedics.',
                  style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                    color: FreeVisaFreeTicketTheme.darkGrayColor,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            height: 60.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FreeVisaFreeTicketTheme.primaryColor,
                  FreeVisaFreeTicketTheme.secondaryColor,
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Text(
              'Qualification',
              style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                color: FreeVisaFreeTicketTheme.whiteColor,
              ),
            ),
          ),
          _buildTitleValue(
              title: 'Minimum Qualification',
              value: jobDetail!.educationLevel!.title ?? 'N/A'),
          _buildTitleValue(
              title: 'Minimum Experience',
              value: '${jobDetail!.minExperience ?? 'N/A'} Years'),
          _buildTitleValue(
              title: 'Age',
              value:
                  '${jobDetail!.minAge ?? '18'} - ${jobDetail!.maxAge ?? 'above'} Years'),
          _buildTitleValue(
              title: 'Skill',
              value: jobDetail!.skills
                  .toString()
                  .replaceAll('"', '')
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
          _buildTitleValue(
              title: 'Other Requirements',
              value: jobDetail!.requirements ?? 'N/A'),
          Container(
            height: 60.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FreeVisaFreeTicketTheme.primaryColor,
                  FreeVisaFreeTicketTheme.secondaryColor,
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Text(
              'Salary And Facility',
              style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                color: FreeVisaFreeTicketTheme.whiteColor,
              ),
            ),
          ),
          _buildTitleValue(
              title: 'Basic Salary',
              value: 'Rs. ${jobDetail!.nepSalary ?? 'N/A'}'),
          _buildTitleValue(title: 'Average Earning', value: 'N/A'),
          _buildTitleValue(title: 'Accomodation', value: 'N/A'),
          _buildTitleValue(title: 'Food', value: 'N/A'),
          _buildTitleValue(
              title: 'Annual Vacation', value: jobDetail!.annualVacation!),
          _buildTitleValue(
              title: 'Over-Time',
              value:
                  '${jobDetail!.overTime == '1' ? 'Yes' : 'No'} (As per company rule)'),
          _buildTitleValue(
            title: 'Other Benefits',
            value: 'N/A',
          ),
          SizedBox(height: 50.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: JobApplyButton(
                  jobId: jobDetail!.jobId!,
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
          SizedBox(height: 150.h),
        ],
      ),
    );
  }

  Widget _buildJobImageItem() {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        alignment: Alignment.center,
        width: 200.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.none,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          child: Image.network(
            'https://www.oberlo.com/media/1603897950-job.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleValue({
    required String? title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              '$title :',
              style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }
}
