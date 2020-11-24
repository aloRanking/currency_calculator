import 'package:currencycalculator/utils/CCWidgets.dart';
import 'package:currencycalculator/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              appBar(),
              homeText(),
              textfield(),
              buttonwidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: Color(0xFF01B252),),

        Text('Sign Up',
        style: TextStyle(
          color: Color(0xFF01B252),

        ),)
        
      ],
    );
  }

  homeText() {

    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'Calculator',
                style: TextStyle(
                    color: kColourBlue,
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(
                'Currency',
                style: TextStyle(
                  color: kColourBlue,
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),
              ),

            ],
          ),


          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kColourGreen
              ),
            ),
          )
        ],
      ),
    );
  }

  textfield() {

    return Column(
      children: [
        CCTextField(suffixCurrency: 'EUR',),
        SizedBox(height: 10,),
        CCTextField(suffixCurrency: 'PLN',),
      ],
    );
  }

  buttonwidget() {
    return CCButton(
      onPressed: (){},
      buttonText: 'Convert',
      textColor: Colors.white,
      buttonColor: kColourGreen,
    );
  }


}
