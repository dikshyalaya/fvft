import 'package:flutter/material.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/service_locator.dart';
import '../providers/auth_provider.dart';
import '../widgets/components/status_screen/final_selected.dart';
import '../widgets/components/status_screen/status_actions.dart';
import '../widgets/login_to_continue_widget.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return locator<AuthProvider>().currentUser == null
        ? const LoginToContinueWidget()
        : ListView(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            children: [
              SizedBox(height: 20.h), //space below app bar
              _buildStatusTitle(), //status title
              ...buildStatusActions(), // builds cards list
              buildSelectedApplication(), // seleteced application list
            ],
          );
  }

  Widget _buildStatusTitle() {
    return Text(
      'Application Status',
      textAlign: TextAlign.center,
      style: FreeVisaFreeTicketTheme.heading3Style.copyWith(
        color: FreeVisaFreeTicketTheme.darkGrayColor,
      ),
    );
  }
}
