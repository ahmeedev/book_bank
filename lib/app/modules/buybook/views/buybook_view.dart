import 'package:book_bank/app/modules/home/controllers/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
import '../../../theme/colors.dart';
import '../controllers/buybook_controller.dart';

class BuybookView extends GetView<BuybookController> {
  const BuybookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buy Books'),
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.buyingItems.length,
              // padding: const EdgeInsets.symmetric(vertical: kPadding),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: Get.height * 0.2,
                        child: Image.network(
                          controller.buyingItems[index].imageUrl,
                        ).paddingAll(4),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kHeightH,
                            Container(
                              color: defaultColorScheme.primary,
                              child: Text(controller.buyingItems[index].name,
                                      textAlign: TextAlign.justify,
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w900,
                                              color:
                                                  defaultColorScheme.onPrimary))
                                  .paddingAll(kPadding / 2),
                            ),
                            kHeight,
                            Text(controller.buyingItems[index].description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: theme.textTheme.labelLarge!),
                            kHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "By: ${controller.buyingItems[index].authur}",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    style: theme.textTheme.labelLarge!
                                        .copyWith(fontWeight: FontWeight.w900)),
                                Text(
                                    'Rs. ${controller.buyingItems[index].price}',
                                    textAlign: TextAlign.justify,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: defaultColorScheme.primary)),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: kPadding / 2),
                      ),

                      // Text("Rs. ${controller.buyingItems[index].price}",
                      //     style: theme.textTheme.titleMedium!.copyWith(
                      //         color: defaultColorScheme.primary,
                      //         fontWeight: FontWeight.w900)),
                    ]));
              },
            ).paddingAll(kPadding),
          ),
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Buyer Email: ",
                        style: theme.textTheme.labelLarge!.copyWith(
                            color: defaultColorScheme.primary,
                            fontWeight: FontWeight.w900)),
                    Text(Get.find<SettingsController>().userEmail.value,
                        style: theme.textTheme.labelLarge!.copyWith(
                            // color: defaultColorScheme.primary,
                            fontWeight: FontWeight.w900)),
                  ],
                ).paddingSymmetric(horizontal: kPadding, vertical: 4),
                Row(children: [
                  Text("Total Price",
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: defaultColorScheme.primary,
                          fontWeight: FontWeight.w900)),
                  const Spacer(),
                  FutureBuilder(
                      future: controller.calculateTotalPrices(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return Text("Rs. ${snapshot.data}",
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w900));
                          } else {
                            return Text("Rs. 0",
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w900));
                          }
                        }
                        return const CircularProgressIndicator();
                      }),
                ]).paddingSymmetric(horizontal: kPadding),
                kHeight,
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Buy All").paddingAll(kPadding + 4)),
              ],
            ),
          )
        ]));
  }
}
