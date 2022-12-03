import 'package:book_bank/app/theme/app_constants.dart';
import 'package:book_bank/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('CartView'),
          centerTitle: true,
        ),
        body: Obx(() => controller.cartItems.isEmpty
            ? const Center(child: Text("No Items in cart Yet"))
            : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    // padding: const EdgeInsets.symmetric(vertical: kPadding),
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          if (controller.cartItems.length == 1) {
                            controller.cartItems.value = [];
                          } else {
                            controller.cartItems.removeAt(index);
                          }
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                              controller.cartItems[index].image,
                            ).paddingAll(4),
                            title: Text(
                              controller.cartItems[index].name,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                            subtitle: Text(
                                controller.cartItems[index].description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: theme.textTheme.labelLarge!),
                            trailing: Text(
                                "Rs. ${controller.cartItems[index].price}",
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: defaultColorScheme.primary,
                                    fontWeight: FontWeight.w900)),
                            contentPadding: const EdgeInsets.all(8),
                          ).paddingSymmetric(vertical: kPadding / 2),
                        ),
                      );
                    },
                  ).paddingAll(kPadding),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Text("Total Price",
                            style: theme.textTheme.titleMedium!.copyWith(
                                color: defaultColorScheme.primary,
                                fontWeight: FontWeight.w900)),
                        const Spacer(),
                        Text("Rs. ${controller.totalPrice.value}",
                            style: theme.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w900)),
                      ]).paddingSymmetric(horizontal: kPadding),
                      kHeight,
                      ElevatedButton(
                          onPressed: () {},
                          child:
                              const Text("Shop All").paddingAll(kPadding + 4)),
                    ],
                  ),
                )
              ])));
  }
}
