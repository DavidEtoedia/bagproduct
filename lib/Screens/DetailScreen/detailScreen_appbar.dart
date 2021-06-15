import 'package:bag_product/products/products.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/cartIcon.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/favoriteIcon.dart';
import 'package:flutter/material.dart';

class DetailScreenAppBar extends StatelessWidget {
  final Product products;

  const DetailScreenAppBar({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3.5,
            vertical: SizeConfig.blockSizeVertical * 2.0),
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: SizeConfig.safeBlockVertical * 3.2,
            //       left: SizeConfig.safeBlockHorizontal * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // setState(() {
                    //   _bottomSheetBottomPosition =
                    //       widget._completecollapsedBottomSheetBottomPosition;
                    // });
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: SizeConfig.blockSizeHorizontal * 6.5,
                  ),
                ),
                // ),
                Row(
                  children: <Widget>[
                    FavoriteIcon(),
                    // IconButton(
                    //     icon: Icon(
                    //       Icons.search,
                    //       size: 30,
                    //     ),
                    //     onPressed: () {}),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2.8,
                    ),
                    CartIcon()
                  ],
                ),
              ],
            ),
            // )
          ],
        ),
      ),
    );
  }
}
