
import 'package:flutter/material.dart';

class CCTextField extends StatelessWidget {
  final String suffixCurrency;

  CCTextField({this.suffixCurrency});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          //fillColor: Color(0xFFA0C1E3),
          suffixText: suffixCurrency
        ),
      ),
    );
  }
}

class CCButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final Color textColor;
  final Color buttonColor;

  CCButton({this.onPressed, this.buttonText, this.textColor, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: Container(
        width: double.infinity,
        height: 60,
        child: RaisedButton(
          onPressed: onPressed,
          child: Text(buttonText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800
          ),),
          textColor: textColor,
          color: buttonColor,
        ),
      ),
    );
  }
}

