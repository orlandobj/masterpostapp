import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:masterpost/screens/cadastro/cadastro_screen.dart';
import 'package:masterpost/stores/login_store.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:masterpost/utils/myDialog.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../perfil/perfil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
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
    if (userModel.nome != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Perfil()));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      //var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50SWQiOiI1N2Q5OWU3YWYzNmQyODMxMmY5NDY3NTEiLCJ1c2VySWQiOiI2MDZiNmE3NTBhNWQ4ZjIzYTNiNDA3NzYiLCJ1c2VyIjoiNjA2YjZhNzUwYTVkOGYyM2EzYjQwNzc2IiwibmFtZSI6IkJydW5vIEZyYW56b25pIiwiZW1haWwiOiJicnVuby5mcmFuem9uaUBnbG9iYWxib3QuY29tLmJyIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uZ2xvYmFsYm90LmFpL2dhcmFnZS9pbWFnZXMvMTYyNjM1ODAyOTY3MWJydW5vMi5qcGciLCJyb2xlIjoiVVgvVUkgRGVzaWduZXIiLCJpYXQiOjE2MzA5NDU3MTQsImV4cCI6MTYzODcyMTcxNH0.m_cXpX5xB1t0c5fUzzKIn-gA3_H_IKNgasm2DKW8RoQ";
      var remember = value.getString("remember") ?? "";
      print(remember);
      if (remember == "1") {
        emailController.text = value.getString("email") ?? "";
        senhaController.text = value.getString("pass") ?? "";
        loginStore.setEmail(emailController.text);
        loginStore.setPass(senhaController.text);
        loginStore.toggleRemember();
      }
    });
    // Future.delayed(Duration(seconds: 2)).then((value) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: isLoading
              ? MasterColors.BackgroundIntroColor
              : MasterColors.grey[50],
          body: Observer(
            builder: (context) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                      child: Image.asset(
                        "images/intro.png",
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 400),
                      vsync: this,
                      child: isLoading
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Center(
                                child: failedAccess
                                    ? Text(
                                        "Você está fora de sua jornada!",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.042,
                                            color: Colors.white),
                                      )
                                    : CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100000)),
                                        child: TextFormField(
                                          controller: emailController,
                                          onChanged: (value) {
                                            loginStore.setEmail(value);
                                            loginStore.checkEmailValid(false);
                                          },
                                          style: TextStyle(
                                            color: MasterColors.grey[900],
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.028,
                                          ),
                                          decoration: new InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            hintText: "E-mail",
                                            errorText:
                                                _invalid ? "inválido!" : null,
                                            hintStyle: TextStyle(
                                                color: MasterColors.primaryBlue,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                fontWeight: FontWeight.bold),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        )),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        loginStore.emailValid
                                            ? ""
                                            : "Email inválido",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 46, 46),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100000)),
                                      child: TextFormField(
                                        controller: senhaController,
                                        style: TextStyle(
                                          color: MasterColors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.030,
                                        ),
                                        onChanged: (value) {
                                          loginStore.setPass(value);
                                          loginStore.checkPassValid(false);
                                        },
                                        obscureText: _obscureText,
                                        decoration: new InputDecoration(
                                          labelStyle: TextStyle(
                                              color: loginStore.passValid
                                                  ? MasterColors.primaryBlue
                                                  : errorColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.029,
                                              height: 0),
                                          hintText: "Senha",
                                          errorText:
                                              _invalid ? "inválido!" : null,
                                          errorStyle: TextStyle(fontSize: 0),
                                          suffixIcon: IconButton(
                                            iconSize: 20,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            icon: loginStore.pass.isNotEmpty
                                                ? Icon(
                                                    _obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: Colors.white,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.04,
                                                  )
                                                : Container(),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                          hintStyle: TextStyle(
                                              color: MasterColors.primaryBlue,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              fontWeight: FontWeight.bold),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        loginStore.passValid
                                            ? ""
                                            : "Senha inválida",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 46, 46),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Observer(
                                          builder: (context) => Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: rememberPassword
                                                        ? MasterColors
                                                            .primaryBlue
                                                        : Colors.transparent,
                                                    border: Border(
                                                      top: BorderSide(
                                                          color: MasterColors
                                                              .grey),
                                                      left: BorderSide(
                                                          color: MasterColors
                                                              .grey),
                                                      right: BorderSide(
                                                          color: MasterColors
                                                              .grey),
                                                      bottom: BorderSide(
                                                          color: MasterColors
                                                              .grey),
                                                    ),
                                                  ),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  child: Checkbox(
                                                    value: loginStore.remember,
                                                    onChanged: (value) {
                                                      loginStore
                                                          .toggleRemember();
                                                    },
                                                    side: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    checkColor: MasterColors
                                                        .primaryBlue,
                                                    activeColor: MasterColors
                                                        .primaryBlue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    loginStore.toggleRemember();
                                                  },
                                                  child: Text(
                                                    "Lembrar minha senha",
                                                    style: TextStyle(
                                                        color: MasterColors
                                                            .grey[400],
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Recuperar senha",
                                          style: TextStyle(
                                              color: MasterColors.primaryBlue,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: MasterColors.primaryBlue,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email:
                                                      loginStore.email.trim(),
                                                  password: loginStore.pass)
                                              .then((value) async {
                                            await loginStore
                                                .rememberCredentials();
                                            var user = await FirebaseFirestore
                                                .instance
                                                .collection("Users")
                                                .where("email",
                                                    isEqualTo:
                                                        loginStore.email.trim())
                                                .get();
                                            userModel.email =
                                                user.docs[0]["email"];
                                            userModel.nome =
                                                user.docs[0]["name"];
                                            userModel.pro =
                                                user.docs[0]["pro"].toDate();
                                            Navigator.pop(context);
                                          }).catchError((e) {
                                            print(e);
                                            showMyDialog(context,
                                                "Usuário ou senha inválidos!");
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                              color: MasterColors.primaryBlue,
                                              borderRadius:
                                                  BorderRadius.circular(10000)),
                                          child: Text(
                                            "Entrar",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.054,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Registration()));
                                        },
                                        child: Text(
                                          "Não possui cadastro ainda? Clique aqui e faça já!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: MasterColors.red,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
