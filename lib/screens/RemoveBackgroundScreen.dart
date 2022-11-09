import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:masterpost/main.dart';
import 'package:masterpost/services/FileService.dart';
import 'package:masterpost/utils/Colors.dart';
import 'package:masterpost/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class RemoveBackgroundScreen extends StatefulWidget {
  static String tag = '/RemoveBackgroundScreen';
  final File file;

  RemoveBackgroundScreen({this.file});

  @override
  RemoveBackgroundScreenState createState() => RemoveBackgroundScreenState();
}

class RemoveBackgroundScreenState extends State<RemoveBackgroundScreen> {
  File originalFile;
  File removeBgImage;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    originalFile = widget.file;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Remover imagem de fundo'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Text('Arquivo Original',
                      style: boldTextStyle(color: colorPrimary)),
                  8.height,
                  Image.file(originalFile,
                      height: (context.height() / 2) - 60, fit: BoxFit.cover),
                ],
              )
            ],
          ),
          AppButton(
            child: Text('Remover imagem de fundo',
                style: primaryTextStyle(color: Colors.white)),
            color: colorPrimary,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
            onTap: () async {
              appStore.setLoading(true);

              String fileName = DateTime.now().toIso8601String();
              String path = '$mAppDirectoryPath$fileName.jpeg';

              removeWhiteBackground(File(originalFile.path).readAsBytesSync())
                  .then((value) async {
                appStore.setLoading(false);

                removeBgImage = File(path);
                removeBgImage.writeAsBytesSync(value);

                log(removeBgImage.existsSync());
              }).catchError((e) {
                appStore.setLoading(false);
                log(e);
              });
            },
          ),
          Observer(builder: (_) => Loader().visible(appStore.isLoading)),
        ],
      ).paddingAll(16),
    );
  }
}
