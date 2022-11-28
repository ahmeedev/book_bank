// ignore_for_file: avoid_print

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
        body: SfPdfViewer.network(
          'http://s3.amazonaws.com/dynamiccatholic.com/Best+Lent+Ever+2016/BLE+2017/Parish+Resources/RH_StudyGuide_V2.pdf',
          controller: pdfViewerController,
          key: _pdfViewerStateKey,
        ));
  }
}
