import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/providers/auth_provider.dart';
import 'package:free_visa_free_ticket/providers/job_provider.dart';
import 'package:free_visa_free_ticket/widgets/components/job_home_page/all_job.dart';
import 'package:provider/provider.dart';
import '../../widgets/components/job_home_page/company_list.dart';
import '../../widgets/components/job_home_page/countries_list.dart';
import '../../widgets/components/job_home_page/fiter_tag.dart';
import '../../widgets/components/job_home_page/job_categories.dart';
import '../../widgets/components/job_home_page/latest_job.dart';
import '../../widgets/components/job_home_page/preferred_job.dart';
import '../../widgets/components/job_home_page/search_field.dart';
import '../../widgets/custom_image_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempJobScreen extends StatelessWidget {
  const TempJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _jobScreen(context);
  }

  Widget _jobScreen(BuildContext context) {
    return Consumer<JobProvider>(
      builder: (context, value, child) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        children: [
          // Image slider of inital home page
          CustomImageSlider(
            height: 300.h,
            isHeightRequired: false,
          ),

          // Seatch field of job page
          buildSearchFiled(),
          SizedBox(height: 20.h),

          //  tags horizonatal job list
          buildTagList(),
          SizedBox(height: 20.h),

          // job countries list
          buildCountriesList(),
          SizedBox(height: 20.h),
          // job category list
          buildJobCategoryList(),
          SizedBox(height: 20.h),

          // prefered job

          // latest job
          buildLatestJobs(value),
          SizedBox(height: 20.h),

          // TODO : ADD ALL JOBS SECTION

          buildAllJobs(value),
          SizedBox(
            height: 20.h,
          ),
          Consumer2<AuthProvider, JobProvider>(
              builder: (context, auth, job, child) => auth.userLoggedIn
                  ? buildPreferredJobs(job)
                  : const SizedBox()),
          SizedBox(height: 20.h),

          // companies list
          buildCompanyList(),

          
          // saved jobs
          // buildSavedJobs(),
          SizedBox(height: 150.h),
        ],
      ),
    );
  }
}
