import 'package:flutter/material.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'cadastro/cadastro_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen(this.firstAccess);
  bool firstAccess;
  static String tag = '/SplashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await setStatusBarColor(Colors.white, delayInMilliSeconds: 4000);

    widget.firstAccess?Registration(firstAccess: true,).launch(context, isNewTask: true):HomeScreen().launch(context, isNewTask: true);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MasterColors.BackgroundIntroColor,
      body: Image.asset(
        "images/intro.png",
        height: MediaQuery.of(context).size.height * 0.35,
      ).center()
    );
  }
}
