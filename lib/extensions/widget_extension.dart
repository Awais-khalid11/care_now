import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget withAllPadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget withSymmetricPadding({double vert = 0, double horizon = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vert, horizontal: horizon),
      child: this,
    );
  }

  Widget withOnlyPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}
