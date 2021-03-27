import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/checkoutScreen.dart/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, _, __) => CheckOut(),
              ),
            );
          },
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              cart.count.toString(),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
