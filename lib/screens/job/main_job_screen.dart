import 'package:flutter/material.dart';
import '../../widgets/components/job_home_page/countries_list.dart';
import '../../widgets/custom_image_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempJobScreen extends StatelessWidget {
  const TempJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _jobScreen();
  }

  Widget _jobScreen() {
    return ListView(
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
        // buildSearchFiled(),
        // SizedBox(height: 20.h),

        //  tags horizonatal job list
        // buildTagList(),
        // SizedBox(height: 20.h),

        // job countries list
        buildCountriesList(),
        // job category list
        // buildJobCategoryList(),

        // prefered job
        // buildPreferredJobs(),
        // latest job
        // buildLatestJobs(),

        // TODO : ADD ALL JOBS SECTION

        // companies list
        // buildCompanyList(),
        // saved jobs
        // buildSavedJobs(),
        SizedBox(height: 150.h),
      ],
    );
  }
}
