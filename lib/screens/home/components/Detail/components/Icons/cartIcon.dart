import 'package:bag_product/Screens/CartScreen.dart/cartItems.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/responsiveness/size_config.dart';
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
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CartItem(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(1.0, 0.0), end: Offset.zero)
                          .animate(animation),
                      child: child);
                },
              ),
            );
          },
          child: Icon(
            Icons.shopping_cart_outlined,
            size: SizeConfig.blockSizeHorizontal * 6.5,
          ),
        ),
        // IconButton(
        //   icon: Icon(
        //     Icons.shopping_cart_outlined,
        //     size: 35,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       PageRouteBuilder(
        //         pageBuilder: (context, _, __) => CheckOut(),
        //       ),
        //     );
        //   },
        // ),
        Positioned(
          right: -6,
          top: -10,
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
