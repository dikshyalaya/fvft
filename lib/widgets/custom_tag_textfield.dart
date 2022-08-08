import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTagTextField extends StatefulWidget {
  final List<String>? initialValue;
  final String? title;
  final String? Function(String?)? validationFunc;
  final Function(String) onDelete;
  final Function(String) onSaved;

  const CustomTagTextField(
      {Key? key,
      this.initialValue,
      this.title,
      this.validationFunc,
      required this.onDelete,
      required this.onSaved})
      : super(key: key);

  @override
  _CustomTagTextFieldState createState() => _CustomTagTextFieldState();
}

class _CustomTagTextFieldState extends State<CustomTagTextField>
    with AutomaticKeepAliveClientMixin<CustomTagTextField> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TextFieldTags(
      textSeparators: const [' ', '.', ','],
      initialTags: widget.initialValue,
      tagsStyler: TagsStyler(
        showHashtag: false,
        tagCancelIcon:
            Icon(Icons.cancel, size: 40.w, color: Colors.red.withOpacity(0.7)),
        tagCancelIconPadding: const EdgeInsets.only(left: 4.0, top: 2.0),
        tagPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        tagDecoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: FlexColor.greyLawDarkPrimaryVariant),
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        tagTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      ),
      textFieldStyler: TextFieldStyler(
        isDense: true,
        hintText: widget.title!,
        helperText: '',
        textFieldFocusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
        textFieldBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
      ),
      onDelete: widget.onDelete,
      onTag: widget.onSaved,
      validator: widget.validationFunc,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
