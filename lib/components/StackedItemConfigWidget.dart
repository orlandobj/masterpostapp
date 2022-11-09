import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterpost/models/FontData.dart';
import 'package:masterpost/models/StackedWidgetModel.dart';
import 'package:masterpost/utils/Colors.dart';
import 'package:masterpost/utils/Constants.dart';
import 'package:masterpost/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/ColorFilterModel.dart';
import 'BottomBarItemWidget.dart';
import 'ColorSelectorBottomSheet.dart';

// ignore: must_be_immutable
class StackedItemConfigWidget extends StatefulWidget {
  StackedWidgetModel stackedWidgetModel;
  final VoidCallback voidCallback;


  StackedItemConfigWidget({this.stackedWidgetModel, this.voidCallback});

  @override
  StackedItemConfigWidgetState createState() => StackedItemConfigWidgetState();
}

class StackedItemConfigWidgetState extends State<StackedItemConfigWidget> {
  List<FontData> fontList = getFontFamilies();
  FontData selectedFontFamily;
  final ScrollController scrollController = ScrollController();
  /// Variables used to show or hide bottom widgets
  bool mIsPenColorVisible = false, mIsFilterViewVisible = false, mIsBlurVisible = false, mIsFrameVisible = false;
  bool mIsBrightnessSliderVisible = false, mIsSaturationSliderVisible = false, mIsHueSliderVisible = false, mIsContrastSliderVisible = false;
  bool mIsMoreConfigWidgetVisible = true;
  bool mIsPenEnabled = false;
  bool mShowBeforeImage = false;

  /// Selected color filter
  ColorFilterModel filter;



  /// Selected frame
  String frame;

  @override
  void initState() {
    super.initState();
    selectedFontFamily = fontList.first;

    log(selectedFontFamily);
  }

