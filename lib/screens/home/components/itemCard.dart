import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;

  const Itemcard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),

              // height: 180, we do not need height and width here it was for
              //demonstration. The actual size is found in the grid.
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(image: AssetImage(product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              product.title,
              style: GoogleFonts.nunitoSans(textStyle: TextStyle(fontSize: 20)),
            ),
          ),
          Text(
            "\u20A6${product.price}",
            style: GoogleFonts.nunitoSans(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          )
        ],
      ),
    );
  }
}
