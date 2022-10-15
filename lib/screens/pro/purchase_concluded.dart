import 'package:flutter/material.dart';

import '../../utils/masterColors.dart';

class PurchaseConcluded extends StatelessWidget {
  const PurchaseConcluded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MasterColors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: MediaQuery.of(context).size.width * 0.6,
                color: Colors.white,
              ),
              Text(
                "Compra concluída!",
                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.07, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    "Continuar",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, color: MasterColors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
