import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ColorSelectorBottomSheet extends StatefulWidget {
  static String tag = '/ColorSelectorBottomSheet';
  final List<Color> list;
  final Function(Color) onColorSelected;
  Color selectedColor;

  ColorSelectorBottomSheet({@required this.list, this.onColorSelected, this.selectedColor});

  @override
  _ColorSelectorBottomSheetState createState() => _ColorSelectorBottomSheetState();
}

class _ColorSelectorBottomSheetState extends State<ColorSelectorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: widget.list.map((e) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ColorItemWidget(
                  color: e,
                  onTap: () {
                    return widget.onColorSelected.call(e);
                  },
                ),
                if (widget.selectedColor != null) Icon(Icons.done).visible(widget.selectedColor == e),
              ],
            );
          }).toList(),
        ).paddingLeft(16),
      ),
    );
  }
}

class ColorItemWidget extends StatelessWidget {
  final Color color;
  final Function onTap;

  ColorItemWidget({this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all()),
    ).onTap(() {
      onTap.call();
    });
  }
}
