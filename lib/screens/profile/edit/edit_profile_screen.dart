import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utilities/validators.dart';
import '../../../providers/auth_uis_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';
import '../../../core/constants/routes.dart' as routes;
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future? _loadAllFunc;
  bool _isInit = true;
  XFile? _selectedImageFile;

  /// FUNC [_pickImage] : Pick images either from gallery or from camera
  void _pickImage(ImageSource source, BuildContext context) async {
    locator<NavigationService>().goBack();
    try {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: source, imageQuality: 50);
      if (pickedFile == null) return;
      final bytes = File(pickedFile.path).readAsBytesSync().lengthInBytes;
      final mb = (bytes / 1024) / 1024;
      if (mb > 2.0) {
        showCustomSnackBar(
            context: context,
            message: 'Please ! Upload image whose size is less than 2 MB.',
            isError: true);
        return;
      }
      final byteFile = await pickedFile.readAsBytes();
      Provider.of<AuthUISProvider>(context, listen: false)
          .setBase64(base64.encode(byteFile));
      Provider.of<AuthUISProvider>(context, listen: false)
          .setImageSize(bytes.toString());
      setState(() => _selectedImageFile = pickedFile);
    } catch (e) {
      showCustomSnackBar(
          context: context,
          message: 'Something went wrong ! Failed to pick image',
          isError: true);
      rethrow;
    }
  }

  /// FUNC [_buildChoosePhotoDialog] : Build Choose Photo from Gallery or Photo Dialog
  void _buildChoosePhotoDialog() {
    showDialog(
      context: context,
      builder: (dCtx) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(0),
          children: [
            SimpleDialogOption(
              onPressed: () => _pickImage(ImageSource.camera, context),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  'Take a Picture',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Divider(height: 0),
            SimpleDialogOption(
              onPressed: () => _pickImage(ImageSource.gallery, context),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.collections),
                title: Text(
                  'Select from Gallery',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadUserData() async {
    await Provider.of<AuthUISProvider>(context, listen: false).loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _loadAllFunc = _loadUserData();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTitle: 'Edit Profile',
      ),
      body: FutureBuilder(
        future: _loadAllFunc,
        builder: (fCtx, snapShotData) {
          return snapShotData.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  key: Provider.of<AuthUISProvider>(context, listen: false)
                      .editProfileFormKey,
                  child: ListView(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    children: [
                      SizedBox(height: 20.h),
                      _buildImageItem(),
                      SizedBox(height: 50.h),
                      _buildFullNameField(),
                      SizedBox(height: 40.h),
                      _buildEmailField(),
                      SizedBox(height: 40.h),
                      _buildPhoneField(),
                      SizedBox(height: 40.h),
                      _buildSaveBtn(),
                      SizedBox(height: 30.h),
                      CustomButton(
                        height: 100.h,
                        width: double.infinity,
                        color: FlexColor.greenLightPrimary,
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 20.h),
                        title: 'Change Password',
                        onTap: () {
                          locator<NavigationService>()
                              .navigateTo(routes.changePasswordRoute);
                        },
                        // color: FreeVisaFreeTicketTheme.greyText,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget _buildFullNameField() {
    return Selector<AuthUISProvider, String>(
      builder: (_, fullName, __) {
        return CustomTextFormField(
          isDense: true,
          borderRadius: 10.w,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setFullName(value!);
          },
          value: fullName,
          validatorFunc: Validator.fullNameValidator,
          labelText: 'Full Name',
        );
      },
      selector: (ctx, data) {
        return data.fullName ?? '';
      },
    );
  }

  Widget _buildEmailField() {
    return Selector<AuthUISProvider, String>(
      builder: (_, email, __) {
        return CustomTextFormField(
          isDense: true,
          borderRadius: 10.w,
          isEnabled: false,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setEmail(value!);
          },
          value: email,
          validatorFunc: Validator.emailValidator,
          labelText: 'E-mail',
        );
      },
      selector: (ctx, data) {
        return data.email ?? '';
      },
    );
  }

  Widget _buildPhoneField() {
    return Selector<AuthUISProvider, String>(
      builder: (_, phone, __) {
        return CustomTextFormField(
          isDense: true,
          borderRadius: 10.w,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setPhone(value!);
          },
          value: phone,
          validatorFunc: Validator.mobileValidator,
          labelText: 'Phone',
        );
      },
      selector: (ctx, data) {
        return data.phone ?? '';
      },
    );
  }

  Widget _buildImageItem() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: _selectedImageFile == null
                ? Consumer<AuthUISProvider>(
                    builder: (ctx, data, _) {
                      return Image.network(
                        data.imageUrl != null
                            ? data.imageUrl!
                            : 'https://www.oberlo.com/media/1603897950-job.jpg',
                        fit: BoxFit.cover,
                        height: 250.w,
                        width: 250.w,
                        errorBuilder: (ctx, _, __) {
                          return Image.network(
                            'https://www.oberlo.com/media/1603897950-job.jpg',
                            fit: BoxFit.cover,
                            height: 200.w,
                            width: 200.w,
                          );
                        },
                      );
                    },
                  )
                : Image.file(
                    File(_selectedImageFile!.path),
                    fit: BoxFit.cover,
                    height: 250.w,
                    width: 250.w,
                  ),
          ),
          Positioned(
            top: 15.h,
            right: -5.w,
            child: InkWell(
              onTap: () => _buildChoosePhotoDialog(),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.w),
                height: 60.w,
                width: 60.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: locator<ThemeProvider>().isLightTheme()
                          ? FlexColor.greyLawDarkPrimary
                          : Colors.white),
                  color: locator<ThemeProvider>().isLightTheme()
                      ? Colors.white54
                      : Colors.black87,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 40.w,
                  color: locator<ThemeProvider>().isLightTheme()
                      ? FlexColor.greyLawDarkPrimaryVariant
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveBtn() {
    return Consumer<AuthUISProvider>(
      builder: (ctx, data, _) {
        return CustomButton(
          height: 100.h,
          width: double.infinity,
          color: FlexColor.greenLightPrimary,
          textColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
          title: 'Save',
          isLoading: data.isLoading,
          onTap: data.editUserProfile,
          //color: FreeVisaFreeTicketTheme.greenColor,
        );
      },
    );
  }
}
