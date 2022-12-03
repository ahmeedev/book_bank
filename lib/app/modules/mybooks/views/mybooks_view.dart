import 'package:book_bank/app/modules/mybooks/views/widgets/mybooks_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
import '../controllers/mybooks_controller.dart';

class MybooksView extends GetView<MybooksController> {
  const MybooksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Books'),
          centerTitle: true,
        ),
        body: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 2.1,
              crossAxisSpacing: 10,
              mainAxisSpacing: kPadding / 2,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                  onTap: () {
                    // FocusScope.of(context).unfocus();
                    // Get.toNamed(Routes.DETAIL);
                  },
                  child: const MyBookCard());
            }).paddingAll(kPadding / 2));
  }
}
