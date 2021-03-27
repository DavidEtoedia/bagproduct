import 'package:bag_product/animation_controller/show_up_animation.dart';
import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/products/checkoutScreen.dart/cart_listItem.dart';
import 'package:bag_product/screens/home/App_Bg.dart';
import 'package:bag_product/screens/home/components/Detail/components/Icons/homeIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.90;

    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        body: Stack(
          children: [
            AppBackground(),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
              child: Row(
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  HomeButton()
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Text(
                  'Check Out',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 170, 15, 0),
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: ShowUpAnime(
                      animationDuration: Duration(milliseconds: 550),
                      offset: 0.1,
                      // delayStart: Duration(milliseconds: 10),
                      curve: Curves.fastOutSlowIn,
                      child: ListView.builder(
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) =>
                            CartListItem(products: cart.basketItems[index]),
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 70,
                  //   width: contWidth,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 10),
                  //     child: Container(
                  //       color: Colors.black,
                  //     ),
                  //     //   ),
                  //     //   // child: Card(
                  //     //   //   shape: RoundedRectangleBorder(
                  //     //   //     borderRadius: BorderRadius.circular(10),
                  //     //   //   ),
                  //     //   //   color: Colors.black,
                  //     //   // ),
                  //   ),
                  // ),
                ]),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              left: 5,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey[700],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: GoogleFonts.nunito(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        cart.totalAmount.toString(),
                        style: GoogleFonts.nunito(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class CartListItem extends StatelessWidget {
//   final Product products;

//   const CartListItem({Key key, this.products}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//         child: Container(
//           color: Colors.grey[300],
//           margin: EdgeInsets.only(
//             bottom: 10,
//           ),
//           padding: EdgeInsets.only(
//             right: 15,
//             left: 5,
//           ),
//           child: ItemContent(product: products),
//         ),
//         actionPane: SlidableBehindActionPane(),
//         actionExtentRatio: 0.20,
//         secondaryActions: <Widget>[
//           SlideAction(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 color: Colors.black,
//                 child: Flex(
//                   direction: Axis.vertical,
//                   children: [
//                     Padding(padding: EdgeInsets.all(10)),
//                     InkWell(
//                       onTap: () {

//                       },
//                       child: Icon(Icons.delete, color: Colors.white)),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Delete',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 // child: Icon(Icons.delete,color: Colors.white),
//               ),
//             ),
//           ),
//           // IconSlideAction(
//           //   icon: Icons.delete,
//           // )
//         ]);

//     // return Container(
//     //   color: Colors.grey[300],
//     //   margin: EdgeInsets.only(
//     //     bottom: 10,
//     //   ),
//     //   padding: EdgeInsets.only(
//     //     right: 15,
//     //     left: 5,
//     //   ),
//     //   child: ItemContent(product: products),
//     // );
//   }
// }
