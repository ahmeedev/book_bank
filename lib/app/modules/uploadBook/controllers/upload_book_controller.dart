import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';

class UploadBookController extends GetxController {
  var isImageSelected = false.obs;
  var isPdfSelected = false.obs;
  selectImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      isImageSelected.value = true;
      logger.i(image.path);
    } else {
      isImageSelected.value = false;
    }
  }

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file.path);

      final storageRef = FirebaseStorage.instance.ref();

      final pdfRef = storageRef.child("pdfFiles/my.pdf");

      try {
        // await pdfRef.putFile(file);
        final url = await pdfRef.getDownloadURL();
        logger.i(url);
        logger.d("Boook uploaded successfully");
      } on FirebaseException catch (e) {
        logger.e(e.message);
      }

      isPdfSelected.value = true;
    } else {
      isPdfSelected.value = false;
    }
  }
}
