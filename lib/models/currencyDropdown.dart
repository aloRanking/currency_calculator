import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class CurrencyDropDown{

  String currencyName;
  Image icon;

  CurrencyDropDown({this.currencyName, this.icon});


}

List<CurrencyDropDown> currency = [
  CurrencyDropDown(currencyName: 'CAD', icon: Image.asset('images/canada.png', height: 20, width: 20, )),
  CurrencyDropDown(currencyName: 'CHF',icon: Image.asset('images/switzerland.png',height: 20, width: 20 ) ),
  CurrencyDropDown(currencyName: 'EUR', icon: Image.asset('images/united-kingdom.png',height: 20, width: 20 )),
  CurrencyDropDown(currencyName: 'USD', icon: Image.asset('images/united-states.png',height: 20, width: 20 )),
  CurrencyDropDown(currencyName: 'NGN',icon: Image.asset('images/nigeria.png', height: 20, width: 20))
];

