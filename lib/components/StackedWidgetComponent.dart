import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masterpost/commons/widgets/testeeeee.dart';
import 'package:masterpost/models/StackedWidgetModel.dart';
import 'package:masterpost/utils/Constants.dart';

import 'ImageFilterWidget.dart';
import 'PositionedNeonTextWidget.dart';
import 'PositionedTextViewWidget.dart';
import 'StackedItemConfigWidget.dart';

class StackedWidgetComponent extends StatefulWidget {
  static String tag = '/StackedWidgetComponent';
  final List<StackedWidgetModel> multiWidget;
  final centered;

  StackedWidgetComponent(this.multiWidget, {this.centered = false});

  @override
  StackedWidgetComponentState createState() => StackedWidgetComponentState();
}

class StackedWidgetComponentState extends State<StackedWidgetComponent> {
  var currentOffset;
  var currentAngle = 0.0;
  var startHeight;
  var startingAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: widget.multiWidget.map((item) {
        if (item.widgetType == WidgetTypeText) {
          return PositionedTextViewWidget(
            value: item.value,
            startingAngle: item.angle??startingAngle,
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            align: TextAlign.center,
            fontSize: widget.centered ? MediaQuery.of(context).size.width * 0.05 : item.size,
            stackedWidgetModel: item,
            onTap: widget.centered
                ? null
                : () async {
              var data = await showModalBottomSheet(
                barrierColor: Color(0x01000000),
                context: context,
                builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                backgroundColor: Colors.transparent,
              );

              if (data != null) {
                widget.multiWidget.remove(data);
              }
              setState(() {});
            },
            onPanStart: widget.centered
                ? null
                : (start) {
              currentOffset = item.offset;
            },
            onPanUpdate: widget.centered
                ? null
                : (start, end) {
              item.offset = (currentOffset + end);
              setState(() {});
            },
            onPanEnd: widget.centered
                ? null
                : () {
              currentOffset = item.offset;
            },
            onScaleStart: (offset) {
              startHeight = item.size;
            },
            onScaleUpdate: (offset, x, y) {
              print(y);
              item.size = startHeight * x;
              item.angle = y;
              setState(() {});
            },
          );
        } else if (item.widgetType == WidgetTypeEmoji) {
          return PositionedTextViewWidget(
            value: item.value,
            startingAngle: item.angle??startingAngle,
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            align: TextAlign.center,
            fontSize: widget.centered ? MediaQuery.of(context).size.width * 0.05 : item.size,
            stackedWidgetModel: item,
            onTap: widget.centered
                ? null
                : () async {
              var data = await showModalBottomSheet(
                barrierColor: Color(0x01000000),
                context: context,
                builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                backgroundColor: Colors.transparent,
              );

              if (data != null) {
                widget.multiWidget.remove(data);
              }
              setState(() {});
            },
            onPanStart: widget.centered
                ? null
                : (start) {
              currentOffset = item.offset;
            },
            onPanUpdate: widget.centered
                ? null
                : (start, end) {
              item.offset = (currentOffset + end);
              setState(() {});
            },
            onPanEnd: widget.centered
                ? null
                : () {
              currentOffset = item.offset;
            },
            onScaleStart: (offset) {
              startHeight = item.size;
            },
            onScaleUpdate: (offset, x, y) {
              print(y);
              item.size = startHeight * x;
              item.angle = y;
              setState(() {});
            },
          );
        } else if (item.widgetType == WidgetTypeNeon) {
          return PositionedNeonTextWidget(
            value: item.value,
            startingAngle: item.angle??startingAngle,
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            align: TextAlign.center,
            fontSize: widget.centered ? MediaQuery.of(context).size.width * 0.05 : item.size,
            stackedWidgetModel: item,
            onTap: widget.centered
                ? null
                : () async {
                    var data = await showModalBottomSheet(
                      barrierColor: Color(0x01000000),
                      context: context,
                      builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                      backgroundColor: Colors.transparent,
                    );

                    if (data != null) {
                      widget.multiWidget.remove(data);
                    }
                    setState(() {});
                  },
            onPanStart: widget.centered
                ? null
                : (start) {
              currentOffset = item.offset;
            },
            onPanUpdate: widget.centered
                ? null
                : (start, end) {
              item.offset = (currentOffset + end);
              setState(() {});
            },
            onPanEnd: widget.centered
                ? null
                : () {
              currentOffset = item.offset;
            },
            onScaleStart: (offset) {
              startHeight = item.size;
            },
            onScaleUpdate: (offset, x, y) {
              print(y);
              item.size = startHeight * x;
              item.angle = y;
              setState(() {});
            },
          );
        } else if (item.widgetType == WidgetTypeSticker) {
          return Positioned(
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            child: ScalingGestureDetector(
              child: GestureDetector(
                  onTap: widget.centered
                      ? null
                      : () async {
                          var data = await showModalBottomSheet(
                            barrierColor: Color(0x01000000),
                            context: context,
                            builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                            backgroundColor: Colors.transparent,
                          );

                          if (data != null) {
                            widget.multiWidget.remove(data);
                          }
                          setState(() {});
                        },
                child:Stack(
                  children: [
                    ImageFilterWidget(
                      stackedWidgetModel: item,
                      brightness: item.brightness,
                      saturation: item.saturation,
                      hue: item.hue,
                      contrast: item.contrast,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Transform.rotate(angle: item.angle??startingAngle,child: Image.asset(item.value, height: widget.centered?MediaQuery.of(context).size.width*0.2:item.size)),

                      ),
                    ),

                    Positioned.fill(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: item.blur, sigmaY: item.blur),
                              child: Container(
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: item.blur, sigmaY: item.blur),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onPanStart: widget.centered
                  ? null
                  : (start) {
                      currentOffset = item.offset;
                    },
              onPanUpdate: widget.centered
                  ? null
                  : (start, end) {
                      item.offset = (currentOffset + end);
                      setState(() {});
                    },
              onPanEnd: widget.centered
                  ? null
                  : () {
                      currentOffset = item.offset;
                    },
              onScaleStart: (offset) {
                startHeight = item.size;
              },
              onScaleUpdate: (offset, x, y) {
                print(y);
                item.size = startHeight * x;
                item.angle = y;
                setState(() {});
              },
            ),
          );
          Positioned(
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            child: ScalingGestureDetector(
              child: GestureDetector(
                onTap: widget.centered
                    ? null
                    : () async {
                        var data = await showModalBottomSheet(
                          context: context,
                          builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                          backgroundColor: Colors.transparent,
                        );

                        if (data != null) {
                          widget.multiWidget.remove(data);
                        }
                        setState(() {});
                      },
                onPanUpdate: widget.centered
                    ? null
                    : (details) {
                        item.offset = Offset(item.offset.dx + details.delta.dx, item.offset.dy + details.delta.dy);

                        setState(() {});
                      },
                child: Image.asset(item.value, height: widget.centered ? MediaQuery.of(context).size.width * 0.2 : item.size),
              ),
            ),
          );
        } else if (item.widgetType == WidgetTypeImage) {
          return Positioned(
            left: widget.centered ? null : item.offset.dx,
            top: widget.centered ? null : item.offset.dy,
            child: ScalingGestureDetector(
              child: GestureDetector(
                  onTap: widget.centered
                      ? null
                      : () async {
                          var data = await showModalBottomSheet(
                            barrierColor: Color(0x01000000),
                            context: context,
                            builder: (_) => StackedItemConfigWidget(stackedWidgetModel: item, voidCallback: () => setState(() {})),
                            backgroundColor: Colors.transparent,
                          );

                          if (data != null) {
                            widget.multiWidget.remove(data);
                          }
                          setState(() {});
                        },
                  child: Transform.rotate(
                      angle: item.angle??startingAngle, child: Stack(
                    children: [
                      ImageFilterWidget(
                        brightness: item.brightness,
                        saturation: item.saturation,
                        hue: item.hue,
                        contrast: item.contrast,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Transform.rotate(angle: item.angle??startingAngle,child: Image.memory(item.value, height: widget.centered?MediaQuery.of(context).size.width*0.2:item.size)),

                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          ignoring: true,
                          child: Container(
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: item.blur, sigmaY: item.blur),
                                child: Container(
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      IgnorePointer(
                        ignoring: true,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: item.blur, sigmaY: item.blur),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  )),
              onPanStart: widget.centered
                  ? null
                  : (start) {
                      currentOffset = item.offset;
                    },
              onPanUpdate: widget.centered
                  ? null
                  : (start, end) {
                      item.offset = (currentOffset + end);
                      setState(() {});
                    },
              onPanEnd: widget.centered
                  ? null
                  : () {
                      currentOffset = item.offset;
                    },
              onScaleStart: (offset) {
                startHeight = item.size;
              },
              onScaleUpdate: (offset, x, y) {
                item.size = startHeight * x;
                print(y);
                item.angle = currentAngle + y;
                setState(() {});
              },
              onScaleEnd: (){
                currentAngle = item.angle;
              },
            ),
          );
        }
        return Container();
      }).toList(),
    );
  }
}
