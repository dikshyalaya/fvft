import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownWithSearch extends StatefulWidget {
  final List<String ?>  ?    dropDownItems;
  final String? textFieldTitle;
  final String? selectedItem;
  final String? searchFieldTitle;
  final void Function(String)? onChanged;
  final String? Function(String?)? validatorFunc;

  const CustomDropDownWithSearch({
    Key? key,
   this.dropDownItems,
    this.textFieldTitle,
    this.selectedItem,
    this.searchFieldTitle,
    this.onChanged,
    this.validatorFunc,
  }) : super(key: key);

  @override
  _CustomDropDownWithSearchState createState() =>
      _CustomDropDownWithSearchState();
}

class _CustomDropDownWithSearchState extends State<CustomDropDownWithSearch> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
    
      items: widget.dropDownItems as List<String>,
      // dropdownDecoratorProps: DropDownDecoratorProps(
        
        // labelText: widget.searchFieldTitle,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.grey.shade400,
        //     style: BorderStyle.solid,
        //     width: 1.5,
        //   ),
        //   borderRadius: BorderRadius.circular(20.w),
        // ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      // ),
      onChanged: widget.onChanged as void Function(String?)?,
      validator: widget.validatorFunc as String? Function(String?)?,
      selectedItem: widget.selectedItem,
      // showSearchBox: true,
      // searchFieldProps: TextFieldProps(
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Colors.grey.shade400,
      //         style: BorderStyle.solid,
      //         width: 1.5,
      //       ),
      //       borderRadius: BorderRadius.circular(20.w),
      //     ),
      //     contentPadding:
      //         EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      //     labelText: widget.textFieldTitle,
      //   ),
      // ),
      // popupTitle: Container(
      //   height: 50,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(40.w),
      //       topRight: Radius.circular(40.w),
      //     ),
      //   ),
      //   child: Center(
      //     child: Text(
      //       widget.searchFieldTitle!!,
      //       style: FreeVisaFreeTicketTheme.bodyTextStyle,
      //     ),
      //   ),
      // ),
      // popupShape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(40.w),
      //     topRight: Radius.circular(40.w),
      //   ),
      // ),
    );
  }
}
