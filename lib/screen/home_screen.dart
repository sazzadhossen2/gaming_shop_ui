import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/screen/productList.dart';

import 'package:svg_flutter/svg.dart';

import '../constant.dart';
import 'my_button_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> category = [
    "Controller",
    "Headsets",
    "keyboards",
    "VR Accessories"
  ];
  int currentSelectItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyButtonScreen(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///for menu search
          myAppbarItem(),

          ///for well come text
          wellcomeText(),
//SizedBox(height: 35,),
          ///list of item
          SizedBox(
            height: 35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: currentSelectItem == index
                                    ? kSecondaryColor
                                    : kSecondTextColor),
                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              height: 3,
                              width: 50,
                              color:  currentSelectItem == index
                                  ? kSecondaryColor
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),

          const Productlist()
        ],
      ),
    );
  }

  Padding wellcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Text(
        "Wellcome to\nplaystation Accessories",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding myAppbarItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/icon_menu.svg"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/icon_search.svg"))
        ],
      ),
    );
  }
}
