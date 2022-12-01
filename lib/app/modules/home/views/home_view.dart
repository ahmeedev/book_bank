// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:book_bank/app/modules/home/views/widgets/home_widgets.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'widgets/settings_widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = Get.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Obx(() => Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAppBar(context),
                        controller.bottomAppBarState['isHome']!
                            ? _buildGridView(context)
                            : SettingsTiles()
                      ],
                    ),
                    Positioned(
                      bottom: 4,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(kPadding * 0.2)
                            .copyWith(bottom: 2),
                        child: Container(
                          padding: EdgeInsets.all(kPadding),
                          color: theme.colorScheme.secondary,
                          width: width,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => controller
                                      .changeBottomAppBarState('isHome'),
                                  child: Container(
                                          color: controller
                                                  .bottomAppBarState['isHome']!
                                              ? theme.colorScheme.onSecondary
                                              : theme.colorScheme.secondary,
                                          padding:
                                              EdgeInsets.all(kPadding / 1.8),
                                          child: Icon(Icons.home))
                                      .cornerRadius(kRadius),
                                ),
                                GestureDetector(
                                  onTap: () => controller
                                      .changeBottomAppBarState('isSetting'),
                                  child: Container(
                                          color: controller.bottomAppBarState[
                                                  'isSetting']!
                                              ? theme.colorScheme.onSecondary
                                              : theme.colorScheme.secondary,
                                          padding:
                                              EdgeInsets.all(kPadding / 1.8),
                                          child: Icon(Icons.settings))
                                      .cornerRadius(kRadius),
                                ),
                              ]),
                        ).cornerRadius(kRadius),
                      ),
                    )
                  ],
                ))));
  }

  Container _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(kPadding),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.bottomAppBarState['isHome']!
                        ? Text(
                            "Welcome to",
                            style: theme.textTheme.labelLarge!
                                .copyWith(color: theme.colorScheme.onPrimary),
                          )
                        : SizedBox(),
                    Text(
                        controller.bottomAppBarState['isHome']!
                            ? controller.appBartitles[0]
                            : controller.appBartitles[1],
                        style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: theme.textTheme.titleLarge!.fontSize! + 4,
                            fontWeight: FontWeight.w900)),
                  ]),
              Spacer(),
              controller.bottomAppBarState['isHome']!
                  ? Stack(
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed(Routes.CART),
                          child: Container(
                              color: theme.colorScheme.surface,
                              padding: EdgeInsets.all(kPadding),
                              child: Icon(
                                Icons.shopping_cart,
                                color: theme.colorScheme.onSurface,
                              )).cornerRadius(kRadius),
                        ),
                        Container(
                          color: theme.colorScheme.onSurface,
                          child: Text(
                            "1",
                            style: theme.textTheme.labelSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ).paddingAll(kPadding * .2),
                        ).cornerRadius(kRadius / 2)
                      ],
                    )
                  : SizedBox(),
              // kWidth,
            ],
          ),
          kHeight,
          controller.bottomAppBarState['isHome']!
              ? TextField(
                  // obscureText: true,

                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.clear_sharp,
                      color: theme.colorScheme.onSurface,
                    ),
                    filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'Search Book',
                    hintStyle: theme.textTheme.labelLarge!
                        .copyWith(color: theme.colorScheme.onSurface),
                    fillColor: theme.colorScheme.surface,
                  ),
                )
              : SizedBox(
                  height: Get.height * 0.2,
                  child: ProfileWidget(),
                )
        ],
      ),
    );
  }

  Expanded _buildGridView(context) {
    return Expanded(
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: kPadding / 2,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(Routes.DETAIL);
                },
                child: HomeViewBook());
          }).paddingAll(kPadding / 2),
    );
  }
}
