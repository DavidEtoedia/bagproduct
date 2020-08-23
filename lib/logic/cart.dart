import 'package:bag_product/products/products.dart';
import 'package:flutter/widgets.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];

  // UnmodifiableListView<Product> get product => UnmodifiableListView(_products);
  double _totalPrice = 0.0;

  void add(Product products) {
    _products.add(products);
    _totalPrice += products.price;
    notifyListeners();
  }

  void remove(Product products, {product}) {
    _totalPrice -= products.price;
    _products.remove(products);
    notifyListeners();
  }

  int get count {
    return _products.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Product> get basketItems {
    return _products;
  }
}
