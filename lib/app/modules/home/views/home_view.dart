// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  Widget book() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSl-HrIAbD8078z57m1vMbvw1AQ8SKaKf5v5TObkDEh64g7nu80"),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Color(0xffFF9E00),
                size: 15,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9E00),
                size: 15,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9E00),
                size: 15,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9E00),
                size: 15,
              ),
              Icon(
                Icons.star,
                color: Color(0xffCED4DA),
                size: 15,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Displacement",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text("Kiku Huges"),
          SizedBox(height: 5),
          Text(
            "Rs 800",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffEA4991),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(Icons.menu),
        title: const Text('Book Bank'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(Icons.search),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Flexible(
              flex: 3,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => book(),
              ),
            ),
            Flexible(
              flex: 4,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => book(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
