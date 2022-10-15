import 'dart:math' as math; // import this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterpost/screens/courses/widgets/course_card.dart';
import 'package:masterpost/screens/home/widgets/carousel.dart';
import 'package:masterpost/screens/home/widgets/home_image.dart';
import 'package:masterpost/screens/home/widgets/nav_drawer.dart';
import 'package:masterpost/utils/masterColors.dart';

class Courses extends StatefulWidget {

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
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
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: MasterColors.black),
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: TextField(
                    cursorColor: MasterColors.black,
                    style: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.06),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: MasterColors.grey[0],
                      ),
                      suffixIcon: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            Icons.search,
                            color: MasterColors.black,
                          )),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.06),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> listImages = [];
                          for (var element in snapshot.data.docs) {
                            listImages.add(CourseCard(element["name"], element["description"], element["image"], element["link"], element["rating"]));
                          }
                          return Column(
                            children: listImages,
                          );
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return CircularProgressIndicator();
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
