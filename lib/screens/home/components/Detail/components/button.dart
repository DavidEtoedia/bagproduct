import 'package:bag_product/products/products.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Flatbttn extends StatelessWidget {
  final Product products;

  const Flatbttn({Key key, this.products}) : super(key: key);
  @override
  Widget build(
    BuildContext context,
  ) {
    final cart = Provider.of(context);
    return FlatButton(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed: () {
        cart.add(products);
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
          style: GoogleFonts.nunito(fontSize: 17, color: Colors.white)),
    );
  }
}
