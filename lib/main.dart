import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/theme/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await basicInitailization();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Book Bank",
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        // primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> basicInitailization() async {}
