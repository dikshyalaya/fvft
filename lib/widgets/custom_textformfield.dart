import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';

/// Widget [CustomTextFormField] : CustomTextField for creating custom button
class CustomTextFormField extends StatefulWidget {
  //Variables
  final String? labelText, hintText, value;
  final bool? isPassword;
  final bool? isInitialValue;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?)? validatorFunc;
  final Function(String?)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final BoxConstraints? prefixConstraint;
  final Color? borderColor;
  final bool? isFilled;
  final bool? isDense;
  final bool? isEnabled;
  final double? borderRadius;
  final bool? isOptionalValidation;
  final bool? isAllCaps;
  final int? maxLines;
  final List<TextInputFormatter>? textInputFormatter;
  final Function? onTap;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.value,
    this.isPassword = false,
    this.isInitialValue = false,
    this.suffixIcon,
    this.onSaved,
    this.onChanged,
    this.validatorFunc,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textInputType,
    this.prefixWidget,
    this.prefixConstraint,
    this.borderColor,
    this.isFilled = false,
    this.isDense = false,
    this.borderRadius = 10,
    this.isEnabled = true,
    this.isOptionalValidation = false,
    this.isAllCaps = false,
    this.maxLines,
    this.textInputFormatter,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField>
    with AutomaticKeepAliveClientMixin {
  bool showPassword = false;
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value ?? '');
    controller!.addListener(() {});
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TextFormField(
      controller: controller,
      validator: (value) =>
          widget.isOptionalValidation! && (value == null || value.isEmpty)
              ? null
              : widget.validatorFunc!(value),
      enabled: widget.isEnabled,
      inputFormatters: widget.textInputFormatter ?? [],
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      style: TextStyle(fontSize: 28.sp),
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        focusColor: Color.lerp(
          FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
          FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
          0.8,
        ),
        filled: widget.isFilled,
        fillColor: Color.lerp(
          FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
          FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
          0.8,
        ),
        isDense: widget.isDense,
        // focusColor: Color.lerp(
        //       FreeVisaFreeTicketTheme.primaryColor,
        //       FreeVisaFreeTicketTheme.secondaryColor,
        //       0.8,
        //     ) ??
        //     Colors.grey.shade400,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.lerp(
                  FreeVisaFreeTicketTheme.primaryColor,
                  FreeVisaFreeTicketTheme.secondaryColor,
                  0.8,
                ) ??
                Colors.grey.shade400,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor
             ?? Colors.grey.shade400,
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
        prefixIcon: widget.prefixWidget,
        prefixIconConstraints: widget.prefixConstraint ??
            const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
        errorStyle: FreeVisaFreeTicketTheme.body3TextStyle.copyWith(
          color: Colors.red,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        suffixIcon: widget.isPassword!
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorMaxLines: 3,
        labelStyle: TextStyle(fontSize: 28.sp),
      ),
      obscureText: widget.isPassword! && !showPassword,
      keyboardType: widget.textInputType ?? TextInputType.text,
      enableSuggestions: true,
      textCapitalization: widget.isAllCaps!
          ? TextCapitalization.characters
          : TextCapitalization.none,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
