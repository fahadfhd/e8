import 'package:flutter/material.dart';
import 'dart:math' as math;

class SizeConfig {
  static const Size _uiSize = Size(375.0, 812.0);
  static Size? _screenSize;

  static void init(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
  }

  static double getWidth(double width, {double? max}) {
    double resWidth = (width / _uiSize.width) * _screenSize!.width;
    if (max != null) resWidth = math.min(resWidth, max);
    return resWidth;
  }

  static double getHeight(double height) =>
      (height / _uiSize.height) * _screenSize!.height;

  static double getFontSize(double fontSize) {
    double resFontSize = fontSize;
    if (_screenSize!.width > 600) {
      resFontSize = (fontSize / _uiSize.height) * _screenSize!.height;
    }
    resFontSize = math.max(resFontSize, fontSize);
    return resFontSize;
  }

  static double getGridAspectRatio(double height, int crossAxisCount) {
    return (_screenSize!.width / height) / crossAxisCount;
  }

  static int getGridCrossAxis({
    required int crossAxis,
    required double width,
    required double itemWidth,
    int constant = 1,
  }) {
    return math.max(crossAxis, (width ~/ itemWidth) - (constant));
  }

  static bool isTablet(double width, double height) {
    double ratio = width / height;
    return (ratio >= 0.74) && (ratio < 1.5);
  }
}
