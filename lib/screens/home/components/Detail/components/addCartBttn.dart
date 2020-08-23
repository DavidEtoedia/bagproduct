import 'package:bag_product/logic/cart.dart';

import 'package:bag_product/products/products.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  final Product products;
  const AddToCartButton({
    Key key,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 250,
              child: FlatButton(
                color: products.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  cart.add(products);

                  print(products.title);
                  Flushbar(
                    margin: EdgeInsets.all(8),
                    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    ),
                    duration: Duration(milliseconds: 900),
                    message: 'item has been added to cart',
                  ).show(context);
                },
                child: Text('Add to cart',
                    style:
                        GoogleFonts.nunito(fontSize: 17, color: products.txt)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
