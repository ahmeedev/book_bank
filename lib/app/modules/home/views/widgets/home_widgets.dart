import 'package:book_bank/app/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeViewBook extends StatelessWidget {
  final String name;
  final String descirption;
  final int price;
  final String image;
  final String authur;
  const HomeViewBook({
    Key? key,
    required this.name,
    required this.descirption,
    required this.price,
    required this.image,
    required this.authur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = Get.width;
    final height = Get.height;
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: height * 0.28,
          width: width * 0.5,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(image),
          ),
        ),
        kHeightH,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(kPadding / 2).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                // const Spacer(),
                Row(
                  children: [
                    Text(
                      "By: $authur",
                      style: theme.textTheme.labelMedium!.copyWith(),
                    ).cornerRadius(kRadius / 2),
                    const Spacer(),
                    Text(
                      "Rs. $price",
                      style: theme.textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.primary),
                    ).cornerRadius(kRadius / 2),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                kHeightH,
                Text(
                  descirption,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Shop Now")),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
