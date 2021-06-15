import 'package:flutter/material.dart';

class SlideRouteTransition extends PageRouteBuilder {
  final Widget widget;

  SlideRouteTransition(this.widget)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position:
                    Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
                        .animate(animation),
                child: child,
              );
            });
}
