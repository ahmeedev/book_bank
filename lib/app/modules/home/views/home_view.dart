// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:book_bank/app/modules/home/views/widgets/home_widgets.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        _buildAppBar(context, theme),
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: kPadding,
                mainAxisSpacing: kPadding,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return HomeViewBook();
              }).paddingAll(kPadding / 2),
        )
      ],
    )));
  }

  Container _buildAppBar(BuildContext context, ThemeData theme) {
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
                    Text(
                      "Welcome to",
                      style: theme.textTheme.labelLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                    Text("Book Bank",
                        style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: theme.textTheme.titleLarge!.fontSize! + 4,
                            fontWeight: FontWeight.w900)),
                  ]),
              Spacer(),
              Stack(
                children: [
                  Container(
                      color: theme.colorScheme.surface,
                      padding: EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.shopping_cart,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                  Container(
                    color: theme.colorScheme.onSurface,
                    child: Text(
                      "1",
                      style: theme.textTheme.labelSmall!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ).paddingAll(kPadding * .2),
                  ).cornerRadius(kRadius / 2)
                ],
              ),
              // kWidth,
            ],
          ),
          kHeight,
          TextField(
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
        ],
      ),
    );
  }
}
