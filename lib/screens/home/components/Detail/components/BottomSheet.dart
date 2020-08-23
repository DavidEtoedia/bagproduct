import 'package:after_layout/after_layout.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/components/Detail/components/FadeInText.dart';
import 'package:bag_product/screens/home/components/Detail/components/addCartBttn.dart';
import 'package:flutter/material.dart';

class BottomSlide extends StatefulWidget {
  final double _expandedBottomSheetBottomPosition = 0;
  final double _collaspedBottomSheetBottomPosition = -200;
  final double _completecollapsedBottomSheetBottomPosition = -600;

  final Product product;

  const BottomSlide({Key key, this.product}) : super(key: key);

  @override
  _BottomSlideState createState() => _BottomSlideState();
}

class _BottomSlideState extends State<BottomSlide>
    with AfterLayoutMixin<BottomSlide> {
  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 5),
          //Close
          child: IconButton(
              icon: Icon(Icons.close),
              iconSize: 30,
              onPressed: () {
                // setState(() {
                //   _bottomSheetBottomPosition =
                //       widget._completecollapsedBottomSheetBottomPosition;
                // });
                Navigator.pop(context);
              }),
        ),

        //buttom sheet
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          left: 0,
          right: 0,
          bottom: _bottomSheetBottomPosition,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: size.height * 0.12, left: 20, right: 20),
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
                  ],
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
