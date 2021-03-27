import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListContent extends StatelessWidget {
  final Product products;
  const WishListContent({
    Key key,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    products.image,
                    fit: BoxFit.fitHeight,
                    height: 80,
                    width: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    products.title,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
