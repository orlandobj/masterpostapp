import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masterpost/components/BlurSelectorBottomSheet.dart';
import 'package:masterpost/components/BottomBarItemWidget.dart';
import 'package:masterpost/components/ColorSelectorBottomSheet.dart';
import 'package:masterpost/components/EmojiPickerBottomSheet.dart';
import 'package:masterpost/components/FilterSelectionWidget.dart';
import 'package:masterpost/components/FrameSelectionWidget.dart';
import 'package:masterpost/components/ImageFilterWidget.dart';
import 'package:masterpost/components/StackedWidgetComponent.dart';
import 'package:masterpost/components/StickerPickerBottomSheet.dart';
import 'package:masterpost/components/TextEditorDialog.dart';
import 'package:masterpost/models/ColorFilterModel.dart';
import 'package:masterpost/models/StackedWidgetModel.dart';
import 'package:masterpost/screens/gallery/gallery.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/screens/modify_image/crop_image.dart';
import 'package:masterpost/services/FileService.dart';
import 'package:masterpost/utils/Colors.dart';
import 'package:masterpost/utils/Constants.dart';
import 'package:masterpost/utils/SignatureLibWidget.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../main.dart';

class PhotoEditScreen extends StatefulWidget {
  static String tag = '/PhotoEditScreen';
  final File file;
  final bool isEdit;

  PhotoEditScreen({this.file, this.isEdit = false});

  @override
  PhotoEditScreenState createState() => PhotoEditScreenState();
}

class PhotoEditScreenState extends State<PhotoEditScreen> {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  double currentHeight;
  double currentWidth;
  final GlobalKey containerKey = GlobalKey();
  final GlobalKey key = GlobalKey<PhotoEditScreenState>();
  final ScrollController scrollController = ScrollController();
  GlobalKey<ImageCropperState> cropKey = GlobalKey<ImageCropperState>();
  bool isAjust = false;
  bool isRotate = false;
  var arrChangeType = [];
  var arrChangedImage = [];
  var arrChangedStackedWidget = [];

  DateTime currentBackPressTime;

  /// Google Ads
  bool mIsImageSaved = false;

  /// Used to save edited image on storage
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey screenshotKey = GlobalKey();

  /// Used to draw on image
  SignatureController signatureController =
      SignatureController(penStrokeWidth: 5, penColor: Colors.green);
  List<Offset> points = [];

  /// Texts on image
  List<StackedWidgetModel> mStackedWidgetList = [];

  /// Image file picked from previous screen
  File originalFile;
  File croppedFile;

  double topWidgetHeight = 80, bottomWidgetHeight = 80, blur = 0;

  /// Variables used to show or hide bottom widgets
  bool mIsPenColorVisible = false,
      mIsFilterViewVisible = false,
      mIsBlurVisible = false,
      mIsFrameVisible = false;
  bool mIsBrightnessSliderVisible = false,
      mIsSaturationSliderVisible = false,
      mIsHueSliderVisible = false,
      mIsContrastSliderVisible = false;
  bool mIsMoreConfigWidgetVisible = true;
  bool mIsPenEnabled = false;
  bool mShowBeforeImage = false;

  /// Selected color filter
  ColorFilterModel filter;

  double brightness = 0.0, saturation = 0.0, hue = 0.0, contrast = 0.0;

