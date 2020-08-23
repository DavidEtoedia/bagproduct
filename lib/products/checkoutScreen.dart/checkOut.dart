import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        body: Stack(
          children: [
            AppBackground(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  'Check Out',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 40, 25, 0),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) =>
                            CartListItem(products: cart.basketItems[index]),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final Product products;

  const CartListItem({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ItemContent(product: products),
    );
  }
}

class ItemContent extends StatelessWidget {
  final Product product;

  const ItemContent({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            product.image,
            fit: BoxFit.fitHeight,
            height: 40,
            width: 50,
          ),
        )
      ],
    ));
  }
}
