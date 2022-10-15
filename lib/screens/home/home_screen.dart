import 'dart:convert';
import 'dart:math' as math; // import this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterpost/screens/courses/courses.dart';
import 'package:masterpost/screens/home/widgets/carousel.dart';
import 'package:masterpost/screens/home/widgets/home_image.dart';
import 'package:masterpost/screens/home/widgets/nav_drawer.dart';
import 'package:masterpost/screens/login/login_screen.dart';
import 'package:masterpost/screens/pro/pro_screen.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:masterpost/utils/my_help_dialog.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController filterController = TextEditingController();
  Map listFavoritados = {};
  bool init = false;
  bool toggleFavoritos = false;
  UserModel userModel;

  Future getFavoritos()async{
    listFavoritados = jsonDecode((await SharedPreferences.getInstance()).getString("favoritos")??"{}");
    if(listFavoritados.isEmpty){
      listFavoritados["salvos"] = [];
    }
  }

  Future saveFavoritos()async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("favoritos", jsonEncode(listFavoritados));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoritos().then((value)async{
      init = true;
      await getFavoritos();
      setState(() {

      });
    });

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userModel = Provider.of<UserModel>(context);
  }
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
              GestureDetector(
                onTap: (){
                  showHelpDialog(context);
                },
                child: Icon(
                  Icons.help_outline,
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              GestureDetector(
                onTap: (){
                  if(userModel.nome==null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                    return;
                  }
                  ProScreen().launch(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.13,
                  height: MediaQuery.of(context).size.width * 0.06,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: MasterColors.red),
                  child: Text(
                    "PRO",
                    style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.035,color: Colors.white, fontWeight: FontWeight.w400),
                  ),
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
                    border: Border.all(color: Color.fromARGB(255, 150, 150, 150)),
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: TextField(
                    controller: filterController,
                    onChanged: (value){
                      setState(() {

                      });
                    },
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
                            color: Color.fromARGB(255, 150, 150, 150),
                          )),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.03),
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 150, 150, 150), fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Carousel(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01, horizontal: MediaQuery.of(context).size.width * 0.03),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.08,
                    decoration: BoxDecoration(color: MasterColors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.012)),
                    child: Text(
                      "Todos",
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Courses()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01, horizontal: MediaQuery.of(context).size.width * 0.03),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.08,
                      decoration: BoxDecoration(color: MasterColors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.012)),
                      child: Text(
                        "Cursos",
                        style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      toggleFavoritos = !toggleFavoritos;
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01, horizontal: MediaQuery.of(context).size.width * 0.03),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.08,
                      decoration: BoxDecoration(color: toggleFavoritos?MasterColors.black:MasterColors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.012)),
                      child: Text(
                        "Favoritas",
                        style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ProScreen().launch(context);

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01, horizontal: MediaQuery.of(context).size.width * 0.03),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.08,
                      decoration: BoxDecoration(color: MasterColors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.012)),
                      child: Text(
                        "Pro",
                        style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              init?StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Categories").snapshots(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      List<Widget> widgets = [];
                      for(var doc in snapshot.data.docs){
                        if(doc["name"].toString().contains(filterController.text)){
                          widgets.add(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                      child: Text(
                                        doc["name"],
                                        style: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.06),
                                      )),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: StreamBuilder(
                                          stream: FirebaseFirestore.instance.collection("Images").where("category", isEqualTo: doc["name"]).snapshots(),
                                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              List<Widget> listImages = [];
                                              for (var element in snapshot.data.docs) {
                                                if(listFavoritados["salvos"].contains(element["path"])||toggleFavoritos == false){
                                                  listImages.add(HomeImage(element["path"], listFavoritados, ()async{
                                                    if(listFavoritados["salvos"].contains(element["path"])){
                                                      listFavoritados["salvos"].remove(element["path"]);
                                                    }else{
                                                      listFavoritados["salvos"].add(element["path"]);
                                                    }
                                                    await saveFavoritos();
                                                    setState(() {

                                                    });
                                                  }));
                                                }

                                              }
                                              return Row(
                                                children: listImages,
                                              );
                                            } else if (snapshot.hasError) {
                                              return Icon(Icons.error_outline);
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          })),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.03,)
                                ],
                              )
                          );
                        }
                      }
                      return Column(
                        children: widgets,
                      );
                    }else{
                      return Container();
                    }

              }):Container()
            ],

          ),
        ),
      ),
    );
  }
}
