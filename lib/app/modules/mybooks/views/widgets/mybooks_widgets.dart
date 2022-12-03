import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../theme/app_constants.dart';

class MyBookCard extends StatelessWidget {
  const MyBookCard({Key? key}) : super(key: key);

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
            child: Image.network("https://picsum.photos/180"),
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
                  "Al Chemist",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                // const Spacer(),
                Row(
                  children: [
                    Text(
                      "By: William James",
                      style: theme.textTheme.labelMedium!.copyWith(),
                    ).cornerRadius(kRadius / 2),
                    const Spacer(),
                    Text(
                      "800 Rs.",
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
                  "This book introduce you the story of a man who finds a gold from their he lives" *
                      2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Read Now")),
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
