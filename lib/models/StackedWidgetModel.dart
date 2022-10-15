import 'package:flutter/material.dart';

class StackedWidgetModel {
  String widgetType;
  var value;
  Offset offset;
  double size;
  double angle;
  FontStyle fontStyle;
  double brightness = 0.0, saturation = 0.0, hue = 0.0, contrast = 0.0, blur = 0.0;

  // Text Widget Properties
  Color textColor;
  Color backgroundColor;
  String fontFamily;

  StackedWidgetModel(
      {this.widgetType,
      this.value,
      this.offset,
      this.size,
      this.textColor,
      this.backgroundColor,
      this.fontStyle,
      this.fontFamily,
      this.brightness,
      this.saturation,
      this.hue,
      this.contrast,
      this.blur});
}
