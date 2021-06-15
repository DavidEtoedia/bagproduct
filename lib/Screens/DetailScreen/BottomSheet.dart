import 'package:after_layout/after_layout.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:bag_product/screens/home/components/Detail/components/FadeInText.dart';
import 'package:bag_product/Screens/DetailScreen/detailScreen_appbar.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/StarDisplay.dart';
import 'package:bag_product/screens/home/components/buttons/addCartBttn.dart';
import 'package:bag_product/screens/home/components/buttons/wishListBttn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:provider/provider.dart';

class BottomSlide extends StatefulWidget {
  // final double _expandedBottomSheetBottomPosition = 0;
  final double _collaspedBottomSheetBottomPosition =
      SizeConfig.blockSizeVertical * -24.6;
  // final double _completecollapsedBottomSheetBottomPosition = -600;

  final Product product;

  BottomSlide({Key key, this.product}) : super(key: key);

  @override
  _BottomSlideState createState() => _BottomSlideState();
}

class _BottomSlideState extends State<BottomSlide>
    with AfterLayoutMixin<BottomSlide> {
  double _bottomSheetBottomPosition = SizeConfig.blockSizeVertical * -40.3;
  bool isCollapsed = false;
  final badges = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    debugPrint(MediaQuery.of(context).size.height.toString());
    // Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        DetailScreenAppBar(),

        //buttom sheet
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          left: 0,
          right: 0,
          // bottom: SizeConfig.safeBlockVertical * -27.0,
          bottom: _bottomSheetBottomPosition,
          child: FadeIn(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            child: Container(
              height: SizeConfig.blockSizeVertical * 75.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: SizeConfig.blockSizeVertical * 7),
                  StatefulStarRating(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.7),
                  FadeInText(
                    product: widget.product,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 5),
                  AddToCartButton(
                    products: widget.product,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
                  WishListButton(
                    product: widget.product,
                  ),
                ],
              ),
            ),
            // child: Container(
            //   // padding: EdgeInsets.only(
            //   //     // top: SizeConfig.safeBlockVertical * 5,
            //   //     left: 20,
            //   //     right: 20)
            //   height: 450,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(30),
            //           topRight: Radius.circular(30))),
            //   child: Column(
            //     children: <Widget>[
            //       // FadeInText(
            //       //   product: widget.product,
            //       // ),
            //       AddToCartButton(
            //         products: widget.product,
            //       ),
            //       WishListButton(
            //         product: widget.product,
            //       ),
            //     ],
            //   ),
            // ),
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
