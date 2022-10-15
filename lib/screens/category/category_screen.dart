import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:nb_utils/nb_utils.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Map categories = {
    "acai": false,
    "pizza": false,
    "lanche": false,
    "bebida": false,
    "japonesa": false,
    "sobremesa": false,
    "saudavel": false,
    "brasileira": false,
  };

  categoryRow(icon, category, text) {
    return (Row(
      children: [
        SizedBox(
          width:MediaQuery.of(context).size.width*0.05,
          child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: MasterColors.red,
              value: categories[category],
              onChanged: (value) {
                setState(() {
                  categories[category] = value;
                });
              }),
        ),
        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
        Icon(icon),
        SizedBox(width: MediaQuery.of(context).size.width*0.02,),

        Text(text)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06, vertical: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              Text(
                "Mão na massa!",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, color: MasterColors.red, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text('Qual é o seu ramo?', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07, fontWeight: FontWeight.w300)),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              Text("Selecione uma ou mais categorias abaixo. Não se preocupe, você poderá alterar no futuro.",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, fontWeight: FontWeight.w400)),
              categoryRow(Icons.rice_bowl_rounded, "acai", "Açaí"),
              categoryRow(Icons.local_pizza_outlined, "pizza", "Pizza"),
              categoryRow(FontAwesomeIcons.hamburger, "lanche", "Lanches"),
              categoryRow(FontAwesomeIcons.wineBottle, "bebida", "Bebidas"),
              categoryRow(FontAwesomeIcons.fish, "japonesa", "Japonesa"),
              categoryRow(FontAwesomeIcons.candyCane, "sobremesa", "Sobremesa"),
              categoryRow(FontAwesomeIcons.appleAlt, "saudavel", "Saudável"),
              categoryRow(FontAwesomeIcons.globeAmericas, "brasileira", "Brasileira ou internacional"),
              GestureDetector(
                onTap: ()async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("categories", jsonEncode(categories));
                  HomeScreen().launch(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.1),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width*0.1,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Começar", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.05),),
                  decoration: BoxDecoration(
                    color: MasterColors.red,
                    borderRadius: BorderRadius.circular(10000)
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
