import 'package:bag_product/animation/scrollHook.dart';
import 'package:bag_product/Screens/DetailScreen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:bag_product/products/products.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
          // Padding(
          //   padding: const EdgeInsets.only(top: 10, left: 15),
          //   child: Text(
          //     "Bags for Ladies",
          //     style: GoogleFonts.nunito(
          //         textStyle: TextStyle(color: Colors.black),
          //         fontSize: 36,
          //         fontWeight: FontWeight.w300),
          //   ),
          // ),
          // Categories(),
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
      // FloatingBottomNavBar(showFloatingNavbar: showFloatingNavbar),
    ]);
  }
}

// scrolltoslide(inputSlide) {
//   var whichSlide = products.indexWhere((slide) => products == products);
//   var maxScrollValue = ScrollController;
// }
