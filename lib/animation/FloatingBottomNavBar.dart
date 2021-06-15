import 'package:flutter/material.dart';

class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({
    Key key,
    @required this.showFloatingNavbar,
  }) : super(key: key);

  final AnimationController showFloatingNavbar;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: showFloatingNavbar,
      child: Container(
        alignment: Alignment.bottomCenter,
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
    );
  }
}
