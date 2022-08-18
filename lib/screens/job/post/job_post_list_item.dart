import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/routes.dart' as routes;
import '../../../models/job_model.dart';
import '../../../models/jobs_model.dart';
import '../../../providers/paginations/job_pagination_provider.dart';

import 'job_apply_button.dart';

/// Widget [JobPostListItem] : Contains new job information
class JobPostListItem extends StatelessWidget {
  final JobModel? jobs;
  final bool isHorizontalView;

  const JobPostListItem(
      {Key? key, required this.jobs, this.isHorizontalView = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
      clipBehavior: Clip.none,
      child: InkWell(
        onTap: () {
          locator<JobPaginationProvider>().setIsToShowFilterBtn(false);
          locator<NavigationService>().navigateTo(routes.tempJobDetailScreen,
              arguments: {'jobDetail': jobs});
        },
        borderRadius: BorderRadius.circular(20.w),
        child: SizedBox(
          width: isHorizontalView ? 700.w : 1.sw,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              _buildJobImageAndCompany(),
              SizedBox(height: 20.h),
              _buildJobTitleAndPosition(),
              SizedBox(height: 20.h),
              _buildSalaryAndDeadline(),
              _buildActionBtn(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobImageAndCompany() {
    return Row(
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
                // jobs!.companyModel!.name!, //! TODO : Uncomment this line
                "job", 
                style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    '🇳🇵',
                    style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                      color: FreeVisaFreeTicketTheme.darkGrayColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    'Malaysia',
                    style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                      color: FreeVisaFreeTicketTheme.darkGrayColor,
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
    );
  }

  Widget _buildJobImageItem() {
    return Container(
      alignment: Alignment.center,
      width: 200.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.none,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        child: Image.network(
          jobs!.featureImageUrl != null
              ? jobs!.featureImageUrl!
              : 'https://www.oberlo.com/media/1603897950-job.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildJobTitleAndPosition() {
    return Container(
      height: 60.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: const BoxDecoration(
        gradient: FreeVisaFreeTicketTheme.appLinearGradient,
      ),
      child: Text(
        '${jobs!.jobTitle!}   (${jobs!.numberOfPositions})',
        style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
          color: FreeVisaFreeTicketTheme.whiteColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildSalaryAndDeadline() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Salary:    ',
              children: [
                TextSpan(
                  text: 'Rs 27,000',
                  style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                    color: FreeVisaFreeTicketTheme.primaryColor,
                  ),
                ),
              ],
              style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
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
                  text: '15 Feb 2022',
                  style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                    color: FreeVisaFreeTicketTheme.primaryColor,
                  ),
                ),
              ],
              style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                color: FreeVisaFreeTicketTheme.darkGrayColor,
              ),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
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
                style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: () => Share.share(
                  'https://demo.freevisafreeticket.com/job/${jobs!.jobId}',
                ),
                icon: const Icon(
                  Icons.share,
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
              ),
              Text(
                'Share',
                style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: JobApplyButton(jobId: jobs!.jobId!)),
        SizedBox(width: 20.w),
      ],
    );
  }
}
