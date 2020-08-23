import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:bag_product/screens/home/app_bar.dart';
import 'package:bag_product/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[AppBackground(), CustomAppBar(), Body()]),

      // ignore: todo
      //TODO: do something
      // create provider
      // create add to cart
      // add the cart icon to all the detail screen
    );
  }
}
