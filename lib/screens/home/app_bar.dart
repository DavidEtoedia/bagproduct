import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/cartIcon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Product products;

  const CustomAppBar({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              Container(
                width: 100,
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    CartIcon()
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
