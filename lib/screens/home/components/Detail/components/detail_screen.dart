import 'package:bag_product/products/products.dart';
import 'package:bag_product/screens/home/components/Detail/components/BottomSheet.dart';
import 'package:bag_product/screens/home/components/Detail/components/ProductTitleWithImage.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey[200]),
        ),
        BottomSlide(
          product: widget.product,
        ),
        ProductTitleWithImage(
          product: widget.product,
        ),
      ],
    ));
  }
}
