import 'package:bag_product/animation/show_up_animation.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;
  final double heightfactor = 0.67;

  const ProductTitleWithImage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10 * SizeConfig.safeBlockVertical,
                horizontal: SizeConfig.safeBlockHorizontal * 4.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: SizeConfig.blockSizeHorizontal * 12.8,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 25.0,
                    horizontal: SizeConfig.blockSizeHorizontal * 6.9),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Price\n',
                        style: GoogleFonts.montserrat(
                            fontSize: SizeConfig.safeBlockHorizontal * 6.1,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      // TextSpan(text: ' \n'),
                      TextSpan(
                        text: '\u20A6${product.price}',
                        style: GoogleFonts.montserrat(
                            fontSize: SizeConfig.safeBlockHorizontal * 8.7,
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 23 * SizeConfig.blockSizeVertical, left: 200),
                      child: ShowUpAnime(
                        delayStart: Duration(milliseconds: 0),
                        animationDuration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Image.asset(
                          product.image,
                          height: 60 * SizeConfig.blockSizeHorizontal,
                          width: 28 * SizeConfig.blockSizeVertical,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.only(top: 150, left: 20),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         'Aristocrate Hand bag',
    //         style: GoogleFonts.numans(fontSize: 15),
    //       ),
    //       Text(
    //         product.title,
    //         style:
    //             GoogleFonts.nunito(fontSize: 37, fontWeight: FontWeight.w600),
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Padding(
    //             padding: const EdgeInsets.only(top: 35),
    //             child: RichText(
    //               text: TextSpan(children: [
    //                 TextSpan(
    //                     text: "Price\n",
    //                     style: GoogleFonts.nunito(
    //                         fontSize: 17, fontWeight: FontWeight.w400)),
    //                 TextSpan(
    //                     text: "\$${product.price}",
    //                     style: GoogleFonts.nunito(
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.w600,
    //                         color: Colors.black)),
    //               ]),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Expanded(
    //             child: ShakeTransition(
    //               axis: Axis.vertical,
    //               child: Hero(
    //                 tag: "${product.id}",
    //                 child: PageView.builder(
    //                     itemCount: products.length,
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (context, index) {
    //                       return Image.asset(
    //                         product.image,
    //                         height: 250,
    //                         width: 250,
    //                       );
    //                     }),
    //               ),
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
