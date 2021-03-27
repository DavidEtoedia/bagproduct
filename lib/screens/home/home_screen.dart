import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:bag_product/screens/home/Tabs.dart';
import 'package:bag_product/screens/home/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onSetting;

  HomeScreen({Key key, this.onSetting}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        AppBackground(),
        CustomAppBar(),

        Tabs(),
        // Tabs(controller: controller)
      ]),

      // ignore: todo
      //TODO: do something
      // THE CLOSED BUTTON IS FOUND IN BOTTOM SHEET
      // create provider (done)
      // create add to cart (done)
      // add the cart icon to all the detail screen(done)
      // add animation to the cart content
      // create slide to delete (done)
      // create rate star
      // make the app responsive
      // let newly selected item be at the top(done).
      // Create add to wishlist screen(done)
      // create summation for checkout page
      // put the bags in the tab view(done)
      // create pageview scroll for products(done in another app)
    );
  }
}
