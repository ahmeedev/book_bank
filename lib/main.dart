import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:book_bank/app/theme/colors.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await basicInitailization();

  runApp(
    GetMaterialApp(
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
