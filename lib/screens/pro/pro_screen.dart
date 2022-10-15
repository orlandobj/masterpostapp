import 'package:flutter/material.dart';
import 'package:masterpost/screens/home/home_screen.dart';
import 'package:masterpost/screens/pro/purchase_concluded.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:pay/pay.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key key}) : super(key: key);

  @override
  _ProScreenState createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  benefits(prefix, text) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: MasterColors.red,
          size: MediaQuery.of(context).size.width * 0.07,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Container(
          child: Flexible(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: prefix,
                      style: TextStyle(fontWeight: FontWeight.bold, color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.036)),
                  TextSpan(text: text, style: TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.036)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Pay pay = Pay.withAssets(["google_pay.json"]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    HomeScreen().launch(context);
                  },
                  child: Icon(
                    Icons.cancel,
                    color: MasterColors.grey,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/intro.png",
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    Positioned(
                        right: MediaQuery.of(context).size.width * 0.22,
                        top: MediaQuery.of(context).size.width * 0.05,
                        child: Opacity(
                          opacity: 0.8,
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.013, horizontal: MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(color: MasterColors.grey[900], borderRadius: BorderRadius.circular(100000)),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Text(
                                "PRO",
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Acelere ",
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: MasterColors.red, fontWeight: FontWeight.w600),
                    ),
                    Text("suas vendas e aprenda mais",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.0545,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                benefits("Acesso ilimitado ", "a cursos de Marketing Digital focado no seu nicho"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                benefits("Templates ", "exclusivos"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                benefits("Acessoria ", "exclusiva para dúvidas"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                benefits("Brindes ", "e sorteios"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                benefits("Teste grátis ", "de 15 dias"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Assinatura mensal",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                    ),
                                    Text("R\$49,90", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    FutureBuilder<bool>(
                                      future: pay.userCanPay(PayProvider.google_pay),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.data == true) {
                                            return RawGooglePayButton(
                                                type: GooglePayButtonType.pay,
                                                onPressed: () async{
                                                  try{
                                                    var result = await pay.showPaymentSelector(provider: PayProvider.google_pay, paymentItems: [
                                                      PaymentItem(
                                                          amount: "0.20",
                                                          label: "Assinatura anual",
                                                          type: PaymentItemType.total,
                                                          status: PaymentItemStatus.final_price)
                                                    ]);
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseConcluded()));

                                                  }catch(e){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseConcluded()));

                                                  }


                                                });
                                          } else {
                                            return Container();
                                          }
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          border: Border.all(color: MasterColors.grey[900], width: MediaQuery.of(context).size.width * 0.005)),
                      child: Text(
                        "   R\$ 49,90/ mês",
                        style: TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.036,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Assinatura anual",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                    ),
                                    Text("R\$107,90", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    FutureBuilder<bool>(
                                      future: pay.userCanPay(PayProvider.google_pay),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.data == true) {
                                            return RawGooglePayButton(
                                                type: GooglePayButtonType.pay,
                                                onPressed: () async{
                                                  try{
                                                    var result = await pay.showPaymentSelector(provider: PayProvider.google_pay, paymentItems: [
                                                      PaymentItem(
                                                          amount: "0.20",
                                                          label: "Assinatura anual",
                                                          type: PaymentItemType.total,
                                                          status: PaymentItemStatus.final_price)
                                                    ]);
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseConcluded()));
                                                  }catch(e){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseConcluded()));

                                                  }



                                                });
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseConcluded()));

                                          } else {
                                            return Container();
                                          }
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02, horizontal: MediaQuery.of(context).size.width * 0.04),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          border: Border.all(color: MasterColors.grey[900], width: MediaQuery.of(context).size.width * 0.005)),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "R\$ 107,90 / ano",
                                style:
                                    TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "R\$ 8,99 / mês",
                                style: TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.04),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "   Economize",
                                style:
                                    TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "   86%",
                                style: TextStyle(color: MasterColors.grey[900], fontSize: MediaQuery.of(context).size.width * 0.05),
                              ),
                            ],
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
      ),
    );
  }
}
