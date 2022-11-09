import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterpost/screens/PhotoEditScreen.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:path_provider/path_provider.dart';

class HomeImage extends StatefulWidget {
  HomeImage(path, listFavotirados, onTap) {
    this.path = path;
    this.listFavoritados = listFavotirados;
    this.onTap = onTap;
  }
  String path;
  Map listFavoritados;
  Function onTap;

  @override
  _HomeImageState createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            getApplicationDocumentsDirectory().then((value) async {
              File image = File(value.path +
                  "/" +
                  "images/" +
                  widget.path.replaceAll(new RegExp(r'[^\w\s]+'), '') +
                  ".jpg");
              if (!image.existsSync()) {
                await image.create(recursive: true);
                await Dio().download(widget.path, image.path);
              }
              PhotoEditScreen(file: image).launch(context, isNewTask: true);
            });
          },
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.28125,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: Image.network(widget.path),
          ),
        ),
        Positioned(
          child: GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child:
                  Like(widget.listFavoritados["salvos"].contains(widget.path))),
          top: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01,
        )
      ],
    );
    ;
  }
}

class Like extends StatefulWidget {
  Like(bool selected) {
    this.selected = selected;
  }
  bool selected;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FaIcon(
        widget.selected ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        color: MasterColors.red,
        size: MediaQuery.of(context).size.width * 0.06,
      ),
    );
  }
}
