import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/assets_source.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/company_provider.dart';

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
      body: Consumer<CompanyProvider>(
        builder: (context, value, child) => value.companiesList.isEmpty
            ? const Center(child: Text('No Companies are listed'))
            : value.isLoading
                ? Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.h,
                      child: const CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        elevation: 3,
                        child: SizedBox(
                          height: 200.h,
                          width: 600.w,
                          child: Row(
                            children: [
                              Image.network(
                                'https://demo.freevisafreeticket.com/${value.companiesList[index].companyLogo}',
                                width: 150.w,
                                height: 150.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      value.companiesList[index].companyName!,
                                      style: FreeVisaFreeTicketTheme
                                          .caption1Style
                                          .copyWith(
                                        color: FreeVisaFreeTicketTheme
                                            .secondaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        value.companiesList[index]
                                            .companyAddress!,
                                        style: FreeVisaFreeTicketTheme
                                            .caption1Style
                                            .copyWith(
                                          color: FreeVisaFreeTicketTheme
                                              .secondaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: value.companiesList.length,
                  ),
      ),
    );
  }
}
