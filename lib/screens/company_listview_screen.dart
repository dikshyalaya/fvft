import 'package:flutter/material.dart';

import '../core/constants/assets_source.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyListViewScreen extends StatelessWidget {
  const CompanyListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.lerp(
          FreeVisaFreeTicketTheme.secondaryColor,
          FreeVisaFreeTicketTheme.primaryColor,
          0.1,
        ),
        title: Text(
          'Company List',
          style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            child: SizedBox(
              height: 200.h,
              width: 600.w,
              child: Row(
                children: [
                  Image.asset(
                    AssetsSource.freeVisaFreeTicketLogo,
                    width: 200.w,
                    height: 200.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Huwaei Malaysia Sdn. Bhd.',
                            style: FreeVisaFreeTicketTheme.caption1Style
                                .copyWith(
                              color: FreeVisaFreeTicketTheme.secondaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '(550)',
                            style: FreeVisaFreeTicketTheme.caption1Style
                                .copyWith(
                              color: FreeVisaFreeTicketTheme.secondaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 25,
      ),
    );
  }
}
