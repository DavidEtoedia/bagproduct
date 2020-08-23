import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;

  const ProductTitleWithImage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Aristocrate Hand bag',
            style: GoogleFonts.numans(fontSize: 15),
          ),
          Text(
            product.title,
            style:
                GoogleFonts.nunito(fontSize: 37, fontWeight: FontWeight.w600),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Price\n",
                        style: GoogleFonts.nunito(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: "\$${product.price}",
                        style: GoogleFonts.nunito(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ]),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Image.asset(
                  product.image,
                  height: 250,
                  width: 250,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
