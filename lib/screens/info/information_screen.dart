import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/utilities/spacing.dart';
import 'package:free_visa_free_ticket/widgets/components/info_screen/product_card.dart';
import 'package:free_visa_free_ticket/widgets/components/info_screen/useful_information.dart';
import '../../widgets/components/info_screen/footer.dart';
import '../../widgets/components/info_screen/news_blog_section.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      children: [
        // =========== BLOG AND NEWS SECTION=============
        // title
        blogNewsTitle(context),
//vertical spacing
        verticalSpacing(20.h),

// news/blog card
        newsBlogCard(),
//vertical spacing
        dividerWithThickness(4),

//blog card
        newsBlogCard(
            title: 'Dynamically passed news title and blog',
            date: 'dd/mm/yyyy'),
//vertical spacing
        dividerWithThickness(4),

        // ============USEFUL INFORMATION SECTION ============

//useful information section
        usefulInformationHeading(context),

        //vertical spacing
        verticalSpacing(20.h),

        // ======PRODUCTS SECTION ===========
//Products section
        products(),
//vertical spacing
        verticalSpacing(20.h),

        // ====== FOOTER ==========
        infoFooter()
      ],
    );
  }
}
