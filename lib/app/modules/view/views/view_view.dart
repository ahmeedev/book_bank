// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:book_bank/app/modules/view/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewView extends GetView<ViewController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          labelColor: Color(0xff8599FF),
          unselectedLabelColor: Color(0xff959CB0),
          indicatorColor: Color(0xff8599FF),
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home,
              ),
              text: "Home",
            ),
            Tab(
              icon: Icon(
                Icons.shopping_cart,
              ),
              text: "Cart",
            ),
            Tab(
              icon: Icon(
                Icons.person,
              ),
              text: "Profile",
            ),
          ],
        ),
        body: TabBarView(children: controller.pageIndex),
      ),
    );
  }
}
