import 'package:currencycalculator/models/currencyDropdown.dart';
import 'package:currencycalculator/utils/CCWidgets.dart';
import 'package:currencycalculator/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrencyDropDown _selectedCurrency;
  CurrencyDropDown _selectedCurrency2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              appBar(),
              homeText(),
              textfield(),
              currencySelector(),
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
        Icon(
          Icons.menu,
          color: Color(0xFF01B252),
        ),
        Text(
          'Sign Up',
          style: TextStyle(
            color: Color(0xFF01B252),
          ),
        )
      ],
    );
  }

  homeText() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
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
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Currency',
                style: TextStyle(
                    color: kColourBlue,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 10,
              width: 10,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: kColourGreen),
            ),
          )
        ],
      ),
    );
  }

  textfield() {
    return Column(
      children: [
        CCTextField(
          suffixCurrency: 'EUR',
        ),
        SizedBox(
          height: 10,
        ),
        CCTextField(
          suffixCurrency: 'PLN',
        ),
      ],
    );
  }

  buttonwidget() {
    return CCButton(
      onPressed: () {},
      buttonText: 'Convert',
      textColor: Colors.white,
      buttonColor: kColourGreen,
    );
  }

  currencySelector() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  //color: Colors.cyan,
                  border: Border.all(color: Colors.grey[350])),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<CurrencyDropDown>(
                  value: _selectedCurrency,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value;
                    });
                  },
                  items: currency.map(
                        (curr) =>
                        DropdownMenuItem<CurrencyDropDown>(
                            value: curr, child: Text(curr.currencyName)),
                  ).toList(),
                ),
              ),
            ),
          ),

          Icon(Icons.repeat),

          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  //color: Colors.cyan,
                  border: Border.all(color: Colors.grey[350])),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<CurrencyDropDown>(
                  value: _selectedCurrency2,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency2 = value;
                    });
                  },
                  items: currency.map(
                        (curr) =>
                        DropdownMenuItem<CurrencyDropDown>(
                            value: curr, child: Text(curr.currencyName)),
                  ).toList(),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
