import 'package:currencycalculator/main.dart';
import 'package:currencycalculator/models/currencyDropdown.dart';
import 'package:currencycalculator/models/currency_converter.dart';
import 'package:currencycalculator/repository/currency_repo.dart';
import 'package:currencycalculator/utils/CCWidgets.dart';
import 'package:currencycalculator/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrencyRepository _currencyRepository = CurrencyRepository();
  CurrencyDropDown _selectedCurrency = currencyList[0];
  CurrencyDropDown _selectedCurrency2 = currencyList[1];

  TextEditingController currencyController1 = TextEditingController();
  TextEditingController currencyController2 = TextEditingController();
  String currency1 = currencyList[0].currencyName;
  String currency2 = currencyList[1].currencyName;
  double currencyRate = 0.0;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  convertCurrency(CurrencyConvert ccvert) {

    if (currency1 == 'EUR') {
      double curr = double.parse(currencyController1.text);
      var cc = _currencyRepository.EURtoCurrency(ccvert, curr, currency2);

      print(ccvert.rates.cAD);

      setState(() {
        currencyRate = cc[0];
        currencyController2.text = cc[1].toStringAsFixed(2);
      });
    } else if (currency1 == 'CAD') {
      double curr = double.parse(currencyController1.text);

      var cc = _currencyRepository.CADtoCurrency(ccvert, curr, currency2);

      setState(() {
        currencyRate = cc[0];
        currencyController2.text = cc[1].toStringAsFixed(2);
      });
    } else if (currency1 == 'CHF') {
      double curr = double.parse(currencyController1.text);

      var cc = _currencyRepository.CADtoCurrency(ccvert, curr, currency2);

      setState(() {
        currencyRate = cc[0];
        currencyController2.text = cc[1].toStringAsFixed(2);
      });
    } else if (currency1 == 'USD') {
      double curr = double.parse(currencyController1.text);

      var cc = _currencyRepository.CADtoCurrency(ccvert, curr, currency2);

      setState(() {
        currencyRate = cc[0];
        currencyController2.text = cc[1].toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: height * 0.7,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    appBar(),
                    homeText(),
                    textfield(),
                    currencySelector(),
                    buttonwidget(),
                    underlineText(),
                  ],
                ),
              ),
              Container(
                height: height * 0.6,
                decoration: BoxDecoration(
                    color: kBlueContainer,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      topText(),
                      //SizedBox(height: 20,),
                      LineChart(
                      mainData()
                      ),

                      
                     /*  currencyGraph(),
                      SizedBox(height: 10,),
                      graphDate(),
                       */
                      bottomText()


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
          )),
    );
  }

  Container topText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text('Past 30 Days',
                  style: TextStyle(
                      color: Colors.white
                  ),),
                SizedBox(height: 5,),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kColourGreen),
                ),

              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('Past 90 Days',
                  style: TextStyle(
                      color: Colors.white
                  ),),
                /* Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kColourGreen),
                                ),*/

              ],
            ),
          ),

        ],
      ),
    );
  }

  Container currencyGraph() {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Container(),
          Container(
            child: Column(
                children: List.generate(
                  7,
                      (index) =>
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15, left: 10),
                        child: Container(
                          height: 3,
                          width: 3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white),
                        ),
                      ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                  children: List.generate(
                    11,
                        (index) =>
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, left: 10, right: 15),
                          child: Container(
                            height: 3,
                            width: 3,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white),
                          ),
                        ),
                  )),
            ),
          ),

          Positioned(
            top: 50,
            left: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  height: 50,
                  //width: 100,
                  decoration: BoxDecoration(
                    color: kColourGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('15 Jun',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      Text(
                        '1 $currency1 =  ${currencyRate.toStringAsFixed(
                            2)} $currency2',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 10,
                  width: 10,
                  decoration:
                  BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: kColourGreen),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container graphDate() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('01 Jun',
            style: TextStyle(
              color: Colors.white,
            ),),
          Text('07 Jun',
            style: TextStyle(
              color: Colors.white,
            ),),
          Text('15 Jun',
            style: TextStyle(
              color: Colors.white,
            ),),
          Text('21 Jun',
            style: TextStyle(
              color: Colors.white,
            ),),
        ],
      ),
    );
  }

  Container bottomText() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        'Get rate alerts straight to your email inbox',
        style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white),
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
              height: 5,
              width: 5,
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
          controller: currencyController1,
          suffixCurrency: currency1,
        ),
        SizedBox(
          height: 10,
        ),
        CCTextField(controller: currencyController2, suffixCurrency: currency2),
      ],
    );
  }

  buttonwidget() {
    return Builder(
        builder: (BuildContext context) {
          return CCButton(
            onPressed: () async {
              var ccTxt1 = currencyController1.text;
              var ccTxt2 = currencyController2.text;

              if (ccTxt1.isEmpty) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Input Currency')));

                return;
              } else {
                var cc =
                await _currencyRepository.currencyXchange2(
                    currency1, currency2);

                var cd = cc.rates.cAD;

                print(cd);

                convertCurrency(cc);
              }
            },
            buttonText: 'Convert',
            textColor: Colors.white,
            buttonColor: kColourGreen,
          );
        }
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
                  //hint: Text('Select Currency'),
                  value: _selectedCurrency,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value;
                      currency1 = _selectedCurrency.currencyName;
                    });
                  },
                  items: currencyList
                      .map(
                        (curr) => DropdownMenuItem<CurrencyDropDown>(
                            value: curr,
                            child: Row(
                              children: [
                                curr.icon,
                                SizedBox(
                                  width: 15,
                                ),
                                Text(curr.currencyName),
                              ],
                            )),
                      )
                      .toList(),
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
                  hint: Text('Select Currency'),
                  value: _selectedCurrency2,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency2 = value;
                      currency2 = _selectedCurrency2.currencyName;
                    });
                  },
                  items: currencyList
                      .map(
                        (curr) => DropdownMenuItem<CurrencyDropDown>(
                            value: curr,
                            child: Row(
                              children: [
                                curr.icon,
                                SizedBox(
                                  width: 15,
                                ),
                                Text(curr.currencyName),
                              ],
                            )),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  underlineText() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        'Mid-Market exchange rate at 13:30 UTC',
        style: TextStyle(
            color: kColourBlue,
            decoration: TextDecoration.underline,
            decorationColor: kColourBlue),
      ),
    );
  }
LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 3,
            dashArray: [5,10]
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
              const TextStyle(color: Colors.white70, fontSize: 14),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '31 DEC';
              case 7:
                return '7 JAN';
              case 11:
                return '15 JAN';
                case 15:
                return '23 JAN';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 22,
          margin: 12,
        ),
      ),
      borderData:
          FlBorderData(show: false, border: Border(left: BorderSide(color: Colors.white, width: 0.5),
          bottom: BorderSide(color: Colors.white, width: 1))),
      minX: 0,
      maxX: 16,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(5.8, 3.1),
            FlSpot(6, 4),
            FlSpot(7.5, 3),
            FlSpot(10, 4),
             FlSpot(11.2, 4),
            FlSpot(13.6, 3),
            FlSpot(15, 4),
            
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }


}
