import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:masterpost/screens/CompressImageScreen.dart';
import 'package:masterpost/screens/CropImageScreen.dart';
import 'package:masterpost/screens/PhotoEditScreen.dart';
import 'package:masterpost/screens/ResizeImageScreen.dart';
import 'package:masterpost/services/FileService.dart';

import 'HomeItemWidget.dart';

class HomeItemListWidget extends StatefulWidget {
  static String tag = '/HomeItemListWidget';

  @override
  _HomeItemListWidgetState createState() => _HomeItemListWidgetState();
}

class _HomeItemListWidgetState extends State<HomeItemListWidget> {
  void pickImageSource(ImageSource imageSource) {
    pickImage(imageSource: imageSource).then((value) {
      PhotoEditScreen(file: value).launch(context, isNewTask: true);
    }).catchError((e) {
      toast(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        HomeItemWidget(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.perm_media_outlined, color: Colors.green),
                padding: EdgeInsets.all(16),
              ),
              16.height,
              Text('Escolha a imagem',
                  style: boldTextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            showInDialog(
              context,
              contentPadding: EdgeInsets.zero,
              child: Container(
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Galeria', style: boldTextStyle())
                        .paddingAll(16)
                        .onTap(() {
                      finish(context);

                      pickImageSource(ImageSource.gallery);
                    }),
                    Text('Câmera', style: boldTextStyle())
                        .paddingAll(16)
                        .onTap(() {
                      finish(context);

                      pickImageSource(ImageSource.camera);
                    }),
                  ],
                ),
              ),
            );
          },
        ),
        HomeItemWidget(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.crop, color: Colors.pink),
                padding: EdgeInsets.all(16),
              ),
              16.height,
              Text('Recortar e girar',
                  style: boldTextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            pickImage()
                .then((value) => CropImageScreen(file: value).launch(context))
                .catchError(log);
          },
        ),
        HomeItemWidget(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.photo_filter_sharp, color: Colors.blue),
                padding: EdgeInsets.all(16),
              ),
              16.height,
              Text('Redimensionar', style: boldTextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            pickImage().then(
                (value) => ResizeImageScreen(file: value).launch(context));
          },
        ),
        HomeItemWidget(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.compress, color: Colors.orange),
                padding: EdgeInsets.all(16),
              ),
              8.height,
              Text('Comprimir', style: boldTextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            pickImage().then(
                (value) => CompressImageScreen(file: value).launch(context));
          },
        ),
        /*HomeItemWidget(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.crop, size: 50, color: Colors.grey),
              8.height,
              Text('Remove Background', style: boldTextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            pickImage().then((value) => RemoveBackgroundScreen(file: value).launch(context));
          },
        )*/
      ],
    ).paddingAll(8).center();
  }
}
