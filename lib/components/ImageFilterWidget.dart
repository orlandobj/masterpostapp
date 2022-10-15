import 'package:flutter/material.dart';
import 'package:masterpost/utils/ColorFilterGenerator.dart';

import '../models/StackedWidgetModel.dart';

class ImageFilterWidget extends StatelessWidget {
  final double brightness;
  final double saturation;
  final double hue;
  final double contrast;
  final Widget child;
  final StackedWidgetModel stackedWidgetModel;

  ImageFilterWidget(
      {this.brightness, this.saturation, this.hue, this.contrast, this.child, this.stackedWidgetModel});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: brightness != 0.0
          ? ColorFilter.matrix(
              ColorFilterGenerator.brightnessAdjustMatrix(value: brightness))
          : ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
      child: ColorFiltered(
        colorFilter: saturation != 0.0
            ? ColorFilter.matrix(
                ColorFilterGenerator.saturationAdjustMatrix(value: saturation))
            : ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
        child: ColorFiltered(
          colorFilter: hue != 0.0
              ? ColorFilter.matrix(
                  ColorFilterGenerator.hueAdjustMatrix(value: hue))
              : ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
          child: ColorFiltered(
            colorFilter: contrast != 0.0
                ? ColorFilter.matrix(
                    ColorFilterGenerator.contrastAdjustMatrix(value: contrast))
                : ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
            child: child,
          ),
        ),
      ),
    );
  }
}
