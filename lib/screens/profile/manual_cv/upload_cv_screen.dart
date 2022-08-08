import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/utilities/validators.dart';
import '../../../providers/cv_provider.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_textformfield.dart';

class UploadCVScreen extends StatefulWidget {
  const UploadCVScreen({Key? key}) : super(key: key);

  @override
  State<UploadCVScreen> createState() => _UploadCVScreenState();
}

class _UploadCVScreenState extends State<UploadCVScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _pickedFileName;
  late File? _file;
  String? _title;
  bool _isFileSelected = false;
  bool _hasError = false;
  bool _isLoading = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() => {
            _pickedFileName = result.names[0],
            _isFileSelected = true,
            _file = File(result.files.single.path!),
          });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _saveYourCV() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => _hasError = true);
      return;
    }
    _formKey.currentState!.save();
    setState(() => {_hasError = false, _isLoading = true});
    await locator<CVProvider>().addNewCv(title: _title!, file: _file!);
    showCustomSnackBar(
        context: context, message: 'Your CV has been uploaded successfully!');
    setState(() => _isLoading = false);
    locator<NavigationService>().goBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(appBarTitle: 'Upload Your CV'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              _buildTitleTextField(),
              ..._isFileSelected
                  ? _buildFileSelectedWidgets()
                  : _buildUploadFileUI(),
              SizedBox(height: 50.h),
              _buildSaveBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleTextField() {
    return CustomTextFormField(
      hintText: 'Title',
      validatorFunc: Validator.cvTitleValidator,
      onChanged: (value) => _title = value,
    );
  }

  List<Widget> _buildFileSelectedWidgets() {
    return [
      SizedBox(height: 40.h),
      Text(
        'Selected File:',
        style: FreeVisaFreeTicketTheme.bodyTextStyle,
      ),
      SizedBox(height: 10.h),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: _pickedFileName,
              isEnabled: false,
              value: _pickedFileName,
              validatorFunc: (val) {},
              onTap: () {},
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFileSelected = false;
                _pickedFileName = null;
              });
            },
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 60.w,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildUploadFileUI() {
    return [
      SizedBox(height: 40.h),
      InkWell(
        onTap: _pickFile,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 400.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hasError ? Colors.red : Colors.grey.shade400,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload_file,
                size: 180.w,
                color: Colors.grey.shade500,
              ),
              SizedBox(height: 10.h),
              Text(
                'Upload/Pick Your CV',
                textAlign: TextAlign.center,
                style: FreeVisaFreeTicketTheme.bodyTextStyle.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
      if (_hasError) ...[
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            'Please select your cv',
            style: FreeVisaFreeTicketTheme.body3TextStyle.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    ];
  }

  Widget _buildSaveBtn() {
    return Center(
      child: CustomButton(
        title: 'Save',
        color: FlexColor.greenLightPrimary,
        textColor: Colors.white,
        width: 300.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        onTap: () async => await _saveYourCV(),
        isLoading: _isLoading,
      ),
    );
  }
}
