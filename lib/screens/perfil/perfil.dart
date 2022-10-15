import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:masterpost/stores/login_store.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  bool _invalid = false;
  bool successAuth = true;
  LoginStore loginStore;
  final _formKey = GlobalKey<FormState>();
  var errorColor = Color.fromARGB(255, 211, 46, 46);
  bool isLoading = false;
  bool rememberPassword = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  bool failedAccess = false;
  UserModel userModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
    userModel = Provider.of<UserModel>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: isLoading ? MasterColors.BackgroundIntroColor : MasterColors.grey[50],
          body: Observer(
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    child: Image.asset(
                      "images/intro.png",
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Email: ",
                              style: TextStyle(color: MasterColors.red, fontSize: MediaQuery.of(context).size.width * 0.05),
                            ),
                            Text(userModel.email, style: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.05))
                          ],
                        ),
                        Row(
                          children: [
                            Text("Nome: ", style: TextStyle(color: MasterColors.red, fontSize: MediaQuery.of(context).size.width * 0.05)),
                            Text(userModel.nome, style: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.05))
                          ],
                        ),
                        Row(
                          children: [
                            Text("Pro: ", style: TextStyle(color: MasterColors.red, fontSize: MediaQuery.of(context).size.width * 0.05)),
                            Text(userModel.pro.isAfter(DateTime.now()) ? "Sim" : "Não",
                                style: TextStyle(color: MasterColors.black, fontSize: MediaQuery.of(context).size.width * 0.05))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(color: MasterColors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width)),
                    child: GestureDetector(
                        onTap: (){
                          userModel.nome = null;
                          userModel.email = null;
                          userModel.pro = null;
                          Navigator.pop(context);
                        },
                        child: Text("Deslogar", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05))),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
