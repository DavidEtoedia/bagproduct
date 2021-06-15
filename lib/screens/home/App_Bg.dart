import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Stack(
          children: <Widget>[
            Container(color: Colors.white70),
            Positioned(
              left: -(height / 2 - width / 2),
              bottom: height * 0.10,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[100]),
              ),
            ),
            // Positioned(
            //   left: -width * 0.11,
            //   top: -width * 0.3,
            //   child: Container(
            //     height: width * 1.5,
            //     width: width * 1.6,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle, color: Colors.grey[200]),
            //   ),
            // ),
            // Positioned(
            //   left: height * 0.20,
            //   top: -width * 0.6,
            //   child: Container(
            //     height: width * 1.5,
            //     width: width * 1.0,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle, color: Colors.white12),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
