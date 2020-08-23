import 'package:bag_product/screens/home/components/custom_tabview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categories = ["Hand Bag", "Footwears", "Dresses", "Jewellery"];

  //by default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CustomTabView(
            itemCount: categories.length,
            tabBuilder: (context, index) {
              return buildCategories(index);
            }),
      ),
    );
  }

  Widget buildCategories(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          categories[index],
          style: GoogleFonts.nunito(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
