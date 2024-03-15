import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/screen/rating.dart';

import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../constant.dart';
import '../detail_screen/details_screen.dart';
import '../model/model.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  int currentSelecteditem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return gamingItem(index);
            }),
      ),
    );
  }

  GestureDetector gamingItem(int index) {

    double scale = 1.1;
    Color backGroundeColor = kBackgroundColor;
    Color textColor = kSecondTextColor;
    if (currentSelecteditem == index) {
      scale = 1.35;
      backGroundeColor = kSelectCardBackgroundColor;
      textColor = Colors.white;
    }
    final game = productList[index];
    return GestureDetector(
      onTap: () {
Get.to(()=>DetailsScreen(game: productList[index]));
        if (currentSelecteditem == index) {

        } else {
          setState(() {
            currentSelecteditem = index;
          });
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: 256.5 * scale,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  Container(
                    width: 228 * scale,
                    decoration: BoxDecoration(
                      color: backGroundeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(16, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 7 * scale,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 90),
                                  child: Text(
                                    game.name,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14 * scale,
                                        height: 1.5,
                                        color: textColor),
                                  ),
                                ),
                                SizedBox(height: 7 * scale),
                                const Rating(),
                                SizedBox(height: 7 * scale),
                                Text(
                                  "\$${game.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16 * scale,
                                      color: textColor),
                                ),
                                SizedBox(height: 8 * scale),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(21))),
                            child: SvgPicture.asset(
                              "assets/icons/icon_add_cart.svg",
                              height: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          game.imagePic,
                          height: 75 * scale,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
