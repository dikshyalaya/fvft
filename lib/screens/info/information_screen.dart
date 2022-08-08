import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/assets_source.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({Key? key}) : super(key: key);

  final Map<String, String> _infoItems = {
    'Passport Application Process': AssetsSource.passport,
    'Nepali Embassy': AssetsSource.embassy,
    'Do and Don\'ts': AssetsSource.doDont,
    'Foreign Job Application Process': AssetsSource.applicationProcess,
    'Skill and Trainings': AssetsSource.skill,
    'Foreign Job Categories': AssetsSource.foreignJob,
    'Countries': AssetsSource.flags,
    'Useful Links': AssetsSource.chain,
    'Foreign Jobs': AssetsSource.foreignJob
  };

  List<Widget> _cardItems() {
    List<Widget> _items = [];
    _infoItems.forEach((key, value) {
      _items.add(
        _buildInfoCard(
          title: key,
          image: value,
        ),
      );
    });
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      children: [
        Container(
          height: 80.h,
          color: FreeVisaFreeTicketTheme.lightGray,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News Update And Blog',
                style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.primaryColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                    color: FreeVisaFreeTicketTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 200.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image.asset(AssetsSource.skill),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "EU says 'Putin must and will fail' as it agress new sancyions",
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Friday, 25 Feb 2022',
                              style: FreeVisaFreeTicketTheme.body2TextStyle
                                  .copyWith(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_circle_down,
                                color: FreeVisaFreeTicketTheme.primaryColor,
                              ),
                              label: Text(
                                'More',
                                style: FreeVisaFreeTicketTheme.body1TextStyle
                                    .copyWith(
                                  color: FreeVisaFreeTicketTheme.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(thickness: 4),
        SizedBox(
          height: 200.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image.asset(AssetsSource.skill),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "EU says 'Putin must and will fail' as it agress new sancyions",
                          style: FreeVisaFreeTicketTheme.body1TextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Friday, 25 Feb 2022',
                              style: FreeVisaFreeTicketTheme.body2TextStyle
                                  .copyWith(
                                color: FreeVisaFreeTicketTheme.darkGrayColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_circle_down,
                                color: FreeVisaFreeTicketTheme.primaryColor,
                              ),
                              label: Text(
                                'More',
                                style: FreeVisaFreeTicketTheme.body1TextStyle
                                    .copyWith(
                                  color: FreeVisaFreeTicketTheme.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(thickness: 4),
        Container(
          alignment: Alignment.center,
          decoration: FreeVisaFreeTicketTheme.gradientDecoration,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Useful Information'.toUpperCase(),
                      style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'More',
                        style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                          color: FreeVisaFreeTicketTheme.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _cardItems()[index],
                shrinkWrap: true,
                itemCount: _cardItems().length,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              _buildImageTile(
                title: 'Santi Overseas Pvt. Ltd.',
                image: AssetsSource.santi,
                tileColor: Colors.green,
              ),
              SizedBox(width: 20.w),
              _buildImageTile(
                title: 'Free Visa Free Ticket',
                image: AssetsSource.freeVisaFreeTicketLogo,
                tileColor: FreeVisaFreeTicketTheme.secondaryColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:const [
                FreeVisaFreeTicketTheme.secondaryColor,
                FreeVisaFreeTicketTheme.primaryColor,
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Text(
                'For more information, please contact here',
                style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                  color: FreeVisaFreeTicketTheme.whiteColor,
                ),
              ),
              const Divider(
                thickness: 1,
                color: FreeVisaFreeTicketTheme.whiteColor,
              ),
              SizedBox(height: 10.h),
              _buildMoreInfo(
                title: 'Phone',
                value: '+977-14256457',
              ),
              SizedBox(height: 10.h),
              _buildMoreInfo(
                title: 'Email',
                value: 'support@freevisafreeticket.com',
              ),
              SizedBox(height: 10.h),
              _buildMoreInfo(
                title: 'Facebook',
                value: 'fb.com/freevisafreeticket',
              ),
              SizedBox(height: 10.h),
              _buildMoreInfo(
                title: 'Web',
                value: 'htttps://www.freevisafreeticket.com',
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageTile({
    required String title,
    required String image,
    required Color? tileColor,
  }) =>
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 100,
              width: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: FreeVisaFreeTicketTheme.body4TextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_down_sharp,
                color: FreeVisaFreeTicketTheme.primaryColor,
              ),
              label: Text(
                'Read More',
                style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildInfoCard({ required String title,  required String image}) =>
      InkWell(
        onTap: () {},
        child: Card(
          color: FreeVisaFreeTicketTheme.lightGray,
          child: Row(
            children: [
              Image.asset(
                image,
                height: 100.w,
                width: 100.w,
                fit: BoxFit.fitHeight,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  title,
                  style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildMoreInfo({
    required String? title,
    required String? value,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$title:',
            style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
              color: FreeVisaFreeTicketTheme.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            '     $value',
            style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
              color: FreeVisaFreeTicketTheme.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
