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
              margin: const EdgeInsets.all(kMargin),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://cdn.dribbble.com/users/2985163/screenshots/10367208/media/5b595f284978f5a32b6abe0329ccbc04.png"),
                ),
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
                      "Javeria Afzal",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "javiriaafzaldeme@gmail.com",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          "Rs 800",
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
                      "javiriaafzaldeme@gmail.com" * 100,
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
                        onPressed: () {},
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
