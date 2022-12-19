import 'dart:io';
import 'dart:math';

import 'package:book_bank/app/modules/uploadBook/Models/up_book_model.dart';
import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class UploadBookController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController authurController = TextEditingController();
  var isImageSelected = false.obs;
  var isPdfSelected = false.obs;

  File? imageFile;
  selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png'],
    );

    if (result != null) {
      imageFile = File(result.files.single.path!);
      isImageSelected.value = true;
    } else {
      isImageSelected.value = false;
    }
  }

  File? pdfFile;
  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pdfFile = File(result.files.single.path!);

      isPdfSelected.value = true;
    } else {
      isPdfSelected.value = false;
    }
  }

  void uploadBook(
      String bookName, String authur, int price, String description) async {
    late String imageUrl;
    late String pdfUrl;

    if (bookName.isNotEmpty &&
        pdfFile != null &&
        imageFile != null &&
        authur.isNotEmpty &&
        price != 0 &&
        description.isNotEmpty) {
      //* Upload image
      final storageRef = FirebaseStorage.instance.ref();
      int random = Random().nextInt(100000);
      final imgRef = storageRef.child("pdfImages/$random.png");

      try {
        await imgRef.putFile(imageFile!);
        imageUrl = await imgRef.getDownloadURL();
      } on FirebaseException catch (e) {
        logger.e(e.message);
      }

      //* Upload pdf
      int random2 = Random().nextInt(200000);
      final pdfRef = storageRef.child("pdfFiles/$random.pdf");

      try {
        await pdfRef.putFile(pdfFile!);
        pdfUrl = await pdfRef.getDownloadURL();
      } on FirebaseException catch (e) {
        logger.e(e.message);
      }

      UploadModel model = UploadModel(
        bookName: bookName,
        authur: authur,
        description: description,
        price: price,
      );
      final db = FirebaseFirestore.instance;

      // //! put the text fields data accrodingly..
      await db
          .collection("myBooks")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        model.bookName: {
          "authur": model.authur,
          "description": model.description,
          "imageUrl": imageUrl,
          "pdfUrl": pdfUrl,
          "price": model.price,
          "isFullAccess": true, // fix
        },
      }, SetOptions(merge: true));

      await db
          .collection("books")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        model.bookName: {
          // title is random variable
          "authur": model.authur,
          "description": model.authur,
          "imageUrl": imageUrl,
          "pdfUrl": pdfUrl,
          "price": model.price,
          "isFullAccess": false, // fix
        },
      }, SetOptions(merge: true));

      logger.d("Book uploaded successfully");
      showSnackBar(
          title: "Upload!", description: "Your book is uploaded successfully!");
    } else {
      showSnackBar(
          title: "Error!", description: "Fill and select all the fields first");
    }
  }
}
