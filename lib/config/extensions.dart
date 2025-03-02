import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension WidgetX on Widget {
  Widget paddingAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);
}

extension ShapeBorderX on ShapeBorder {
  static OutlinedBorder rounded(double value) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(value)));
}

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
