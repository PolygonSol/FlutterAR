import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:arcgis_ar/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wakelock/wakelock.dart';

import 'core/app_binding.dart';
import 'data/theme.dart';

void main() async {

  // creates a zone
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize other stuff here...
    Wakelock.enable();
    await SentryFlutter.init(
          (options) {
        options.dsn =
        'https://18ad08853a30977b88b0c38d4d4001c4@o4507186540249088.ingest.us.sentry.io/45073388161597440';
      },
    );
    // or here
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppTheme.appTheme,
        initialBinding: AppBinding(),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}





