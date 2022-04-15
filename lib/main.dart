import 'package:base_flutter/source/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'source/app/dependency_injection.dart';
import 'source/presentation/resources/langauge_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );

  initAppModule();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [ARABIC_Locale, ENGLISH_Locale],
      path: ASSETS_PATH_LOCALIZATIONS,
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}