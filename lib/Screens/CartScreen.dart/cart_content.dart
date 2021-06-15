import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemContent extends StatelessWidget {
  final Product product;

  const ItemContent({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Stack(
        children: [
          Container(
            // color: product.color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fitHeight,
                    height: 90,
                    width: 80,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<Cart>(
                        builder: (context, value, child) {
                          return Flexible(
                            child: FittedBox(
                              child: Text(
                                product.title,
                                style: GoogleFonts.nunito(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: currencyCount(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: InkWell(
                          onTap: () {
                            cart.increaseQuantity(product);
                          },
                          child: Icon(
                            Icons.add,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        product.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontSize: 19, color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: product.quantity < 2
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.black),
                        ),
                        child: InkWell(
                          onTap: () {
                            cart.decreaseQuantity(product);
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text currencyCount() {
    final formatCurrency = NumberFormat(",###.#");
    return Text(
      '\u20A6${formatCurrency.format(product.quantity * product.price)}',
      style: GoogleFonts.nunito(
          fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black),
    );
  }
}
