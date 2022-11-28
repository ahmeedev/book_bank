import 'package:book_bank/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(kMargin),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShnwU836xth7rKVC1ogwmHXst4prHaoj1mvAMdTT-Zd1u0OfMtngpmDT19LZ0RDNjcPzE&usqp=CAU"),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: kPadding),
          child: Text(
            "Displacement",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Kiku Huges"),
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
        ),
        const Padding(
          padding: EdgeInsets.only(left: kPadding),
          child: Text(
            "\nDiscription",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: kPadding, top: kMargin),
          child: Text(
            "Ini tentang Moza dan ketiga cowok yang tinggal satukompleks dengannya. Ada Eghi, cowok yang Moza sukai. Lalu Dennis, cowok yang menyukai Moza. Juga Ferrish,cowok tukang rusuh. Hidup Moza begitu penuh warnadan kesialan karena ketiganya.Jadi, di antara mereka bertiga, siapa yang dapatmembuat Moza jatuh cinta?",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 2,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kPadding, top: kMargin),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 50,
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8599FF),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kPadding, top: kMargin),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 50,
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8599FF),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.PDF);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.read_more,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Read Book",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
