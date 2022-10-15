import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterpost/models/user_model.dart';
import 'package:masterpost/screens/SplashScreen.dart';
import 'package:masterpost/screens/category/category_screen.dart';
import 'package:masterpost/screens/login/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:masterpost/stores/login_store.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:masterpost/store/AppStore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:uuid/uuid.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  defaultSpreadRadius = 0.5;
  defaultBlurRadius = 3.0;
  appButtonBackgroundColorGlobal = Colors.white;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var firstAccess = prefs.getBool("firstAccess")??true;
  await initialize();

  await Firebase.initializeApp().then((value) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  });
  


    // var path = "acai"+".png";
    // final byteData = await rootBundle.load('images/import/$path');
    // //await FirebaseAuth.instance.signInWithEmailAndPassword(email: "or.bressan@hotmail.com", password: "juca1234");
    // final file = File('${(await getTemporaryDirectory()).path}/$path');
    // await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    // print(file.length());
    // var pathImagem = await uploadImage(file);
    // var doc = {"active" :true,
    //   "category": "acai",
    //   "inCarousel": true,
    //   "name" :"acai",
    //   "path": pathImagem,
    //   "pro": true};
    // await FirebaseFirestore.instance.collection("Images").add(doc);





  runApp(MyApp(firstAccess));
}

class MyApp extends StatelessWidget {
  MyApp(this.firstAccess);
  bool firstAccess;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        ),
        Provider<UserModel>(
          create: (_) => UserModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Masterpost',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ),

        ),
        home: SplashScreen(firstAccess),
        //home: CategoryScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1,
                accessibleNavigation: false
            ), //set desired text scale factor here
            child: child,
          );
        },
      ),
    );
  }
}

//Classe utilizada para reiniciar o app (logout)
class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

Future<String> uploadImage(file) async {
  var instance = FirebaseStorage.instance;
  var storageReference = instance.ref().child("Images/" + Uuid().v4() + ".jpeg");
  var uploadTask = await storageReference.putFile(file);
  var link = await storageReference.getDownloadURL();
  print(link);
  return link;
}