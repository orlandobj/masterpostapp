import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterpost/commons/widgets/testeeeee.dart';
import 'package:masterpost/models/StackedWidgetModel.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ImageFilterWidget.dart';

class PositionedTextViewWidget extends StatefulWidget {
  final double left;
  final double top;
  final Function onTap;
  final Function onScaleStart;
  final Function onScaleUpdate;
  final Function onScaleEnd;
  final Function onPanStart;
  final Function onPanUpdate;
  final Function onPanEnd;
  final double fontSize;
  final String value;
  final TextAlign align;
  final double startingAngle;

  final StackedWidgetModel stackedWidgetModel;

  PositionedTextViewWidget(
      {this.left,
        this.top,
        this.onTap,
        this.onPanStart,
        this.onPanUpdate,
        this.onPanEnd,
        this.onScaleStart,
        this.onScaleUpdate,
        this.onScaleEnd,
        this.fontSize,
        this.value,
        this.align,
        this.stackedWidgetModel,
        this.startingAngle});

  @override
  PositionedTextViewWidgetState createState() =>
      PositionedTextViewWidgetState();
}

class PositionedTextViewWidgetState extends State<PositionedTextViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: ScalingGestureDetector(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Transform.rotate(
            angle: widget.startingAngle,
            child:
            Stack(
              children: [
                ImageFilterWidget(
                  brightness: widget.stackedWidgetModel.brightness,
                  saturation: widget.stackedWidgetModel.saturation,
                  hue: widget.stackedWidgetModel.hue,
                  contrast: widget.stackedWidgetModel.contrast,
                  child: Container(
                      decoration: BoxDecoration(borderRadius: radius(), color: widget.stackedWidgetModel.backgroundColor),
                      child: Text(
                        widget.value,
                        textAlign: widget.align,
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          color: widget.stackedWidgetModel?.textColor ??
                              textPrimaryColorGlobal,
                          fontStyle:
                          widget.stackedWidgetModel?.fontStyle ?? FontStyle.normal,
                          fontFamily: widget.stackedWidgetModel?.fontFamily ??
                              GoogleFonts.nunito().fontFamily,
                        ),
                      ),

                  ),
                ),

                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: widget.fontSize*1.2,
                    width: widget.fontSize*1.2,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: widget.stackedWidgetModel.blur, sigmaY: widget.stackedWidgetModel.blur),
                        child: Container(
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: widget.stackedWidgetModel.blur, sigmaY: widget.stackedWidgetModel.blur),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ],
            )

          ),
        ),
        onPanStart: widget.onPanStart,
        onPanUpdate: widget.onPanUpdate,
        onPanEnd: widget.onPanEnd,
        onScaleStart: (offset) {
          widget.onScaleStart(offset);
        },
        onScaleUpdate: (offset, x, y) {
          widget.onScaleUpdate(offset, x, y);
        },
      ),
    );
  }
}
