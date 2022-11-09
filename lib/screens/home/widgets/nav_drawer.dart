import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterpost/screens/courses/courses.dart';
import 'package:masterpost/screens/gallery/gallery.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/screens/login/login_screen.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:masterpost/utils/my_help_dialog.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: MasterColors.black,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Text(
                    '  Perfil',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Text(
                    '  Home',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Gallery()
                    ));
                  },
                  child: Text(
                    '  Minha galeria',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Courses()));

                  },
                  child: Text(
                    '  Cursos',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: ()async{
                    var collection = await FirebaseFirestore.instance.collection("Config").get();
                    String link = collection.docs.first["indicar"];
                    var snackBar = SnackBar(
                      content: Text('Copiado!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Clipboard.setData(ClipboardData(text: link));
                    Navigator.pop(context);
                  },
                  child: Text(
                    '  Indicar amigos',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: (){
                    showHelpDialog(context);

                  },
                  child: Text(
                    '  Principais dúvidas',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.055, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.4,)
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width*0.15,
              left: MediaQuery.of(context).size.width*0.08,
              child: Text("Siga-nos", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.055),),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width*0.02,
              left: MediaQuery.of(context).size.width*0.04,
              child: Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width*0.04),
                  Icon(Icons.facebook, color: Colors.white,size: MediaQuery.of(context).size.width*0.08,),
                  SizedBox(width:MediaQuery.of(context).size.width*0.04),
                  Icon(FontAwesomeIcons.instagram, color: Colors.white,size: MediaQuery.of(context).size.width*0.08,),
                  SizedBox(width:MediaQuery.of(context).size.width*0.04,),

                  Icon(FontAwesomeIcons.twitter, color: Colors.white,size: MediaQuery.of(context).size.width*0.08,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
