import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class Book extends StatelessWidget {
  const Book({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL);
            },
            child: Container(
              width: 150,
              height: 210,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSl-HrIAbD8078z57m1vMbvw1AQ8SKaKf5v5TObkDEh64g7nu80"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
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
          const SizedBox(height: 10),
          const Text(
            "Displacement",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text("Kiku Huges"),
          const SizedBox(height: 5),
          const Text(
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
}
