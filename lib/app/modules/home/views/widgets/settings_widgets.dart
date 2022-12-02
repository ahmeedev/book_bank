import 'package:book_bank/app/modules/home/controllers/settings_controller.dart';
import 'package:book_bank/app/routes/app_pages.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileWidget extends StatelessWidget {
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
                "Javeria Afzal",
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
              Text(
                "javiriaafzaldeme@gmail.com",
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
                _buildTile(theme, name: "Your Books", icon: Icons.book,
                    onTap: () async {
                  print(FirebaseAuth.instance.currentUser!.uid);
                  final db = FirebaseFirestore.instance;
                  // await db.collection('books').add({"Key": 1234});
                  // final result = await db.collection("books").doc().set({
                  //   "AlChemist": {
                  //     "price": 950,
                  //     "writer": "Arthur Morgan",
                  //     "description": "This book tells you" * 10,
                  //     "image":
                  //         "https://images-na.ssl-images-amazon.com/images/I/51Zy9ZQZQlL._SX331_BO1,204,203,200_.jpg",
                  //   }
                  // }).then((value) => logger.i("Book Added Successfully"),
                  //     onError: (error) =>
                  //         logger.e("Error adding book: $error"));
                }),
                _buildTile(theme,
                    name: "Your History", icon: Icons.history, onTap: () {}),
                controller.isSingIn.value
                    ? _buildTile(theme, name: "Sign out", icon: Icons.person,
                        onTap: () {
                        // Get.toNamed(Routes.SIGNIN);
                        FirebaseAuth.instance.signOut();
                      })
                    : _buildTile(theme, name: "Sign in", icon: Icons.person,
                        onTap: () {
                        Get.toNamed(Routes.SIGNIN);
                      }),
                ElevatedButton(
                    onPressed: () async {
                      print(FirebaseAuth.instance.currentUser!.uid);
                      final db = FirebaseFirestore.instance;
                      // Create a new user with a first and last name
                      final user = <String, dynamic>{
                        "first": "Ada",
                        "last": "Lovelace",
                        "born": 1815
                      };

// Add a new document with a generated ID
                      db.collection("users").add(user).then((DocumentReference
                              doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                    },
                    child: const Text("teting"))
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
