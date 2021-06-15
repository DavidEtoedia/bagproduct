import 'package:bag_product/logic/ChangeNotifier/Wishlist.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishListButton extends StatelessWidget {
  const WishListButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Wishist wishist = Provider.of<Wishist>(context);
    return GestureDetector(
      onTap: () {
        wishist.insert(product);
        showToast(wishist.message,
            fullWidth: true,
            textStyle: GoogleFonts.nunito(
                fontSize: SizeConfig.safeBlockHorizontal * 4.3,
                color: Colors.white),
            textAlign: TextAlign.center,
            textPadding: EdgeInsets.only(bottom: 10, left: 10, top: 12),
            context: context,
            borderRadius: BorderRadius.circular(0),
            alignment: Alignment.bottomLeft,
            toastHorizontalMargin: (0),
            position:
                StyledToastPosition(align: Alignment.bottomCenter, offset: 0.0),
            backgroundColor: Colors.black,
            animation: StyledToastAnimation.slideFromBottom,
            reverseAnimation: StyledToastAnimation.slideFromBottom,
            startOffset: Offset(0.0, 3.0),
            reverseEndOffset: Offset(0.0, 3.0),
            animDuration: Duration(milliseconds: 400),
            curve: Curves.linearToEaseOut,
            reverseCurve: Curves.decelerate);
      },
      child: Container(
        // margin: EdgeInsets.all(5),
        // padding: EdgeInsets.symmetric(vertical: 6),
        width: SizeConfig.blockSizeHorizontal * 70,
        height: SizeConfig.blockSizeVertical * 6.1,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
        // color: Colors.black.withOpacity(0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add to wishlist",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.favorite,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
