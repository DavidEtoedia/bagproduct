import 'package:bag_product/screens/home/Pages/FirstPage.dart';
import 'package:bag_product/screens/home/Pages/fourth.dart';
import 'package:bag_product/screens/home/Pages/second.dart';
import 'package:bag_product/screens/home/Pages/third.dart';
import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;

  CustomTabView({
    @required this.itemCount,
    @required this.tabBuilder,
  });

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: TabBar(
            controller: controller,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0),
                insets: EdgeInsets.only(left: 20, right: 25, bottom: 5)),
            isScrollable: true,
            tabs: List.generate(
              widget.itemCount,
              (index) => widget.tabBuilder(context, index),
            ),
            onTap: (index) {
              setState(() {
                // ignore: unnecessary_statements
                widget.itemCount;
                print("$index");
              });
            },
          ),
        ),
        Container(
          child: TabBarView(
              controller: controller,
              children: [FirstPage(), SecondPage(), ThirdPage(), FourthPage()]),
        )
      ],
    );
  }
}
