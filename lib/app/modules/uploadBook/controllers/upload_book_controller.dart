import 'dart:io';
import 'dart:math';

import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class UploadBookController extends GetxController {
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

  uploadBook() async {
    late String imageUrl;
    late String pdfUrl;

    if (pdfFile != null && imageFile != null) {
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

      final db = FirebaseFirestore.instance;

      // //! put the text fields data accrodingly..
      await db
          .collection("myBooks")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "$random": {
          "authur": "authur",
          "description": "description",
          "imageUrl": imageUrl,
          "pdfUrl": pdfUrl,
          "price": 800,
          "isFullAccess": true,
        },
      }, SetOptions(merge: true));

      await db
          .collection("myBooks")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "$random": {
          "authur": "authur",
          "description": "description",
          "imageUrl": imageUrl,
          "pdfUrl": pdfUrl,
          "price": 800,
          "isFullAccess": false,
        },
      }, SetOptions(merge: true));

      logger.d("Book uploaded successfully");
    } else {
      showSnackBar(
          title: "Error!", description: "Fill and select all the fields first");
    }
  }
}
