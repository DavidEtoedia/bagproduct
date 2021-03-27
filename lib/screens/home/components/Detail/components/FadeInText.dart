import 'package:bag_product/products/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FadeInText extends StatefulWidget {
  final Product product;

  const FadeInText({Key key, this.product}) : super(key: key);
  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.star_border_outlined),
            onPressed: () {},
          ),
          Text(
            widget.product.description,
            style: GoogleFonts.nunito(
              fontSize: 16,
              // fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