  /// Selected frame
  String frame;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentHeight = containerKey.currentContext.size.height;
      currentWidth = containerKey.currentContext.size.height * 0.5625;
      setState(() {});
    });
    init();

    setStatusBarColor(white);
  }

  Future<void> init() async {
    originalFile = widget.file;
    croppedFile = widget.file;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        mIsMoreConfigWidgetVisible = false;
      } else {
        mIsMoreConfigWidgetVisible = true;
      }

      setState(() {});
    });
  }

  Future<void> capture() async {
    appStore.setLoading(true);

    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    await screenshotController
        .captureAndSave(await getFileSavePath(), delay: 1.seconds)
        .then((value) async {
      toast('Salvo');
      log(value);

      mIsImageSaved = true;
    }).catchError((e) {
      log(e);
      e.toString().toastString();
    });

    appStore.setLoading(false);
  }

  void onEraserClick() {
    showConfirmDialog(context, 'Você quer limpar?',
            positiveText: "Sim", negativeText: "Não", buttonColor: colorPrimary)
        .then((value) {
      if (value ?? false) {
        mIsBlurVisible = false;
        mIsFilterViewVisible = false;
        mIsFrameVisible = false;
        mIsPenColorVisible = false;
        mIsBrightnessSliderVisible = false;
        mIsSaturationSliderVisible = false;
        mIsHueSliderVisible = false;
        mIsContrastSliderVisible = false;

        /// Clear signature
        signatureController.clear();
        points.clear();

        /// Clear stacked widgets
        mStackedWidgetList.clear();

        /// Clear filter
        filter = null;

        /// Clear blur effect
        blur = 0;

        /// Clear frame
        frame = null;

        /// Clear brightness, contrast, saturation, hue
        brightness = 0.0;
        saturation = 0.0;
        hue = 0.0;
        contrast = 0.0;
        croppedFile = originalFile;
        arrChangedStackedWidget = [];
        arrChangedImage = [];
        arrChangeType = [];

        setState(() {});
      }
    }).catchError(log);
  }

  onLayerClick() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState2) => Dialog(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Text(
                      "Camadas",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        print(oldIndex);
                        print(newIndex);
                        setState2(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final StackedWidgetModel item =
                              mStackedWidgetList.removeAt(oldIndex);
                          mStackedWidgetList.insert(newIndex, item);
                        });
                        setState(() {});
                      },
                      children: [
                        ...mStackedWidgetList.map((e) => ListTile(
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: StackedWidgetComponent(
                                            [e],
                                            centered: true,
                                          )),
                                      Icon(Icons.reorder)
                                    ],
                                  ),
                                  Divider(
                                    thickness: 3,
                                  )
                                ],
                              ),
                              key: ValueKey(e),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> onTextClick() async {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    String text = await showInDialog(context, child: TextEditorDialog());

    if (text.validate().isNotEmpty) {
      arrChangedStackedWidget
          .add(mStackedWidgetList.map((item) => item).toList());
      arrChangeType.add("stack");
      mStackedWidgetList.add(
        StackedWidgetModel(
          value: text,
          widgetType: WidgetTypeText,
          offset: Offset(100, 100),
          size: 20,
          backgroundColor: Colors.transparent,
          textColor: Colors.white,
          brightness: 0,
          saturation: 0,
          blur: 0,
          hue: 0,
          contrast: 0,
        ),
      );

      setState(() {});
    }
  }

  Future<void> onNeonLightClick() async {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    String text = await showInDialog(context, child: TextEditorDialog());

    if (text.validate().isNotEmpty) {
      arrChangedStackedWidget
          .add(mStackedWidgetList.map((item) => item).toList());
      arrChangeType.add("stack");
      mStackedWidgetList.add(
        StackedWidgetModel(
            value: text,
            widgetType: WidgetTypeNeon,
            offset: Offset(100, 100),
            size: 40,
            backgroundColor: Colors.transparent,
            textColor: getColorFromHex('#FF7B00AB'),
            brightness: 0.0,
            saturation: 0.0,
            hue: 0.0,
            contrast: 0.0,
            blur: 0.0),
      );

      setState(() {});
    }
  }

  Future<void> onEmojiClick() async {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    appStore.setLoading(true);
    await 300.milliseconds.delay;

    String emoji = await showModalBottomSheet(
        context: context, builder: (_) => EmojiPickerBottomSheet());

    if (emoji.validate().isNotEmpty) {
      arrChangedStackedWidget
          .add(mStackedWidgetList.map((item) => item).toList());
      arrChangeType.add("stack");
      mStackedWidgetList.add(
        StackedWidgetModel(
            value: emoji,
            widgetType: WidgetTypeEmoji,
            offset: Offset(100, 100),
            size: 50,
            brightness: 0.0,
            saturation: 0.0,
            hue: 0.0,
            contrast: 0.0,
            blur: 0.0),
      );

      setState(() {});
    }
  }

  Future<void> onStickerClick() async {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    appStore.setLoading(true);
    await 300.milliseconds.delay;

    String sticker = await showModalBottomSheet(
        context: context, builder: (_) => StickerPickerBottomSheet());

    if (sticker.validate().isNotEmpty) {
      arrChangedStackedWidget
          .add(mStackedWidgetList.map((item) => item).toList());
      arrChangeType.add("stack");
      mStackedWidgetList.add(
        StackedWidgetModel(
            value: sticker,
            widgetType: WidgetTypeSticker,
            offset: Offset(100, 100),
            size: 100,
            brightness: 0.0,
            saturation: 0.0,
            hue: 0.0,
            contrast: 0.0,
            blur: 0.0),
      );

      setState(() {});
    }
  }

  Future<void> onImageClick() async {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsPenColorVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    setState(() {});

    appStore.setLoading(true);
    await 300.milliseconds.delay;
    Uint8List imageBytes;
    bool erase = false;

    try {
      bool gallery = false;
      await showDialog(
          builder: (context) {
            return AlertDialog(
              title: Text("Importar imagem"),
              content: Text("Nova foto ou galeria?"),
              actions: [
                GestureDetector(
                  onTap: () {
                    gallery = false;
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    color: Colors.green,
                    child: Text(
                      "Nova foto",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    gallery = true;
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    color: Colors.red,
                    child: Text(
                      "Galeria",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ),
              ],
            );
          },
          context: context);
      var image;
      if (gallery) {
        image = await ImagePicker().getImage(source: ImageSource.gallery);
      } else {
        try {
          image = await ImagePicker().getImage(source: ImageSource.camera);
        } catch (e) {
          print(e);
        }
      }
      if (image == null) {
        appStore.setLoading(false);
        return;
      }
      appStore.setLoading(false);

      await showDialog(
          builder: (context) {
            return AlertDialog(
              title: Text("Importar imagem"),
              content: Text("Deseja apagar o fundo?"),
              actions: [
                GestureDetector(
                  onTap: () {
                    erase = true;
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    color: Colors.green,
                    child: Text(
                      "Sim",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    erase = false;
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    color: Colors.red,
                    child: Text(
                      "Não",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ),
              ],
            );
          },
          context: context);

      imageBytes = await image.readAsBytes();
      int length = imageBytes.length;
      print(length);
      while (length > 1000000) {
        imageBytes = await FlutterImageCompress.compressWithList(
          imageBytes,
          quality: 90,
        );
        length = imageBytes.length;
        print(length);
      }
    } catch (e) {
      appStore.setLoading(false);
    }

    if (erase) {
      String base64Image = base64Encode(imageBytes);
      log(base64Image);
      var formData = FormData.fromMap({
        'image.base64': base64Image,
        'format': "result",
        'test': true,
      });
      Dio dio = new Dio();
      print(HttpHeaders.authorizationHeader);
      dio.options.headers[HttpHeaders.authorizationHeader] =
          "Basic MTE5Mzg6NWRxMjlobHZwamtoYzBva2M1ZTg1czExZ2FhdjFrNmFicHBjbTNsMjN1bXFlN2Z0a2I5Nw==";
      dio.options.responseType = ResponseType.bytes;
      var response = await dio.post("https://clippingmagic.com/api/v1/images",
          data: formData);
      if (response.data != null) {
        arrChangedStackedWidget
            .add(mStackedWidgetList.map((item) => item).toList());
        arrChangeType.add("stack");
        mStackedWidgetList.add(
          StackedWidgetModel(
              value: response.data,
              widgetType: WidgetTypeImage,
              offset: Offset(100, 100),
              size: 100,
              brightness: 0.0,
              saturation: 0.0,
              hue: 0.0,
              contrast: 0.0,
              blur: 0.0),
        );

        setState(() {});
      }
    } else {
      arrChangedStackedWidget
          .add(mStackedWidgetList.map((item) => item).toList());
      arrChangeType.add("stack");
      mStackedWidgetList.add(
        StackedWidgetModel(
            value: imageBytes,
            widgetType: WidgetTypeImage,
            offset: Offset(100, 100),
            size: 100,
            brightness: 0.0,
            saturation: 0.0,
            hue: 0.0,
            contrast: 0.0,
            blur: 0.0),
      );

      setState(() {});
    }

    appStore.setLoading(false);
  }

  onReplaceClick() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Categories")
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Widget> widgets = [];
                      for (var doc in snapshot.data.docs) {
                        widgets.add(Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.05),
                                child: Text(
                                  doc["name"],
                                  style: TextStyle(
                                      color: MasterColors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                )),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("Images")
                                        .where("category",
                                            isEqualTo: doc["name"])
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        List<Widget> listImages = [];
                                        for (var element
                                            in snapshot.data.docs) {
                                          print(element["path"]);
                                          listImages.add(
                                            GestureDetector(
                                              onTap: () async {
                                                getApplicationDocumentsDirectory()
                                                    .then((value) async {
                                                  File image = File(value.path +
                                                      "/" +
                                                      "images/" +
                                                      element["path"]
                                                          .replaceAll(
                                                              new RegExp(
                                                                  r'[^\w\s]+'),
                                                              '') +
                                                      ".jpg");
                                                  if (!image.existsSync()) {
                                                    print("aaaaaaaaaaaa");
                                                    await image.create(
                                                        recursive: true);
                                                    await Dio().download(
                                                        element["path"],
                                                        image.path);
                                                  }
                                                  setState(() {
                                                    croppedFile = image;
                                                    originalFile = image;
                                                    Navigator.pop(context);
                                                  });
                                                });
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey),
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05),
                                                child: Image.network(
                                                    element["path"]),
                                              ),
                                            ),
                                          );
                                        }
                                        return Row(
                                          children: listImages,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Icon(Icons.error_outline);
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    })),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                          ],
                        ));
                      }
                      return Column(
                        children: widgets,
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          );
        });
  }

  void onPenClick() {
    mIsBlurVisible = false;
    mIsFilterViewVisible = false;
    mIsFrameVisible = false;
    mIsBrightnessSliderVisible = false;
    mIsSaturationSliderVisible = false;
    mIsHueSliderVisible = false;
    mIsContrastSliderVisible = false;
    mIsPenColorVisible = !mIsPenColorVisible;

    setState(() {});
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

  @override
  void dispose() {
    super.dispose();

    signatureController?.dispose();
    scrollController?.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        await showConfirmDialog(context, 'Sua imagem editada será perdida',
                positiveText: "Sim",
                negativeText: "Não",
                buttonColor: colorPrimary)
            .then((value) async {
          if (value ?? false) {
            String tempPath = (await getApplicationDocumentsDirectory()).path;

            HomeScreen().launch(context, isNewTask: true);
            await Directory("$tempPath/tempImages/").delete(recursive: true);
            return Future.value(false);
          }
          return Future.value(false);
        });
        return Future.value(false);
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: context.height(),
          width: context.width(),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await showConfirmDialog(
                                    context, 'Sua imagem editada será perdida',
                                    positiveText: "Sim",
                                    negativeText: "Não",
                                    buttonColor: colorPrimary)
                                .then((value) async {
                              if (value ?? false) {
                                String tempPath =
                                    (await getApplicationDocumentsDirectory())
                                        .path;

                                HomeScreen().launch(context, isNewTask: true);
                                await Directory("$tempPath/tempImages/")
                                    .delete(recursive: true);
                                return Future.value(false);
                              }
                              return Future.value(false);
                            });
                          },
                          child: Icon(
                            LineIcons.home,
                            color: MasterColors.red,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.08,
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Stories",
                                    style: TextStyle(
                                        color: MasterColors.grey[900],
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        color: MasterColors.grey[900],
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cropKey.currentState.controller.aspectRatio =
                                    0.5625;
                                currentHeight =
                                    containerKey.currentContext.size.height;
                                currentWidth =
                                    containerKey.currentContext.size.height *
                                        0.5625;
                                setState(() {});
                                print("deu");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    border:
                                        Border.all(color: MasterColors.black),
                                    color: MasterColors.red),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1080",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "x",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "1920",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.08,
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Feed",
                                    style: TextStyle(
                                        color: MasterColors.grey[900],
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cropKey.currentState.controller.aspectRatio = 1;
                                currentHeight =
                                    containerKey.currentContext.size.width;
                                currentWidth =
                                    containerKey.currentContext.size.width;
                                setState(() {});
                                print("deu");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    border:
                                        Border.all(color: MasterColors.black),
                                    color: MasterColors.red),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1080",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "x",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "1080",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Icon(
                              LineIcons.download,
                              size: MediaQuery.of(context).size.width * 0.1,
                            ).onTap(() async {
                              isRotate = false;
                              isAjust = false;

                              var teste =
                                  await cropKey.currentState.cropImage();
                              croppedFile = teste;
                              cropKey.currentState.controller.rotation = 0;
                              cropKey.currentState.controller.scale = 1;

                              setState(() {});
                              capture();
                            }, borderRadius: radius()),
                          ],
                        ),
                      ],
                    ).paddingTop(16),
                  ),
                  Container(
                    height: context.height(),
                    width: context.width(),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        /// This widget will be saved as edited Image
                        Container(
                          key: containerKey,
                          color: Colors.black,
                          child: Center(
                            child: Container(
                              width: currentWidth,
                              height: currentHeight,
                              child: Screenshot(
                                controller: screenshotController,
                                key: screenshotKey,
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    (filter != null && filter.matrix != null)
                                        ? ColorFiltered(
                                            colorFilter: ColorFilter.matrix(
                                                filter.matrix),
                                            child: Image.file(croppedFile,
                                                fit: BoxFit.fitWidth),
                                          )
                                        : ImageFilterWidget(
                                            brightness: brightness,
                                            saturation: saturation,
                                            hue: hue,
                                            contrast: contrast,
                                            child: GestureDetector(
                                              onLongPressEnd: (a) {
                                                setState(() {});
                                              },
                                              onTap: () {
                                                setState(() {});
                                              },
                                              child: ImageCropper(
                                                file: croppedFile.path,
                                                key: cropKey,
                                              ),
                                            ),
                                          ),
                                    IgnorePointer(
                                      ignoring: true,
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: blur, sigmaY: blur),
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: Colors.grey.withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    (filter != null &&
                                            filter.color != null &&
                                            !isRotate)
                                        ? Container(
                                            height: context.height(),
                                            width: context.width(),
                                            color: Colors.black12,
                                            child: SizedBox(),
                                          ).withShaderMaskGradient(
                                            LinearGradient(
                                                colors: filter.color,
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            blendMode: BlendMode.srcOut,
                                          )
                                        : SizedBox(),
                                    frame != null
                                        ? Container(
                                            color: Colors.black12,
                                            child: Image.asset(
                                              frame,
                                              fit: BoxFit.fill,
                                              height: context.height(),
                                              width: context.width(),
                                            ),
                                          )
                                        : SizedBox(),
                                    StackedWidgetComponent(mStackedWidgetList),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsPenColorVisible ? 80 : 0,
                            color: Colors.white38,
                            width: context.width(),
                            child: Row(
                              children: [
                                Switch(
                                  value: mIsPenEnabled,
                                  onChanged: (b) {
                                    mIsPenEnabled = b;
                                    mIsPenColorVisible = false;

                                    setState(() {});
                                  },
                                ),
                                ColorSelectorBottomSheet(
                                  list: penColors,
                                  onColorSelected: (Color color) {
                                    List<Point> tempPoints =
                                        signatureController.points;
                                    signatureController = SignatureController(
                                        penStrokeWidth: 5, penColor: color);

                                    tempPoints.forEach((element) {
                                      signatureController.addPoint(element);
                                    });

                                    mIsPenColorVisible = false;
                                    mIsPenEnabled = true;

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsBrightnessSliderVisible ? 120 : 0,
                            width: context.width(),
                            child: Container(
                              color: Colors.white38,
                              height: 60,
                              child: Row(
                                children: [
                                  8.width,
                                  Text('Brilho'),
                                  8.width,
                                  Slider(
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (d) {
                                      brightness = d;

                                      setState(() {});
                                    },
                                    value: brightness,
                                  ).expand(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsContrastSliderVisible ? 120 : 0,
                            width: context.width(),
                            child: Container(
                              color: Colors.white38,
                              height: 60,
                              child: Row(
                                children: [
                                  8.width,
                                  Text('Contraste'),
                                  8.width,
                                  Slider(
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (d) {
                                      contrast = d;

                                      setState(() {});
                                    },
                                    value: contrast,
                                  ).expand(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsSaturationSliderVisible ? 120 : 0,
                            width: context.width(),
                            child: Container(
                              color: Colors.white38,
                              height: 60,
                              child: Row(
                                children: [
                                  8.width,
                                  Text('Saturação'),
                                  8.width,
                                  Slider(
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (d) {
                                      saturation = d;

                                      setState(() {});
                                    },
                                    value: saturation,
                                  ).expand(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsHueSliderVisible ? 120 : 0,
                            width: context.width(),
                            child: Container(
                              color: Colors.white38,
                              height: 60,
                              child: Row(
                                children: [
                                  8.width,
                                  Text('Matiz'),
                                  8.width,
                                  Slider(
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (d) {
                                      hue = d;

                                      setState(() {});
                                    },
                                    value: hue,
                                  ).expand(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsFilterViewVisible ? 120 : 0,
                            width: context.width(),
                            child: FilterSelectionWidget(
                                image: croppedFile,
                                onSelect: (v) {
                                  filter = v;

                                  setState(() {});
                                }),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: mIsFrameVisible ? 120 : 0,
                            width: context.width(),
                            child: FrameSelectionWidget(onSelect: (v) {
                              frame = v;
                              if (v.isEmpty) frame = null;

                              setState(() {});
                            }),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: mIsBlurVisible == true
                              ? AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: mIsBlurVisible ? 120 : 0,
                                  color: Colors.white38,
                                  width: context.width(),
                                  child: BlurSelectorBottomSheet(
                                    sliderValue: blur,
                                    onColorSelected: (v) {
                                      blur = v;

                                      setState(() {});
                                    },
                                  ),
                                )
                              : Container(),
                        ),

                        /// Show preview of edited image before save
                        if (mShowBeforeImage)
                          Image.file(croppedFile, fit: BoxFit.cover),
                      ],
                    ),
                  ).expand(),
                  isAjust
                      ? Container(
                          height: bottomWidgetHeight,
                          color: Colors.white12,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ListView(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  BottomBarItemWidget(
                                      title: 'Borracha',
                                      icons: Icon(FontAwesomeIcons.eraser).icon,
                                      onTap: () => onEraserClick()),
                                  BottomBarItemWidget(
                                      title: 'Camadas',
                                      icons: Icon(FontAwesomeIcons.layerGroup)
                                          .icon,
                                      onTap: () => onLayerClick()),
                                  BottomBarItemWidget(
                                      title: 'Imagem',
                                      icons: Icon(FontAwesomeIcons.image).icon,
                                      onTap: () => onImageClick()),
                                  BottomBarItemWidget(
                                      title: 'Neon',
                                      icons:
                                          Icon(Icons.text_fields_rounded).icon,
                                      onTap: () => onNeonLightClick()),
                                  BottomBarItemWidget(
                                      title: 'Emoji',
                                      icons: Icon(FontAwesomeIcons.smile).icon,
                                      onTap: () => onEmojiClick()),
                                  BottomBarItemWidget(
                                      title: 'Stickers',
                                      icons:
                                          Icon(FontAwesomeIcons.smileWink).icon,
                                      onTap: () => onStickerClick()),

                                  /// Will be added in next update due to multiple finger bug
                                  //BottomBarItemWidget(title: 'Pen', icons: Icon(FontAwesomeIcons.penFancy).icon, onTap: () => onPenClick()),

                                  BottomBarItemWidget(
                                      title: 'Brilho',
                                      icons: Icon(Icons.brightness_2_outlined)
                                          .icon,
                                      onTap: () => onBrightnessSliderClick()),
                                  BottomBarItemWidget(
                                      title: 'Contraste',
                                      icons: Icon(Icons.brightness_4_outlined)
                                          .icon,
                                      onTap: () => onContrastSliderClick()),
                                  BottomBarItemWidget(
                                      title: 'Saturação',
                                      icons:
                                          Icon(Icons.brightness_4_sharp).icon,
                                      onTap: () => onSaturationSliderClick()),
                                  BottomBarItemWidget(
                                      title: 'Matiz',
                                      icons: Icon(Icons.brightness_medium_sharp)
                                          .icon,
                                      onTap: () => onHueSliderClick()),
                                  BottomBarItemWidget(
                                      title: 'Borrão',
                                      icons: Icon(MaterialCommunityIcons.blur)
                                          .icon,
                                      onTap: () => onBlurClick()),
                                  BottomBarItemWidget(
                                      title: 'Filtro',
                                      icons: Icon(Icons.photo).icon,
                                      onTap: () => onFilterClick()),
                                ],
                              ),
                              Positioned(
                                child: AnimatedCrossFade(
                                  firstChild: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey),
                                  secondChild: Offstage(),
                                  crossFadeState: mIsMoreConfigWidgetVisible
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: 700.milliseconds,
                                ),
                                right: 8,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: MasterColors.black,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: !widget.isEdit
                              ? () {}
                              : () async {
                                  showConfirmDialog(context,
                                          'Sua imagem editada será excluída',
                                          positiveText: "Sim",
                                          negativeText: "Não",
                                          buttonColor: colorPrimary)
                                      .then((value) async {
                                    if (value ?? false) {
                                      await widget.file.delete();
                                      Gallery()
                                          .launch(context, isNewTask: true);
                                    }
                                  });
                                },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.trash,
                                color:
                                    widget.isEdit ? Colors.white : Colors.grey,
                                size: MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text(
                                "excluir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (arrChangeType.length > 0) {
                              if (arrChangeType.last == "stack") {
                                print(arrChangedStackedWidget);
                                mStackedWidgetList =
                                    arrChangedStackedWidget.last;
                                arrChangedStackedWidget.removeLast();
                                arrChangeType.removeLast();
                              } else if (arrChangeType.last == "image") {
                                croppedFile = arrChangedImage.last;
                                arrChangedImage.removeLast();
                                arrChangeType.removeLast();
                              }
                              setState(() {});
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.undo,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text(
                                "desfazer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onReplaceClick();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.syncAlt,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text(
                                "substituir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isRotate = !isRotate;
                            });
                            if (!isRotate) {
                              var teste =
                                  await cropKey.currentState.cropImage();
                              arrChangedImage.add(croppedFile);
                              arrChangeType.add("image");
                              croppedFile = teste;
                              cropKey.currentState.controller.rotation = 0;
                              cropKey.currentState.controller.scale = 1;
                            }
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.cut,
                                color:
                                    isRotate ? MasterColors.red : Colors.white,
                                size: MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text(
                                "recortar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.slidersH,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text(
                              "ajustes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            )
                          ],
                        ).onTap(() {
                          setState(() {
                            isAjust = !isAjust;
                          });
                        }),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.text_fields,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text(
                              "texto",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            )
                          ],
                        ).onTap(onTextClick),
                      ],
                    ),
                  )
                ],
              ),
              Observer(builder: (_) => Loader().visible(appStore.isLoading)),
            ],
          ),
        ),
      ),
    );
  }
}
