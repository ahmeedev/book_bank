import 'package:book_bank/app/modules/home/controllers/settings_controller.dart';
import 'package:book_bank/app/routes/app_pages.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utilities/get_methods.dart';

class ProfileWidget extends GetView<SettingsController> {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/profile.jpeg'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(kPadding).copyWith(top: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                controller.userName.value,
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
              Text(
                controller.userEmail.value,
                style:
                    theme.textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
              const Spacer(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(children: [
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                  kWidth,
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                  kWidth,
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                ]),
              )
            ]),
          ),
        )
      ],
    ).cornerRadius(kRadius);
  }
}

class SettingsTiles extends GetView<SettingsController> {
  const SettingsTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Obx(() => Container(
            // padding: const EdgeInsets.symmetric(vertical: kPadding),
            color: theme.colorScheme.background,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildTile(theme, name: "My Books", icon: Icons.book,
                    onTap: () async {
                  Get.toNamed(Routes.MYBOOKS);
                }),
                _buildTile(theme,
                    name: "Your History", icon: Icons.history, onTap: () {}),
                controller.isSingIn.value
                    ? _buildTile(theme, name: "Sign out", icon: Icons.person,
                        onTap: () {
                        // Get.toNamed(Routes.SIGNIN);
                        FirebaseAuth.instance.signOut();
                        showSnackBar(
                            title: "Auth",
                            description: "Sign out Successfully");
                      })
                    : _buildTile(theme, name: "Sign in", icon: Icons.person,
                        onTap: () {
                        Get.toNamed(Routes.SIGNIN);
                      }),
              ],
            ),
          )),
    );
  }

  InkWell _buildTile(ThemeData theme,
      {required String name, required IconData icon, required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        // color: theme.colorScheme.onSurface,
        child: ListTile(
          leading: Icon(
            icon,
            color: theme.colorScheme.primary,
          ),
          title: Text(
            name,
            style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
