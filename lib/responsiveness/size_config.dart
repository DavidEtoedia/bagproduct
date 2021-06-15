import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  // static double textMultiplier;
  // static double imageSizeMultiplier;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  // static bool isPortrait = true;
  // static bool isMobilePortrait = false;

  void init(BuildContext context) {
    // if (orientation == Orientation.portrait) {
    //   _screenWidth = constraints.maxWidth;
    //   _screenHeight = constraints.maxHeight;
    //   isPortrait = true;
    //   if (_screenWidth < 450) {
    //     isMobilePortrait = true;
    //   }
    // } else {
    //   _screenWidth = constraints.maxHeight;
    //   _screenHeight = constraints.maxWidth;
    //   isPortrait = false;
    //   isMobilePortrait = false;
    // }
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    // textMultiplier = _blockSizeVertical;
    // imageSizeMultiplier = _blockSizeHorizontal;
    // heightMultiplier = _blockSizeVertical;
    // widthMultiplier = _blockSizeHorizontal;

    // print(safeBlockHorizontal);
    // print(safeBlockVertical);
    print(blockSizeHorizontal);
    print(blockSizeVertical);
  }
}
