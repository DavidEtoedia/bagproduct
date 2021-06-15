import 'package:bag_product/products/products.dart';
import 'package:flutter/widgets.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];
  // final List<Product> _wishlist = [];

  // UnmodifiableListView<Product> get product => UnmodifiableListView(_products);
  int _totalAmount = 0;

  void add(Product products) {
    bool isPresent = false;
    if (_products.contains(products)) {
      increaseQuantity(products);
      isPresent = true;
      if (!isPresent) {
        _products.remove(products);
      }
    } else
      _products.insert(0, products);

    notifyListeners();
  }

// Increase and decrease item quantity
  void increaseQuantity(Product products) {
    _totalAmount += products.price;
    products.incrementQuantity();

    notifyListeners();
  }

  void decreaseQuantity(Product products) {
    _totalAmount -= products.price;
    products.decrementQuantity();
    notifyListeners();
  }

// remove from list
  void removeFromList(Product products) {
    products.clearQuantity();
    _products.remove(products);

    notifyListeners();
  }

  // void clearQuantity(Product product) {
  //   products.clear();
  // }

  // List<Product> removeFromList(Product product) {
  //   _products.remove(product);
  // }

  // void remove(Product products) {
  //   _products.remove(products);
  //   notifyListeners();
  // }

  int get count {
    return _products.length;
  }

  // double get totalPrice {
  //   return _totalPrice;
  // }

  List<Product> get basketItems {
    return _products;
  }

  int get totalAmount {
    int _totalAmount = 0;
    _products
        .forEach((product) => _totalAmount += product.price * product.quantity);

    return _totalAmount;
  }

// it is rebuilding anytime i go to checkOut page

  // int get totalAmount {
  //   for (int i = 0; i < _products.length; i++) {
  //     _totalAmount = _totalAmount + _products[i].price;
  //   }

  //   return _totalAmount;
  // }

  // if (_products.length > 0) {
  //   for (int i = 0; i < _products.length; i++) {
  //     if (_products[i].id == products.id) {
  //       increaseQuantity(products);
  //       isPresent = true;
  //       break;
  //     } else {
  //       isPresent = false;
  //     }
  //   }
  //   if (!isPresent) {
  //     _products.add(products);
  //   }
  // } else {
  //   _products.insert(0, products);
  // }

}
