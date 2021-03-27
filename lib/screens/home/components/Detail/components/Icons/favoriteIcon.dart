import 'package:bag_product/logic/ChangeNotifier/Wishlist.dart';
import 'package:bag_product/screens/home/components/Detail/components/WishList/wishlist.dart';
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
      children: [
        IconButton(
          icon: Icon(Icons.favorite_border_outlined),
          onPressed: () {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, _, __) => WishList()));
          },
        ),
        Positioned(
          right: 5,
          top: 5,
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
