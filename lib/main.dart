import 'package:bag_product/logic/cart.dart';
import 'package:bag_product/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

import 'logic/ChangeNotifier/Wishlist.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Wishist(),
          ),
        ],
        child: MyApp(),
      ),

      // ChangeNotifierProvider(
      //   create: (context) => Cart(),
      //   child: MyApp(),
      // ),
    );

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showperformance = false;
  onSettingCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale('en', 'US'),
      child: MaterialApp(
        title: 'Flutter Demo',
        showPerformanceOverlay: showperformance,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.white),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return HomeScreen();
        }),
      ),
    );
  }
}
