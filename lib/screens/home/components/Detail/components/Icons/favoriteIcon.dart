import 'package:bag_product/Screens/WishList/wishlist.dart';
import 'package:bag_product/logic/ChangeNotifier/Wishlist.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Wishist wishist = Provider.of<Wishist>(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          child: Icon(
            Icons.favorite_border_outlined,
            size: SizeConfig.blockSizeHorizontal * 6.5,
          ),
          onTap: () {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, _, __) => WishList()));
          },
        ),
        Positioned(
          right: -5,
          top: -7,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              wishist.count.toString(),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
