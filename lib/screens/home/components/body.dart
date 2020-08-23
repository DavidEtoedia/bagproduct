import 'package:bag_product/logic/scrollHook.dart';
import 'package:bag_product/screens/home/components/Detail/components/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/categories.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'itemCard.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showFloatingNavbar =
        useAnimationController(duration: Duration(milliseconds: 10));
    final scrollController = useControllerForAnimation(showFloatingNavbar);
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 15),
            child: Text(
              "Women's Bag",
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(color: Colors.black), fontSize: 36),
            ),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                controller: scrollController,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.65),
                itemBuilder: (context, index) => Itemcard(
                  product: products[index],
                  press: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (context, _, __) => DetailScreen(
                        product: products[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //Custom Bottom Navigation bar
      FadeTransition(
        opacity: showFloatingNavbar,
        child: Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .85,
              right: 20.0,
              left: 20.0),
          child: Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.white70,
              elevation: 4.0,
            ),
          ),
        ),
      ),
    ]);
  }
}
