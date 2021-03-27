import 'package:after_layout/after_layout.dart';
import 'package:badges/badges.dart';
import 'package:bag_product/logic/ChangeNotifier/Wishlist.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/checkoutScreen.dart/checkOut.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/components/Detail/components/FadeInText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:provider/provider.dart';

import 'Icons/cartIcon.dart';
import 'Icons/favoriteIcon.dart';
import 'buttons/addCartBttn.dart';
import 'buttons/wishListBttn.dart';

class BottomSlide extends StatefulWidget {
  // final double _expandedBottomSheetBottomPosition = 0;
  final double _collaspedBottomSheetBottomPosition = -200;
  // final double _completecollapsedBottomSheetBottomPosition = -600;

  final Product product;

  const BottomSlide({Key key, this.product}) : super(key: key);

  @override
  _BottomSlideState createState() => _BottomSlideState();
}

class _BottomSlideState extends State<BottomSlide>
    with AfterLayoutMixin<BottomSlide> {
  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;
  final badges = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 5,
            left: 15,
            bottom: 10,
            top: 60,
          ),
          //Close button `
          child: Row(
            children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                  // setState(() {
                  //   _bottomSheetBottomPosition =
                  //       widget._completecollapsedBottomSheetBottomPosition;
                  // });
                },
              ),
              Spacer(),
              Container(
                width: 100,
                child: Row(
                  children: <Widget>[
                    FavoriteIcon(),
                    CartIcon(),
                  ],
                ),
              ),
            ],
          ),
        ),

        //buttom sheet
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          left: 0,
          right: 0,
          bottom: _bottomSheetBottomPosition,
          child: Column(
            children: [
              FadeIn(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: Container(
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, left: 20, right: 20),
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: <Widget>[
                      FadeInText(
                        product: widget.product,
                      ),
                      AddToCartButton(
                        products: widget.product,
                      ),
                      WishListButton(
                        product: widget.product,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      isCollapsed = true;
      _bottomSheetBottomPosition = widget._collaspedBottomSheetBottomPosition;
    });
  }
}
