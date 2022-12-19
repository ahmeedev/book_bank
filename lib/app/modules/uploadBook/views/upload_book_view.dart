import 'package:book_bank/app/modules/home/controllers/home_controller.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_book_controller.dart';

class UploadBookView extends GetView<UploadBookController> {
  const UploadBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.find<HomeController>().booksFuture.value =
            Get.find<HomeController>().fetchBooksFromFirebase();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Upload Book'),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                TextFormField(
                  // validator: (value) => EmailValidator.validate(value!)
                  //     ? null
                  //     : "Please enter a valid email",
                  maxLines: 1,
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter book title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight,
                TextFormField(
                  // validator: (value) => EmailValidator.validate(value!)
                  //     ? null
                  //     : "Please enter a valid email",
                  maxLines: 1,
                  controller: controller.priceController,
                  decoration: InputDecoration(
                    hintText: 'Enter book Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight,
                TextFormField(
                  // validator: (value) => EmailValidator.validate(value!)
                  //     ? null
                  //     : "Please enter a valid email",
                  maxLines: 8,
                  controller: controller.descController,

                  decoration: InputDecoration(
                    hintText: 'Enter book Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight,
                TextFormField(
                  // validator: (value) => EmailValidator.validate(value!)
                  //     ? null
                  //     : "Please enter a valid email",
                  maxLines: 1,
                  controller: controller.authurController,
                  decoration: InputDecoration(
                    hintText: 'Enter book Author',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => controller.isImageSelected.value
                          ? const Text("Image selected")
                          : const Text("No image selected"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.selectImage();
                        },
                        child: const Text("Upload Image")),
                  ],
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => controller.isPdfSelected.value
                          ? const Text("Pdf selected")
                          : const Text("No Pdf selected"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.selectFile();
                        },
                        child: const Text("  Upload PDF  ")),
                  ],
                ),
                kHeight,
                kHeight,
                ElevatedButton(
                    onPressed: () {
                      controller.uploadBook(
                        controller.titleController.text,
                        controller.authurController.text,
                        int.parse(controller.priceController.text),
                        controller.descController.text,
                      );
                    },
                    child: const Text("  Upload Book  ").paddingAll(kPadding)),
              ],
            ),
          )),
    );
  }
}
