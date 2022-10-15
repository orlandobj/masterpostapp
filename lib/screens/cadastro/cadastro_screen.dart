import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:masterpost/screens/category/category_screen.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/screens/login/login_screen.dart';
import 'package:masterpost/stores/cadastro_store.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:masterpost/utils/myDialog.dart';
import 'package:masterpost/widgets/master_text_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class Registration extends StatefulWidget {
  Registration({this.firstAccess=false});
  bool firstAccess;
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool checked = true;
  bool loading = false;
  CadastroStore cadastroStore = new CadastroStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: MasterColors.grey[50]),
          child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(
                      "images/intro.png",
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    //CommonLogo(),
                    HeightBox(10),
                    MasterTextField(
                      hint: "Nome completo",
                      onChanged: cadastroStore.setNome,
                    ),
                    MasterTextField(
                      hint: "Email",
                      onChanged: cadastroStore.setEmail,
                    ),
                    MasterTextField(
                      hint: "CPF",
                      inputFormatters: [
                        new MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r"[0-9]")})
                      ],
                      onChanged: cadastroStore.setCpf,
                    ),
                    MasterTextField(
                      hint: "Telefone",
                      inputFormatters: [
                        new MaskTextInputFormatter(mask: "(##) #####-####", filter: {"#": RegExp(r"[0-9]")})
                      ],
                      onChanged: cadastroStore.setTelefone,
                    ),
                    MasterTextField(
                      hint: "Senha",
                      inputFormatters: [
                      ],
                      obscured: true,
                      onChanged: cadastroStore.setPass,
                    ),
                    MasterTextField(
                      hint: "Senha",
                      inputFormatters: [
                      ],
                      obscured: true,
                      onChanged: cadastroStore.setConfirmPass,
                    ),
                    HStack([
                      Checkbox(
                        value: checked,
                        onChanged: (bool value) {
                          checked = value;
                        },
                      ),
                      "Aceitar e continuar".text.make().py16()
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                      GestureDetector(
                          onTap: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool("firstAccess", false);
                            HomeScreen().launch(context);
                          },
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(10000), border: Border.all(color: MasterColors.red, width: MediaQuery.of(context).size.width*0.005)),
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.054, color:MasterColors.red, fontWeight: FontWeight.w500),
                              ),
                            ),

                          )),
                      Observer(
                        builder: (context) => GestureDetector(
                          onTap: loading?(){}:() async {
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                child: Container(width: MediaQuery.of(context).size.width*0.8, height: MediaQuery.of(context).size.width*0.8, child: Center(child: CircularProgressIndicator())),
                              );
                            });
                            setState(() {
                              loading = true;
                            });
                            try {
                              UserCredential userCredential =
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: cadastroStore.email.trim(), password: cadastroStore.pass);
                              await FirebaseAuth.instance.signInWithEmailAndPassword(email: cadastroStore.email.trim(), password: cadastroStore.pass);
                              FirebaseFirestore.instance.collection('Users').add({
                                "name": cadastroStore.nome,
                                "email": cadastroStore.email.trim(),
                                "phone": cadastroStore.telefone,
                                "cpf": cadastroStore.cpf,
                                "pro": DateTime.now(),
                                "created_at": DateTime.now(),
                              });
                              await showMyDialog(context, "Usuário criado com sucesso!");
                              CategoryScreen().launch(context);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool("firstAccess", false);
                            } on FirebaseAuthException catch (e) {
                              Navigator.of(context).pop();
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                await showMyDialog(context, "Usuário já cadastrado!");
                              }else{
                                await showMyDialog(context, e.code);
                              }
                            } catch (e) {
                              print(e);
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(color: cadastroStore.isFormValid
                                    ? MasterColors.primaryBlue:Colors.grey, borderRadius: BorderRadius.circular(10000)),
                                child: Text(
                                  "Criar",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.054, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),

                          )

                            ),

                      )
                    ]),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GestureDetector(
                          onTap: () {
                            widget.firstAccess?LoginPage().launch(context):Navigator.of(context).pop();
                          },
                          child: HStack(["Já cadastrado?".text.make(), Text(" Logar", style: TextStyle(color: MasterColors.red),)])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
