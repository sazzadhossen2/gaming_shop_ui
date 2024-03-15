import 'package:flutter/material.dart';


import '../constant.dart';
import '../model/model.dart';
import '../screen/rating.dart';
import 'image_size.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.game});

  final Product game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSelectCardBackgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  color: kSelectCardBackgroundColor,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        game.imagePic,
                        height: 220,
                        width: 330,
                      ),
                    ))
              ],
            ),
          ),
          const ImageSize(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              game.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Rating(),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Displays info about all gamepads connected to your computer. Check buttons, joystick axes, drift, and more. Works with all controllers and joysticks in a ...",
              style: TextStyle(fontSize: 18, color: kSecondTextColor),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${game.price}",
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
