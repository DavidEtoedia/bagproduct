import 'package:bag_product/logic/cart.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:bag_product/products/products.dart';
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
    final cart = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              cart.add(products);
              showToast("item has been added to cart",
                  fullWidth: true,
                  textStyle:
                      GoogleFonts.nunito(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                  textPadding: EdgeInsets.only(bottom: 10, left: 10, top: 12),
                  context: context,
                  borderRadius: BorderRadius.circular(0),
                  alignment: Alignment.bottomLeft,
                  toastHorizontalMargin: (0),
                  position: StyledToastPosition(
                      align: Alignment.bottomCenter, offset: 0.0),
                  backgroundColor: Colors.black87,
                  animation: StyledToastAnimation.slideFromBottom,
                  reverseAnimation: StyledToastAnimation.slideFromBottom,
                  startOffset: Offset(0.0, 3.0),
                  reverseEndOffset: Offset(0.0, 3.0),
                  animDuration: Duration(milliseconds: 400),
                  curve: Curves.linearToEaseOut,
                  reverseCurve: Curves.decelerate);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 100, right: 5, top: 15),
              width: 300,
              height: 50,
              color: Colors.black.withOpacity(0.9),
              child: Text(
                "Add to Cart",
                style: GoogleFonts.nunitoSans(
                  fontSize: 17,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
