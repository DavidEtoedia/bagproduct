import 'package:bag_product/products/products.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class Wishist extends ChangeNotifier {
  final List<Product> _wishlist = [];
  String message;

  void insert(Product product) {
    if (_wishlist.contains(product)) {
      message = 'item already exist';
    } else {
      _wishlist.add(product);
      message = 'item has been added';
    }

    notifyListeners();
  }

  int get count {
    return _wishlist.length;
  }

  List<Product> get wishListItem {
    return _wishlist;
  }
}