  @override
  Widget build(BuildContext context) {
    bool isTextTypeWidget =
        widget.stackedWidgetModel.widgetType.validate() == WidgetTypeNeon ||
            widget.stackedWidgetModel.widgetType.validate() == WidgetTypeText;
    bool isTextWidget =
        widget.stackedWidgetModel.widgetType.validate() == WidgetTypeText;
    bool isStickerWidget =
        widget.stackedWidgetModel.widgetType.validate() == WidgetTypeSticker;
    bool isImageWidget =
        widget.stackedWidgetModel.widgetType.validate() == WidgetTypeImage;

    return Container(
      padding: EdgeInsets.all(16),
      height: context.height() * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radiusOnly(topLeft: 16, topRight: 16)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Tamanho: ${widget.stackedWidgetModel.size.toInt()}',
                style: boldTextStyle()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    Text('Normal', style: boldTextStyle()).onTap(() {
                      widget.stackedWidgetModel.fontStyle = FontStyle.normal;
                      widget.voidCallback.call();

                      setState(() {});
                    }),
                    Text('Italic',
                            style: boldTextStyle(fontStyle: FontStyle.italic))
                        .onTap(() {
                      widget.stackedWidgetModel.fontStyle = FontStyle.italic;
                      widget.voidCallback.call();

                      setState(() {});
                    }),
                  ],
                ),
              ],
            ).visible(isTextTypeWidget),
            8.height,
            if (selectedFontFamily != null && isTextWidget)
              Row(
                children: [
                  Text('Família da fonte', style: primaryTextStyle()),
                  8.width,
                  DropdownButton(
                    value: selectedFontFamily,
                    items: fontList.map((e) {
                      return DropdownMenuItem(
                          child: Text(e.fontName,
                              style: primaryTextStyle(
                                  fontFamily: GoogleFonts.getFont(e.fontName)
                                      .fontFamily)),
                          value: e);
                    }).toList(),
                    underline: SizedBox(),
                    onChanged: (FontData s) {
                      selectedFontFamily = s;

                      widget.stackedWidgetModel.fontFamily = s.fontFamily;
                      widget.voidCallback.call();

                      setState(() {});
                    },
                  ).expand(),
                ],
              ),
            8.height,
            Slider(
              value: widget.stackedWidgetModel.size.validate(value: 16),
              min: 10.0,
              max: isStickerWidget ? 300.0 : 100.0,
              onChangeEnd: (v) {
                widget.stackedWidgetModel.size = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.size = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ),
            16.height.visible(isTextTypeWidget),
            Text('Cor de fundo', style: boldTextStyle())
                .visible(isTextTypeWidget),
            8.height.visible(isTextTypeWidget),
            ColorSelectorBottomSheet(
              list: backgroundColors,
              selectedColor: widget.stackedWidgetModel.backgroundColor,
              onColorSelected: (c) {
                widget.stackedWidgetModel.backgroundColor = c;
                widget.voidCallback.call();

                setState(() {});
              },
            ).visible(isTextTypeWidget),
            16.height.visible(isTextTypeWidget),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cor do texto', style: boldTextStyle()),
                8.height,
                ColorSelectorBottomSheet(
                  list: textColors,
                  selectedColor: widget.stackedWidgetModel.textColor,
                  onColorSelected: (c) {
                    widget.stackedWidgetModel.textColor = c;
                    widget.voidCallback.call();

                    setState(() {});
                  },
                ),
              ],
            ).visible(isTextTypeWidget),
            16.height,
            AppButton(
              text: 'Remover',
              padding: EdgeInsets.symmetric(vertical: 8),
              onTap: () {
                finish(context, widget.stackedWidgetModel);
              },
            ),
            mIsBrightnessSliderVisible?Slider(
              value: widget.stackedWidgetModel.brightness,
              min: 0,
              max: 1,
              onChangeEnd: (v) {
                widget.stackedWidgetModel.brightness = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.brightness = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ):Container(),
            mIsContrastSliderVisible?Slider(
              value: widget.stackedWidgetModel.contrast,
              min: 0,
              max: 1,
              onChangeEnd: (v) {
                widget.stackedWidgetModel.contrast = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.contrast = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ):Container(),
            mIsSaturationSliderVisible?Slider(
              value: widget.stackedWidgetModel.saturation,
              min: 0,
              max: 1,
              onChangeEnd: (v) {
                widget.stackedWidgetModel.saturation = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.saturation = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ):Container(),
            mIsHueSliderVisible?Slider(
              value: widget.stackedWidgetModel.hue,
              min: 0,
              max: 1,
              onChangeEnd: (v) {
                widget.stackedWidgetModel.hue = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.hue = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ):Container(),
            mIsBlurVisible?Slider(
              value: widget.stackedWidgetModel.blur,
              min: 0,
              max: 10,
              divisions: 100,
              onChangeEnd: (v) {
                print(v);
                widget.stackedWidgetModel.blur = v;
                widget.voidCallback.call();

                setState(() {});
              },
              onChanged: (v) {
                widget.stackedWidgetModel.blur = v;
                widget.voidCallback.call();

                setState(() {});
              },
            ):Container(),
            Container(
              height: 80,
              color: Colors.white12,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      /// Will be added in next update due to multiple finger bug
                      //BottomBarItemWidget(title: 'Pen', icons: Icon(FontAwesomeIcons.penFancy).icon, onTap: () => onPenClick()),
                      BottomBarItemWidget(title: 'Borracha', icons: Icon(FontAwesomeIcons.eraser).icon, onTap: () => onEraserClick()),

                      BottomBarItemWidget(title: 'Brilho', icons: Icon(Icons.brightness_2_outlined).icon, onTap: () => onBrightnessSliderClick()),
                      BottomBarItemWidget(title: 'Contraste', icons: Icon(Icons.brightness_4_outlined).icon, onTap: () => onContrastSliderClick()),
                      BottomBarItemWidget(title: 'Saturação', icons: Icon(Icons.brightness_4_sharp).icon, onTap: () => onSaturationSliderClick()),
                      BottomBarItemWidget(title: 'Matiz', icons: Icon(Icons.brightness_medium_sharp).icon, onTap: () => onHueSliderClick()),
                      BottomBarItemWidget(title: 'Borrão', icons: Icon(MaterialCommunityIcons.blur).icon, onTap: () => onBlurClick()),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


  void onEraserClick() {
    showConfirmDialog(context, 'Você quer limpar?', positiveText: "Sim", negativeText: "Não", buttonColor: colorPrimary).then((value) {
      if (value ?? false) {
        mIsBlurVisible = false;
        mIsFilterViewVisible = false;
        mIsFrameVisible = false;
        mIsPenColorVisible = false;
        mIsBrightnessSliderVisible = false;
        mIsSaturationSliderVisible = false;
        mIsHueSliderVisible = false;
        mIsContrastSliderVisible = false;


        /// Clear filter
        filter = null;

        /// Clear blur effect
        widget.stackedWidgetModel.blur = 0;

        /// Clear frame
        frame = null;

        /// Clear brightness, contrast, saturation, hue
        widget.stackedWidgetModel.brightness = 0.0;
        widget.stackedWidgetModel.saturation = 0.0;
        widget.stackedWidgetModel.hue = 0.0;
        widget.stackedWidgetModel.contrast = 0.0;

        setState(() {});
      }
    }).catchError(log);
  }

  void onBlurClick() {
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsBlurVisible = !mIsBlurVisible;

    setState(() {});
  }

  Future<void> onFilterClick() async {
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBlurVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsFilterViewVisible = !mIsFilterViewVisible;

    setState(() {});
  }

  Future<void> onFrameClick() async {
    if (getBoolAsync(IS_FRAME_REWARDED)) {
      mIsPenColorVisible = false;
      mIsBlurVisible = false;
      mIsFilterViewVisible = false;
      mIsBrightnessSliderVisible = false;
      mIsSaturationSliderVisible = false;
      mIsHueSliderVisible = false;
      mIsContrastSliderVisible = false;
      mIsFrameVisible = !mIsFrameVisible;

      setState(() {});
    } else {}
  }

  Future<void> onBrightnessSliderClick() async {
    mIsPenColorVisible = false;
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsBrightnessSliderVisible = !mIsBrightnessSliderVisible;

    setState(() {});
  }

  Future<void> onSaturationSliderClick() async {
    mIsPenColorVisible = false;
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsSaturationSliderVisible = !mIsSaturationSliderVisible;

    setState(() {});
  }

  Future<void> onHueSliderClick() async {
    mIsPenColorVisible = false;
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsHueSliderVisible = !mIsHueSliderVisible;

    setState(() {});
  }

  Future<void> onContrastSliderClick() async {
    mIsPenColorVisible = false;
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = !mIsContrastSliderVisible;

    setState(() {});
  }
}
