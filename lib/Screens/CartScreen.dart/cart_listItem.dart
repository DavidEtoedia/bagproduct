import 'package:bag_product/Screens/CartScreen.dart/cart_content.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final Product products;

  const CartListItem({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          color: Colors.red,
        ),
      ),

      // ignore: missing_return
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text('Delete item?'),
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cart.removeFromList(products);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                );
              });

          return res;
        } else {
          //todo later

        }
      },
      child: Container(
        color: Colors.transparent,
        height: 100,
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        padding: EdgeInsets.only(
          right: 5,
          left: 5,
        ),
        child: ItemContent(product: products),
      ),
    );
  }
}
