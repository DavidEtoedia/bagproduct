import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final Product product;

  const CustomNavBar({Key key, this.product}) : super(key: key);
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .85,
          right: 20.0,
          left: 20.0),
      child: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white70,
          elevation: 4.0,
        ),
      ),
    );
  }
}
