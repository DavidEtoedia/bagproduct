import 'package:badges/badges.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/checkoutScreen.dart/checkOut.dart';
import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final Product products;

  const CustomAppBar({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of(context);
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
                    Badge(
                      position: BadgePosition(top: 0, right: 3),
                      shape: BadgeShape.circle,
                      badgeColor: Colors.red,
                      badgeContent: Text(
                        cart.count.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),
                                pageBuilder: (context, _, __) => CheckOut())),
                      ),
                    ),
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
