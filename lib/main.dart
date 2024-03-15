import 'package:flutter/cupertino.dart';
import 'package:gaming_shop_ui/screen/home_screen.dart';

import 'package:get/get.dart';

void main(){
  runApp(const MyApps());
}
class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen() ,
    );
  }
}
