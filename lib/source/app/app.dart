import 'package:base_flutter/source/presentation/resources/color_manager.dart';
import 'package:base_flutter/source/presentation/resources/theme_manager.dart';
import 'package:base_flutter/source/presentation/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import 'app_preferences.dart';
import 'dependency_injection.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPreferences = diInstance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((locale) => context.setLocale(locale));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorManager.primaryColorDark));
    List<LocalizationsDelegate> LocalizationsDelegateList =
        context.localizationDelegates;
    return MaterialApp(
      localizationsDelegates: LocalizationsDelegateList,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
