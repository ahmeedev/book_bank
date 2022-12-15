import 'package:book_bank/app/routes/app_pages.dart';
import 'package:book_bank/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
import '../../../utilities/get_methods.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Book Details")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: const EdgeInsets.all(kMargin),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(controller.book.imageUrl)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight,
                  Text(
                    controller.book.name,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.book.authur,
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "Rs. ${controller.book.price}",
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                  kHeight,
                  Text(
                    "Description",
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                  kHeight,
                  Text(
                    controller.book.description,
                    style: theme.textTheme.labelMedium!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ).paddingSymmetric(horizontal: kPadding),
            ),
          ),
          Row(
            children: [
              Expanded(
                  // flex: 2,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.PDF, arguments: {
                          "isFullAccess": controller.book.isFullAccess,
                          "pdfUrl": controller.book.pdfUrl,
                        });
                      },
                      child: const Text("Read").paddingAll(kPadding))),
              kWidth,
              Expanded(
                  flex: 2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary),
                      onPressed: () {
                        Get.toNamed(Routes.BUYBOOK, arguments: {
                          "books": [controller.book]
                        });
                      },
                      child: const Text("Buy Now").paddingAll(kPadding))),
            ],
          ).paddingSymmetric(vertical: kPadding / 2, horizontal: kPadding),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CartController>().cartItems.add(controller.book);

          showSnackBar(
              title: "Cart", description: "Items added to cart successfully");
        },
        child: Icon(
          Icons.shopping_cart,
          color: defaultColorScheme.onPrimary,
        ),
      ),
    );
  }
}
