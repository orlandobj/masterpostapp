import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:masterpost/components/AppLogoWidget.dart';
import 'package:masterpost/components/HomeItemListWidget.dart';
import 'package:masterpost/components/LastEditedPicturesWidget.dart';
import 'package:masterpost/utils/Common.dart';
import 'package:masterpost/utils/Constants.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/HomeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {

    setStatusBarColor(Colors.white70);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogoWidget(),
                  HomeItemListWidget(),
                  LastEditedPicturesWidget(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
