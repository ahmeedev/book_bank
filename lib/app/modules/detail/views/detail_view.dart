import 'package:book_bank/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
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
                    image: NetworkImage(controller.book.image)),
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
                    child: ElevatedButton(
                        onPressed: () {
                          Get.find<CartController>()
                              .cartItems
                              .add(controller.book);

                          showSnackBar(
                              title: "Cart",
                              description: "Items added to cart successfully");
                        },
                        child: const Text("Add to cart").paddingAll(kPadding))),
                kWidth,
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Buy Now").paddingAll(kPadding))),
              ],
            ).paddingSymmetric(horizontal: kPadding, vertical: kPadding / 2),
          ],
        ));
  }
}
