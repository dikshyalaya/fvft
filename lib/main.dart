import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/constants/route_constants.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/contact_info.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/personal_info.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/profile_home.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/qualification_info.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/skills_info.dart';
import 'core/services/service_locator.dart';
import 'core/theme/free_visa_free_ticket_theme.dart';
import 'core/utilities/language_utils.dart';
import 'providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'appconfig.dart';
import 'core/constants/routes.dart';
import 'core/services/app_localization_service.dart';
import 'core/services/navigation_service.dart';

class FreeVisaFreeTicket extends StatefulWidget {
  const FreeVisaFreeTicket({Key? key}) : super(key: key);

  // This widget is the root of your application.

  static void setLocale(BuildContext context, Locale locale) {
    _FreeVisaFreeTicketState? state =
        context.findAncestorStateOfType<_FreeVisaFreeTicketState>()!;
    state.setLocale(locale);
  }

  @override
  _FreeVisaFreeTicketState createState() => _FreeVisaFreeTicketState();
}

class _FreeVisaFreeTicketState extends State<FreeVisaFreeTicket> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<ThemeProvider>(),
      child: ScreenUtilInit(
        designSize: const Size(750, 1334),
        builder: ((_, __) => Consumer<ThemeProvider>(
              builder: (ctx, data, _) {
                return MaterialApp(
                  // home: const ProfileHome(),
                  // home: const ContactInformation(),
                  // home: const PersonalInformation(),
                  // home: const SkillsInfo(),

                  // home: const QualificationInfo(),
                  debugShowCheckedModeBanner: false,
                  title: AppConfig.of(context)!.appTitle ??
                      'Free Visa Free Ticket',
                  themeMode: data.themeMode,
                  theme: FreeVisaFreeTicketTheme.lightTheme,
                  darkTheme: FreeVisaFreeTicketTheme.darkTheme,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  navigatorKey: NavigationService.navigatorKey,
                  supportedLocales: LanguageUtils.getSupportedLanguage(),
                  localizationsDelegates: [
                    AppLocalizations.delegate!,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: _locale,
                  //returns the locale which will be used by app
                  localeResolutionCallback: (locale, supportedLocales) {
                    //check if the current device locale is supported
                    for (var supportedLocaleLanguage in supportedLocales) {
                      if (supportedLocaleLanguage.languageCode ==
                              locale!.languageCode &&
                          supportedLocaleLanguage.countryCode ==
                              locale.countryCode) {
                        return supportedLocaleLanguage;
                      }
                    }
                    // If device not support with locale to get language code then default get first on from the list
                    return supportedLocales.first;
                  },
                );
              },
            )),
      ),
    );
  }
}
