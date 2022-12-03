import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme/app_constants.dart';
import '../../../home/models/book_model.dart';

class MyBookCard extends StatelessWidget {
  final MyBook book;

  const MyBookCard({
    Key? key,
    required this.book,
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
            child: Image.network(book.image),
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
                  book.name,
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                // const Spacer(),
                Row(
                  children: [
                    Text(
                      book.authur,
                      style: theme.textTheme.labelMedium!.copyWith(),
                    ).cornerRadius(kRadius / 2),
                    const Spacer(),
                    Text(
                      "Rs. ${book.price}",
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
                  book.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.PDF);
                        },
                        child: const Text("Read Now")),
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
