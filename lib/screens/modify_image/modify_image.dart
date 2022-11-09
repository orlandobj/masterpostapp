import 'dart:io';
import 'dart:ui' as ui;

import 'package:crop/crop.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:masterpost/commons/widgets/centered_slider_track_shape.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ModifyImage extends StatefulWidget {
  ModifyImage(path){
    this.path = path;
  }
  String path;
  @override
  _ModifyImageState createState() => _ModifyImageState();
}

class _ModifyImageState extends State<ModifyImage> {
  final controller = CropController(aspectRatio: 1000 / 667.0);
  double _rotation = 0;
  File image;
  bool loading = false;
  BoxShape shape = BoxShape.rectangle;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationDocumentsDirectory().then((value)async{
      image = File(value.path+"/"+"images/"+widget.path.replaceAll(new RegExp(r'[^\w\s]+'), '')+".jpg");
      if(!image.existsSync()){
        await image.create(recursive: true);
        await Dio().download(widget.path, image.path);
      }
      setState(() {
        loading = true;
      });
    });
  }

  void _cropImage() async {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final cropped = await controller.crop(pixelRatio: pixelRatio);
    File tempImage = File((await getApplicationDocumentsDirectory()).path+"/"+"tempFile.png");
    var bytes = (await cropped.toByteData(format: ui.ImageByteFormat.png));
    await tempImage.writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: MasterColors.red,
            title: Text('Resultado'),
            centerTitle: true,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    await Share.shareFiles([tempImage.path]);
                  },
                ),
              ),
            ],
          ),
          body: Center(
            child: RawImage(
              image: cropped,
            ),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MasterColors.red,
        title: Text('Ajustar imagem'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: _cropImage,
            tooltip: 'Crop',
            icon: Icon(Icons.crop),
          )
        ],
      ),
      body: !loading?Container():Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(8),
              child: Crop(
                onChanged: (decomposition) {
                  if (_rotation != decomposition.rotation) {
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
                  image,
                  fit: BoxFit.cover,
                ),
                /* It's very important to set `fit: BoxFit.cover`.
                   Do NOT remove this line.
                   There are a lot of issues on github repo by people who remove this line and their image is not shown correctly.
                */
                helper: shape == BoxShape.rectangle
                    ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                )
                    : null,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.undo),
                tooltip: 'Undo',
                onPressed: () {
                  controller.rotation = 0;
                  controller.scale = 1;
                  controller.offset = Offset.zero;
                  setState(() {
                    _rotation = 0;
                  });
                },
              ),
              Expanded(
                child: SliderTheme(
                  data: theme.sliderTheme.copyWith(
                    trackShape: CenteredRectangularSliderTrackShape(),
                  ),
                  child: Slider(
                    divisions: 360,
                    value: _rotation,
                    min: -180,
                    max: 180,
                    label: '$_rotation°',
                    onChanged: (n) {
                      setState(() {
                        _rotation = n.roundToDouble();
                        controller.rotation = _rotation;
                      });
                    },
                  ),
                ),
              ),
              PopupMenuButton<BoxShape>(
                icon: Icon(Icons.crop_free),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Box"),
                    value: BoxShape.rectangle,
                  ),
                  PopupMenuItem(
                    child: Text("Oval"),
                    value: BoxShape.circle,
                  ),
                ],
                tooltip: 'Crop Shape',
                onSelected: (x) {
                  setState(() {
                    shape = x;
                  });
                },
              ),
              PopupMenuButton<double>(
                icon: Icon(Icons.aspect_ratio),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Original"),
                    value: 1000 / 667.0,
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text("16:9"),
                    value: 16.0 / 9.0,
                  ),
                  PopupMenuItem(
                    child: Text("4:3"),
                    value: 4.0 / 3.0,
                  ),
                  PopupMenuItem(
                    child: Text("1:1"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("3:4"),
                    value: 3.0 / 4.0,
                  ),
                  PopupMenuItem(
                    child: Text("9:16"),
                    value: 9.0 / 16.0,
                  ),
                ],
                tooltip: 'Aspect Ratio',
                onSelected: (x) {
                  controller.aspectRatio = x;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}