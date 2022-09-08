import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/main.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/constants/routes.dart' as routes;
import '../../models/local_storage/job_category_model.dart';
import '../../providers/paginations/category_pagination_provider.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  final bool? isToDisplayVertical;

  const CategoryListScreen({
    Key? key,
    this.isToDisplayVertical = true,
  }) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    super.initState();
    final categoryPaginationProvider =
        Provider.of<CategoryPaginationProvider>(context, listen: false);
    if (categoryPaginationProvider.jobCategoryList.isEmpty) {
      categoryPaginationProvider.loadInitialData();
      categoryPaginationProvider.scrollControllerListener();
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryPaginationProvider>(
      builder: (ctx, data, _) {
        return data.isLoadingInitialData
            ? const Center(child: CircularProgressIndicator())
            : data.jobCategoryList.isEmpty
                ? Center(
                    child: Text(
                      'There is no any job category',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )
                : _buildCategoryList(data);
      },
    );
  }

  Widget _buildCategoryList(final CategoryPaginationProvider data) {
    return widget.isToDisplayVertical!
        ? ListView(
            shrinkWrap: true,
            controller: data.controller,
            children: [
              ...data.jobCategoryList.map((e) {
                return _buildCategoryItem(context, e);
              }).toList(),
              // when the _loadMore function is running
              if (data.isLoadingMoreData)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          )
        // CustomScrollView(
        //         shrinkWrap: true,
        //         controller: data.controller,
        //         primary: false,
        //         slivers: <Widget>[
        //           SliverPadding(
        //             padding: EdgeInsets.symmetric(horizontal: 20.w),
        //             sliver: SliverGrid.count(
        //               // crossAxisSpacing: 10,
        //               // mainAxisSpacing: 10,
        //               crossAxisCount: 1,
        //               children: <Widget>[
        //                 ...data.jobCategoryList.map((e) {
        //                   return _buildCategoryItem(e);
        //                 }).toList(),
        //                 // when the _loadMore function is running
        //                 if (data.isLoadingMoreData)
        //                   const Padding(
        //                     padding: EdgeInsets.symmetric(vertical: 10),
        //                     child: Center(child: CircularProgressIndicator()),
        //                   ),
        //                 SizedBox(height: 150.h),
        //               ],
        //             ),
        //           ),
        //         ],
        //       )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                ),
                child:
                    _buildCategoryItemHorizontal(data.jobCategoryList[index]),
              );
            },
            itemCount: data.jobCategoryList.length,
            scrollDirection: Axis.horizontal,
          );
  }

  Widget _buildCategoryItem(BuildContext context, JobCategoryModel e) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {
            locator<NavigationService>().navigateTo(routes.categoryJobListRoute,
                arguments: {
                  'jobCategoryId': e.id,
                  'jobCategoryName': e.jobCategory
                });
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w),
              bottomLeft: Radius.circular(10.w),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: FreeVisaFreeTicketTheme.appLinearGradient,
              ),
              child: CircleAvatar(
                // backgroundColor: FreeVisaFreeTicketTheme.secondaryColor,
                radius: 20.0,
                child: Builder(
                  builder: (context) {
                    final textArr = e.jobCategory!.split(' ');
                    return Text(textArr.first[0] + ' ' + textArr.last[0],
                        style: Theme.of(context).textTheme.caption);
                  },
                ),
              ),
            ),
          ),
          title: Text(
            e.jobCategory!,
            textAlign: TextAlign.left,
            style: FreeVisaFreeTicketTheme.bodyTextStyle,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        Divider(thickness: 4.h),
      ],
    );
    //   Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10.w),
    //   ),
    //   child: InkWell(
    //     onTap: () {
    //       locator<NavigationService>().navigateTo(routes.categoryJobListRoute,
    //           arguments: {
    //             'jobCategoryId': e.id,
    //             'jobCategoryName': e.jobCategory
    //           });
    //     },
    //     borderRadius: BorderRadius.circular(10.w),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SizedBox(height: 10.h),
    //         ClipRRect(
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(10.w),
    //               bottomLeft: Radius.circular(10.w),
    //             ),
    //             child: CircleAvatar(
    //               backgroundColor: FreeVisaFreeTicketTheme.secondaryColor,
    //               radius: 40.0,
    //               child: Builder(
    //                 builder: (context) {
    //                   final textArr = e.jobCategory!.split(' ');
    //                   return Text(
    //                     textArr.first[0] + ' ' + textArr.last[0],
    //                     style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
    //                       color: FreeVisaFreeTicketTheme.whiteColor,
    //                     ),
    //                   );
    //                 },
    //               ),
    //             )),
    //         SizedBox(height: 10.h),
    //         Expanded(
    //           child: Text(
    //             e.jobCategory!,
    //             textAlign: TextAlign.center,
    //             style: FreeVisaFreeTicketTheme.bodyTextStyle,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   elevation: 1,
    //   margin: EdgeInsets.zero,
    // );
  }

  Widget _buildCategoryItemHorizontal(JobCategoryModel e) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: InkWell(
        onTap: () {
          locator<NavigationService>().navigateTo(routes.categoryJobListRoute,
              arguments: {
                'jobCategoryId': e.id,
                'jobCategoryName': e.jobCategory
              });
        },
        borderRadius: BorderRadius.circular(10.w),
        child: SizedBox(
          width: 250.w,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      bottomLeft: Radius.circular(10.w),
                    ),
                    child: CircleAvatar(
                      backgroundColor: FreeVisaFreeTicketTheme.secondaryColor,
                      radius: 40.0,
                      child: Builder(
                        builder: (context) {
                          final textArr = e.jobCategory!.split(' ');
                          return Text(
                            textArr.first[0] + ' ' + textArr.last[0],
                            style:
                                FreeVisaFreeTicketTheme.caption1Style.copyWith(
                              color: FreeVisaFreeTicketTheme.whiteColor,
                            ),
                          );
                        },
                      ),
                    )),
                SizedBox(height: 10.h),
                Expanded(
                  child: Text(
                    e.jobCategory!,
                    textAlign: TextAlign.center,
                    style: FreeVisaFreeTicketTheme.bodyTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
      elevation: 3,
      margin: EdgeInsets.zero,
    );
  }
}
