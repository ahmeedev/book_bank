import 'package:book_bank/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/theme/light_theme.dart';
import 'firebase_options.dart';
// hello
var logger = Logger();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'bookbank',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // make state persistent for user authentication.
  // FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  // important initialization
  await basicInitailization();

  //
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Book Bank",
      theme: getLightTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> basicInitailization() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: defaultColorScheme.secondary,
  ));
}
