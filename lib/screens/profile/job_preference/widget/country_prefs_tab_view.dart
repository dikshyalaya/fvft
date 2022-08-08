import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/assets_source.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../../core/utilities/validators.dart';
import '../../../../providers/job_filter_provider.dart';
import '../../../../providers/job_prefrences/job_preference_ui_provider.dart';
import '../../my_resume/sub_widget/custom_list_tile.dart';
import '../../../../widgets/custom_drop_down_with_search.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CountryPrefsTabView extends StatelessWidget {
  final Future? future;
  final Function? refreshState;

  CountryPrefsTabView({
    Key? key,
    required this.future,
    required this.refreshState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobPreferenceUIProvider>(
      builder: (ctx, data, _) {
        return data.isToVisibleDraggableSheet
            ? Form(
                key: data.formKey1,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AssetsSource.taskListAnimation,
                        height: 500.h,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Add New Country To Your Job Preference',
                        style: FreeVisaFreeTicketTheme.caption1Style,
                      ),
                      SizedBox(height: 60.h),
                      CustomDropDownWithSearch(
                        dropDownItems:
                            locator<JobFilterProvider>().countryNameList,
                        searchFieldTitle: 'Select a country',
                        textFieldTitle: 'Search a country',
                        selectedItem: Provider.of<JobPreferenceUIProvider>(
                                context,
                                listen: false)
                            .countryName,
                        onChanged: Provider.of<JobPreferenceUIProvider>(context,
                                listen: false)
                            .setCountryName,
                        validatorFunc: Validator.selectCountryNameValidator,
                      ),
                      SizedBox(height: 80.h),
                      _buildSaveCancelBtn(data),
                    ],
                  ),
                ),
              )
            : FutureBuilder(
                builder: (fCtx, snapShotData) {
                  final jobPrefsUIProvider =
                      Provider.of<JobPreferenceUIProvider>(context,
                          listen: false);
                  return snapShotData.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : jobPrefsUIProvider.countryList!.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.h),
                              child: Text(
                                'Do you want to filter job based on your priority in a job post? If yes then press Add (+) button to add your one or multiple job priority based on country.',
                                style: FreeVisaFreeTicketTheme.bodyTextStyle,
                              ),
                            )
                          : _buildCountryPrefsList(context);
                },
                future: future,
              );
      },
    );
  }

  Widget _buildSaveCancelBtn(JobPreferenceUIProvider data) {
    return Row(
      children: [
        Expanded(
          child: data.isLoading
              ? const SizedBox.shrink()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 56.w, vertical: 16.h),
                      primary: FlexColor.redDarkPrimaryVariant.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'Cancel',
                    style: FreeVisaFreeTicketTheme.bodyTextStyle
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: data.toggleDraggableSheet,
                ),
        ),
        SizedBox(width: 50.w),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 16.h),
                primary: FlexColor.greenLightPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: data.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    'Save',
                    style: FreeVisaFreeTicketTheme.bodyTextStyle
                        .copyWith(color: Colors.white),
                  ),
            onPressed: () async => await data.saveCountry(),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryPrefsList(final context) {
    final jobPrefsUIProvider =
        Provider.of<JobPreferenceUIProvider>(context, listen: false);
    return ReorderableListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      children: jobPrefsUIProvider.countryList!
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              AnimatedContainer(
                key: ValueKey(e),
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  key: ValueKey(e),
                  children: [
                    CustomListTile(
                      key: UniqueKey(),
                      onTap: () {},
                      title: e,
                      date: 'Priority Level: ${index + 1}',
                      editTap: () async => await jobPrefsUIProvider
                          .deleteParticularCountryFromPrefs(e),
                      subTitle: '',
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          )
          .values
          .toList(),
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final element = jobPrefsUIProvider.removeCountryByIndex(oldIndex);
        jobPrefsUIProvider.addNewCountry(
            newIndex: newIndex, value: element, oldIndex: oldIndex);
        refreshState!();
      },
    );
  }
}
