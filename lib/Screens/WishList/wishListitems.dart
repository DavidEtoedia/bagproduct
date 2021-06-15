import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';

import 'WishListContent.dart';

class WishListItem extends StatelessWidget {
  final Product products;
  const WishListItem({
    Key key,
    this.products,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      margin: EdgeInsets.only(bottom: 40),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: WishListContent(
        products: products,
      ),
    );
  }
}
