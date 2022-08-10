import 'dart:io';

import '../../../core/services/hive_service.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../core/utilities/enum_utils.dart';
import '../../../models/local_storage/cv_model.dart';
import '../../../widgets/custom_snackbar.dart';
// import 'package:native_pdf_view/native_pdf_view.dart'; TODO : UNcomment this one
import 'package:path_provider/path_provider.dart' as sysDir;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/services/service_locator.dart';
import '../../../providers/cv_provider.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewCVScreen extends StatefulWidget {
  const ViewCVScreen({Key? key}) : super(key: key);

  @override
  State<ViewCVScreen> createState() => _ViewCVScreenState();
}

class _ViewCVScreenState extends State<ViewCVScreen> {
  bool isSampleDoc = true;
  // late PdfController? _pdfController; //TODO : uncomment this one

  String pathPDF = '';
  String pdfName = '';
  bool _isInit = true;
  Future? _future;
  bool _isToDeleteCV = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _future = _loadPdfDoc();
    }
    _isInit = false;
  }

  Future<void> _loadPdfDoc() async {
    try {
      final myCv = locator<CVProvider>().myCv;
      if (myCv!.localPath == null) {
        final url = myCv.cvUrl!;
        final filename = url.substring(url.lastIndexOf('/') + 1);
        var request = await HttpClient().getUrl(Uri.parse(url));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        String dir = (await sysDir.getApplicationDocumentsDirectory()).path;
        File file = File('$dir/$filename');
        await file.writeAsBytes(bytes);
        if (file!=null) {
          pdfName = file.toString();
          pathPDF = file.path;
          // _pdfController = //TODO : uncomment this one
          //     PdfController(document: PdfDocument.openFile(pathPDF));
          CVModel cvModel = CVModel(
            id: myCv.id,
            title: myCv.title,
            cvUrl: myCv.cvUrl,
            localPath: pathPDF,
          );
          await locator<HiveService>().updateBox(
            cvModel,
            HiveBoxName.userCV.stringValue,
          );
          locator<CVProvider>().setUpdatedCV(cvModel);
        }
      } else {
        // _pdfController = PdfController(
        //   document: PdfDocument.openFile(
        //     locator<CVProvider>().myCv!.localPath!,
        //   ),
        // );
        //TODO uncomment this one
      }
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTitle: locator<CVProvider>().myCv!.title,
        actions: [
          if (!_isToDeleteCV)
            IconButton(
              onPressed: () async {
                await _showExitConfirmationDialog();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 60.w,
              ),
            ),
        ],
      ),
      body: _isToDeleteCV
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_copy_outlined,
                  size: 200.w,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Please ! wait for a while. Your CV is being deleted.',
                  style: FreeVisaFreeTicketTheme.caption1Style,
                ),
                SizedBox(height: 100.h),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : FutureBuilder(
              future: _future,
              builder: (fCtx, snapShotData) {
                return snapShotData.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    :const  SizedBox();
                    // TODO uncomment and remove sizedBox
                    // PdfView(
                    //     pageSnapping: false,
                    //     documentLoader:
                    //         const Center(child: CircularProgressIndicator()),
                    //     pageLoader:
                    //         const Center(child: CircularProgressIndicator()),
                    //     controller: _pdfController!,
                    //   );
              },
            ),
    );
  }

  Future<T?> _showExitConfirmationDialog<T>() {
    return showDialog<T>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            'Are you sure?',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to delete your cv?',
                style:
                    TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              child: const Text(
                'Cancel',
                style: TextStyle(),
              ),
              onTap: () {
                locator<NavigationService>().goBack();
              },
            ),
            const SizedBox(width: 4.0),
            ActionChip(
              label: const Text(
                '   Yes   ',
              ),
              backgroundColor: Colors.transparent,
              onPressed: () async {
                locator<NavigationService>().goBack();
                setState(() => _isToDeleteCV = true);
                final bool result = await locator<CVProvider>().deleteUserCV();
                showCustomSnackBar(
                    context: context,
                    message: result
                        ? 'CV has been deleted successfully !'
                        : 'Failed to delete user cv',
                    isError: !result);
                locator<NavigationService>().goBack();
              },
            ),
          ],
        );
      },
    );
  }
}
