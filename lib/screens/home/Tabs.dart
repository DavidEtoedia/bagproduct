import 'package:bag_product/responsiveness/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/fourth.dart';
import 'Pages/second.dart';
import 'Pages/third.dart';
import 'components/body.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(title: "HandBags"),
    MyTabs(title: "Footwears"),
    MyTabs(title: "Dresses"),
    MyTabs(title: "Jewelries")
  ];

  MyTabs _myHandler;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    _myHandler = _tabs[0];
    controller.addListener(handleSelected);
  }

  void handleSelected() {
    setState(() {
      _myHandler = _tabs[controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 14.2,
              left: SizeConfig.safeBlockHorizontal * 4.2),
          child: Text(_myHandler.title,
              style: GoogleFonts.nunitoSans(
                  fontSize: SizeConfig.safeBlockHorizontal * 7.2)),
        ),
        Column(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            // Text(
            //   _myHandler.title,
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 70,
            //   ),
            // ),
            Padding(
              padding:
                  EdgeInsets.only(top: SizeConfig.safeBlockVertical * 22.1),
              child: Container(
                // color: Colors.red,
                child: TabBar(
                  controller: controller,
                  labelStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.6,
                      fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                      fontWeight: FontWeight.w300),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.red,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                      insets: EdgeInsets.only(bottom: 6)),
                  isScrollable: true,
                  tabs: <Tab>[
                    Tab(
                      text: _tabs[0].title,
                    ),
                    Tab(
                      text: _tabs[1].title,
                    ),
                    Tab(
                      text: _tabs[2].title,
                    ),
                    Tab(
                      text: _tabs[3].title,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 500,
                child: TabBarView(
                  controller: controller,
                  children: [Body(), SecondPage(), ThirdPage(), FourthPage()],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class MyTabs {
  final String title;

  MyTabs({this.title});
}
