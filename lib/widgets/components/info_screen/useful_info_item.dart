import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_source.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';

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

List<Widget> usefulInfoCardItems(BuildContext context) {
  List<Widget> items = [];
  _infoItems.forEach((key, value) {
    items.add(
      _buildInfoCard(
        context,
        title: key,
        image: value,
      ),
    );
  });
  return items;
}

Widget _buildInfoCard(BuildContext context,
        {required String title, required String image}) =>
    InkWell(
      onTap: () {},
      child: Card(
        color: Theme.of(context).primaryColor,
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
                    color: Theme.of(context).textTheme.bodySmall!.color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
