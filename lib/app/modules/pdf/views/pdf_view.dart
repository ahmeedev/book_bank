// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:book_bank/app/modules/pdf/controllers/pdf_controller.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:book_bank/app/theme/colors.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  PdfViewerController? pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _pdfViewerStateKey.currentState!.openBookmarkView();
                },
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  pdfViewerController?.jumpToPage(5);
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  pdfViewerController?.zoomLevel = 2;
                },
                icon: const Icon(
                  Icons.zoom_in,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  pdfViewerController?.zoomLevel = 1;
                },
                icon: const Icon(
                  Icons.zoom_out,
                  color: Colors.white,
                )),
          ],
        ),
        body: Stack(
          children: [
            SfPdfViewer.network(
              'http://s3.amazonaws.com/dynamiccatholic.com/Best+Lent+Ever+2016/BLE+2017/Parish+Resources/RH_StudyGuide_V2.pdf',
              controller: pdfViewerController,
              key: _pdfViewerStateKey,
              onPageChanged: (details) {
                if (details.newPageNumber > 10) {
                  Get.find<PdfController>().showOverlay.value = true;
                } else {
                  Get.find<PdfController>().showOverlay.value = false;
                }
              },
            ),
            Obx(() => Get.find<PdfController>().showOverlay.value
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.transparent,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(
                            alignment: FractionalOffset.center,
                            height: Get.height * 0.6,
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  color: defaultColorScheme.primary,
                                  child: Text(
                                    'Buy Now!!',
                                    style: TextStyle(
                                        color: defaultColorScheme.onPrimary,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ).paddingAll(kPadding),
                                ),
                                kHeight,
                                Text(
                                  'Rest of the book is paid, please buy the book to read the rest of the content',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: defaultColorScheme.primary,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                : const SizedBox()),
          ],
        ));
  }
}
