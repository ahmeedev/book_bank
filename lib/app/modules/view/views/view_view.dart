// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/view_controller.dart';

class ViewView extends StatefulWidget {
  ViewView({Key? key}) : super(key: key);

  @override
  State<ViewView> createState() => _ViewViewState();
}

class _ViewViewState extends State<ViewView> {
  var pageIdx = 0;
  var pageIndex = [
    HomeView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIdx = index;
          });
        },
        selectedItemColor: Color(0xff8599FF),
        unselectedItemColor: Color(0xff959CB0),

        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pageIndex[pageIdx],
    );
  }
}
