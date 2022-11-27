import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Widgets/book_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 100,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "  Hamad Tariq",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "   hamadbintariq4u@gmail.com",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.black,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return const Book();
                }),
          ),
        ],
      ),
    );
  }
}
