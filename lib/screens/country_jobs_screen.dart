import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CountryJobsScreen extends StatelessWidget {
  const CountryJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: FreeVisaFreeTicketTheme.gradientDecoration,
        ),
        title: Text(
          'Country Jobs',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: ListView(
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        children: [
          SizedBox(height: 40.h),
          _buildSearchFiled(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://royalkitestravel.com/wp-content/uploads/2020/01/malaysia.jpg',
                    height: 400.h,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(50.w),
                ),
                Positioned(
                  top: 150.h,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        'Malaysia',
                        style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
                          fontSize: 42.sp,
                          color: FreeVisaFreeTicketTheme.whiteColor,
                        ),
                      ),
                      Text(
                        '55 Jobs',
                        style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                          color: FreeVisaFreeTicketTheme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FreeVisaFreeTicketTheme.whiteColor,
                        width: 2.w,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: FreeVisaFreeTicketTheme.whiteColor,
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://royalkitestravel.com/wp-content/uploads/2020/01/malaysia.jpg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
            clipBehavior: Clip.none,
            child: InkWell(
              onTap: () {

              },
              borderRadius: BorderRadius.circular(20.w),
              child: SizedBox(
                width: 1.sw,
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
          ),
        ],
      ),
    );
  }

  Widget _buildSearchFiled() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: FreeVisaFreeTicketTheme.lightGrayColor,
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 0),
      width: 600.w,
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: FreeVisaFreeTicketTheme.lightGrayColor,
              size: 60.sp,
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Search for your jobs...',
                hintStyle: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.lightGrayColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.w),
            child: Container(
              width: 200.w,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.w),
                  bottomRight: Radius.circular(8.w),
                ),
                gradient:  LinearGradient(
                  begin:  const Alignment(-1.0, -1.0),
                  end:const  Alignment(1.0, 4.0),
                  colors:const  [
                    FreeVisaFreeTicketTheme.primaryColor,
                    FreeVisaFreeTicketTheme.secondaryColor,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Search',
                  style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                'Company Name',
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
          'https://www.oberlo.com/media/1603897950-job.jpg',
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
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors:const [
            FreeVisaFreeTicketTheme.primaryColor,
            FreeVisaFreeTicketTheme.secondaryColor,
          ],
        ),
      ),
      child: Text(
        'Job Title   (Vacancy No)',
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
                  'https://demo.freevisafreeticket.com/job/10',
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
        // const Expanded(child: JobApplyButton(jobId: 10)),
        SizedBox(width: 20.w),
      ],
    );
  }
}
