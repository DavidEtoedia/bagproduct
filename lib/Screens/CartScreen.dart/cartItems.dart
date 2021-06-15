import 'dart:ui';

import 'package:bag_product/Screens/CartScreen.dart/cart_listItem.dart';
import 'package:bag_product/animation/show_up_animation.dart';
import 'package:bag_product/animation/slideTransition.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/backIcon.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/homeIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.90;

    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        body: Stack(
          children: [
            AppBackground(),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Row(
                      children: [BackIcon(), Spacer(), HomeButton()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 250,
                    ),
                    child: Text(
                      'Cart',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w300)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 150, 15, 30),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 170),
                child: Column(
                  children: [
                    cart.basketItems.length == 0
                        ? emptyCart()
                        : Expanded(
                            child: ShowUpAnime(
                              animationDuration: Duration(milliseconds: 550),
                              offset: 0.1,
                              // delayStart: Duration(milliseconds: 10),
                              curve: Curves.fastOutSlowIn,
                              child: ListView.builder(
                                shrinkWrap: false,
                                itemCount: cart.basketItems.length,
                                itemBuilder: (context, index) => CartListItem(
                                    products: cart.basketItems[index]),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: (cart.basketItems.length > 0),
              child: totalPricesheet(cart),
            ),
          ],
        ),
      ),
    );
  }

  totalPricesheet(Cart cart) {
    return Padding(
      padding: const EdgeInsets.only(top: 590, left: 30),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 333,
            color: Color(0xFFC8C8C8),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.numans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    'Total',
                    style: GoogleFonts.numans(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 40,
            width: 333,
            color: Color(0xFFC8C8C8),
          ),
          SizedBox(height: 30),
          Container(
            width: 250,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Complete your order',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // return Positioned(
    //   bottom: -10,
    //   right: 0,
    //   left: 0,
    //   height: 180,
    //   child: Container(
    //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
    //       BoxShadow(
    //           color: Colors.grey.withOpacity(0.1),
    //           spreadRadius: 5,
    //           blurRadius: 10,
    //           offset: Offset(0, -5))
    //     ]),
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 30, right: 30),
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 30,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 'Total Price',
    //                 style: GoogleFonts.nunito(
    //                     fontSize: 22,
    //                     fontWeight: FontWeight.w700,
    //                     color: Colors.black87),
    //               ),
    //               Text(
    //                 cart.totalAmount.toString(),
    //                 style: GoogleFonts.nunito(
    //                     fontSize: 22,
    //                     fontWeight: FontWeight.w700,
    //                     color: Colors.black),
    //               )
    //             ],
    //           ),
    //           SizedBox(height: 30),
    //           InkWell(
    //             onTap: () {
    //               showModalBottomSheet(
    //                   isScrollControlled: true,
    //                   backgroundColor: Colors.transparent,
    //                   context: context,
    //                   builder: (context) => BackdropFilter(
    //                       filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    //                       child: completeOrder()));
    //             },
    //             child: Container(
    //               height: 50,
    //               width: 250,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(30),
    //                   color: Colors.black),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Complete your order',
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.nunito(
    //                           fontSize: 17, color: Colors.white)),
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

//Empty cart
  emptyCart() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 95,
            top: 110,
          ),
          child: ShowUpAnime(
            animationDuration: Duration(milliseconds: 550),
            offset: 0.1,
            curve: Curves.fastOutSlowIn,
            child: Image.asset(
              'assets/images/empty-cart.png',
              height: 150,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120, top: 270),
          child: Text(
            'Cart is empty',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85, top: 310),
          child: Text(
            'Looks like you have no items\n in your shopping cart.',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget completeOrder() => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.6,
        maxChildSize: 0.8,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(left: 3, right: 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel luctus turpis, nec mattis augue. Fusce congue mattis sem tristique varius.s')
            ],
          ),
        ),
      );
}
