import 'package:bag_product/logic/ChangeNotifier/Wishlist.dart';
import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:bag_product/screens/home/components/Detail/components/WishList/wishListitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Wishist>(
        builder: (context, wishist, child) => Scaffold(
                body: Stack(
              children: [
                AppBackground(),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
                  child: Container(
                    // padding: const EdgeInsets.fromLTRB(15, 170, 15, 0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: wishist.wishListItem.length,
                              itemBuilder: (context, index) => WishListItem(
                                    products: wishist.wishListItem[index],
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));

    // return Container(
    //   color: Colors.blue[100],
    //   child: Column(children:
    //   <Widget>[
    //     ListView.builder(itemCount: cart.basketItems.length,
    //     itemBuilder: (context, index)=> CartListItem(products: cart.basketItems[index],),
    //     )

    //   ]
    //   )

    // );
  }
}
