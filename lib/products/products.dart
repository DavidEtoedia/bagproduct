import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  double price, size, id;
  final Color color, txt;

  Product(
      {this.image,
      this.title,
      this.description,
      this.price,
      this.size,
      this.id,
      this.color,
      this.txt});

  Product get index => Product(id: size);
}

List<Product> products = [
  Product(
      id: 1,
      title: "Cole Haan",
      description: dummytext,
      image: 'assets/images/HandbagA.png',
      price: 530,
      size: 11,
      txt: Colors.black,
      color: Color(0xfff8bbd0)),
  Product(
      id: 2,
      title: "Furla",
      description: dummytext,
      image: "assets/images/HandbagB.png",
      price: 641,
      size: 11,
      txt: Colors.black,
      color: Color(0xffffcc80)),
  Product(
      id: 3,
      title: "Tory Burch",
      description: dummytext,
      image: 'assets/images/HandbagE.png',
      price: 400,
      size: 11,
      txt: Colors.black,
      color: Color(0xffffd54f)),
  Product(
      id: 4,
      title: "Nine West",
      description: dummytext,
      image: "assets/images/HandbagD.png",
      price: 120,
      size: 11,
      txt: Colors.black,
      color: Color(0xfff8bbd0)),
  Product(
      id: 5,
      title: "Longchamp",
      description: dummytext,
      image: "assets/images/HandbagG.png",
      price: 356,
      size: 11,
      txt: Colors.white,
      color: Color(0xff4db6ac)),
  Product(
      id: 6,
      title: "Brighton",
      description: dummytext,
      image: "assets/images/HandbagF.png",
      price: 712,
      size: 11,
      txt: Colors.white,
      color: Color(0xffe57373)),
];

String dummytext = 'Lorem ipsum dolor sit amet, consectetur adipiscing ' +
    'elit, sed do eiusmod tempor incididunt ut labore et dolore magna ' +
    'aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
    'laboris nisi ut aliquip ex ea commodo consequat.';
