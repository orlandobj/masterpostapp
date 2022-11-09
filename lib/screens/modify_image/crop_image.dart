import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:crop/crop.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageCropper extends StatefulWidget {
  ImageCropper({this.file, Key key}): super(key: key);
  final String file;
  @override
  ImageCropperState createState() => ImageCropperState();
}

class ImageCropperState extends State<ImageCropper> {
  var controller = CropController(aspectRatio: 1080.0/1920.0);
  double _rotation = 45;
  BoxShape shape = BoxShape.rectangle;

  Future<File> cropImage() async {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final cropped = await controller.crop(pixelRatio: pixelRatio);
    return await imageToFile(image:await cropped.toByteData(format: ImageByteFormat.png));

  }

  static Future<File> imageToFile({ByteData image}) async {
    String tempPath = (await getApplicationDocumentsDirectory()).path;
    File file = File('$tempPath/tempImages/'+Uuid().v4()+".png");
    file.createSync(recursive: true);
    var bytes = image.buffer.asUint8List();
    await file.writeAsBytes(
        bytes, flush: true);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
     return Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Crop(
                onChanged: (decomposition) {
                  if (_rotation != decomposition.rotation) {
                    print("AAAAAAAAAA");
                    setState(() {
                      _rotation = ((decomposition.rotation + 180) % 360) - 180;
                    });
                  }

                  print(
                      "Scale : ${decomposition.scale}, Rotation: ${decomposition.rotation}, translation: ${decomposition.translation}");
                },
                controller: controller,
                shape: shape,
                child: Image.file(
                  File(widget.file),
                  fit: BoxFit.cover,
                ),
                /* It's very important to set `fit: BoxFit.cover`.
                   Do NOT remove this line.
                   There are a lot of issues on github repo by people who remove this line and their image is not shown correctly.
                */

              ),
            ),
          ),
        ],
      );
  }
}