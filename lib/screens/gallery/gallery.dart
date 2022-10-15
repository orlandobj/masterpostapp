import 'dart:math' as math; // import this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterpost/components/LastEditedPicturesWidget.dart';
import 'package:masterpost/screens/courses/courses.dart';
import 'package:masterpost/screens/home/widgets/carousel.dart';
import 'package:masterpost/screens/home/widgets/home_image.dart';
import 'package:masterpost/screens/home/widgets/nav_drawer.dart';
import 'package:masterpost/utils/masterColors.dart';

class Gallery extends StatefulWidget {

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MasterColors.grey[0],
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.help_outline,
                size: MediaQuery.of(context).size.width * 0.07,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.13,
                height: MediaQuery.of(context).size.width * 0.06,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: MasterColors.red),
                child: Text(
                  "PRO",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          foregroundColor: MasterColors.black,
          backgroundColor: MasterColors.grey[0],
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LastEditedPicturesWidget()
            ],
          ),
        ),
      ),
    );
  }
}
