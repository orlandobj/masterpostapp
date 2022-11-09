import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/masterColors.dart';

class MasterTextField extends StatefulWidget {
  const MasterTextField(
      {this.hint,
      this.inputFormatters,
      this.onChanged,
      this.valid = true,
      this.controller,
      this.obscured = false,
      Key key})
      : super(key: key);
  final Function(String) onChanged;
  final bool valid;
  final TextEditingController controller;
  final String hint;
  final List<TextInputFormatter> inputFormatters;
  final bool obscured;
  @override
  State<MasterTextField> createState() => _MasterTextFieldState();
}

class _MasterTextFieldState extends State<MasterTextField> {
  var errorColor = Color.fromARGB(255, 211, 46, 46);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100000)),
      child: TextFormField(
        obscureText: widget.obscured,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        style: TextStyle(
          color: MasterColors.grey[900],
          fontSize: MediaQuery.of(context).size.height * 0.030,
        ),
        onChanged: widget.onChanged,
        decoration: new InputDecoration(
          labelStyle: TextStyle(
              color: widget.valid ? MasterColors.primaryBlue : errorColor,
              fontSize: MediaQuery.of(context).size.height * 0.029,
              height: 0),
          hintText: widget.hint,
          errorStyle: TextStyle(fontSize: 0),
          hintStyle: TextStyle(
              color: MasterColors.primaryBlue,
              fontSize: MediaQuery.of(context).size.height * 0.02,
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
    );
  }
}
