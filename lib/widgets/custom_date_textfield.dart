import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTextField extends StatefulWidget {
  final String? labelText, hintText, value;
  final bool? isPassword;
  final bool? isInitialValue;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final void Function(String?)? onChanged;
  final Function? onFieldSubmitted;
  final TextInputType? textInputType;
  final BoxConstraints? prefixConstraint;
  final Color? borderColor;
  final bool? isFilled;
  final bool? isDense;
  final bool? isEnabled;
  final double? borderRadius;
  final bool? isAllCaps;
  final int? maxLines;
  final void Function(String?)? onTap;

  const CustomDateTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.value,
    this.isPassword = false,
    this.isInitialValue = false,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType,
    this.prefixWidget,
    this.prefixConstraint,
    this.borderColor,
    this.isFilled, // = false,
    this.isDense, // = false,
    this.borderRadius = 10,
    this.isEnabled, // = true,
    this.isAllCaps = true,
    this.maxLines,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomDateTextFieldState createState() => _CustomDateTextFieldState();
}

class _CustomDateTextFieldState extends State<CustomDateTextField> {
  TextEditingController _dateInput = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    _dateInput.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateInput,
      enabled: widget.isEnabled,
      onChanged: widget.onChanged,
      readOnly: true,
      style: TextStyle(fontSize: 28.sp),
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
          filled: widget.isFilled,
          isDense: widget.isDense,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey.shade400,
              style: BorderStyle.solid,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey.shade400,
              style: BorderStyle.solid,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          errorMaxLines: 3,
          labelStyle: TextStyle(fontSize: 28.sp)),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String? formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            _dateInput.text = formattedDate;
          });
          widget.onTap!(formattedDate);
        } else {
          //date not selected
        }
      },
    );
  }
}
