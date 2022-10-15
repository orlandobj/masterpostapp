import 'package:flutter/material.dart';
import 'package:masterpost/commons/widgets/testeeeee.dart';
import 'package:masterpost/models/StackedWidgetModel.dart';
import 'package:masterpost/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class PositionedNeonTextWidget extends StatefulWidget {
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

  PositionedNeonTextWidget(
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
  PositionedTextViewWidgetState createState() => PositionedTextViewWidgetState();
}

class PositionedTextViewWidgetState extends State<PositionedNeonTextWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

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
            child: Container(
              decoration: BoxDecoration(borderRadius: radius()),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                widget.value,
                textAlign: widget.align,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.stackedWidgetModel?.textColor ?? Colors.deepPurple,
                  fontFamily: FontNeonLights,
                  letterSpacing: 5.0,
                  shadows: [
                    BoxShadow(color: widget.stackedWidgetModel.backgroundColor, blurRadius: 1.0, spreadRadius: 1.0),
                    BoxShadow(color: widget.stackedWidgetModel.backgroundColor, blurRadius: 30.0, spreadRadius: 30.0),
                    BoxShadow(color: widget.stackedWidgetModel.backgroundColor, blurRadius: 30.0, spreadRadius: 2.0),
                    BoxShadow(color: widget.stackedWidgetModel.backgroundColor, blurRadius: 200.0, spreadRadius: 200.0),
                  ],
                ),
              ),
            ),
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
