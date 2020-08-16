import 'dart:io' show Platform;

import 'package:bitcoin_ticker/utility/convertNow.dart';
import 'package:bitcoin_ticker/utility/multiCardLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'coin_data.dart' as coin;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  ConvertNow convertNow = ConvertNow();
  multiCardLoader multi = multiCardLoader();
  var convertFrom;
  var convertTo = 'USD';
  double value;
  double value1;
  double value2;
  String unit;
  /*
  * Platform Specific: Android Picker
  * */
  DropdownButton<String> androidPicker() {
    int length = coin.currenciesList.length;
    List<DropdownMenuItem<String>> itemList = [];
    for (int i = 0; i < length; i++) {
      var x = DropdownMenuItem(
        child: Text(coin.currenciesList[i]),
        value: coin.currenciesList[i],
      );
      itemList.add(x);
    }
    return DropdownButton<String>(
      value: convertTo,
      items: itemList,
      onChanged: (value) {
        setState(() {
          convertTo = value;
        });
      },
    );
  }

  /*
  * Platform Specific: IOS Picker
  * */
  CupertinoPicker iosPicker() {
    int length = coin.currenciesList.length;
    List<Text> itemList = [];
    for (int i = 0; i < length; i++) {
      var x = Text(coin.currenciesList[i]);
      itemList.add(x);
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) async {
        int index = value;
        String getElement = coin.currenciesList[index];
        convertTo = getElement;
        updateData();
        updateData1();
        updateData2();
      },
      children: itemList,
    );
  }

  /*
  * Fetch data
  * */
  updateData() async {
    var data = await convertNow.getConData('BTC', '$convertTo');
    setState(() {
      if (data != null) {
        double ve = data['rate'];
        value = double.parse(ve.toStringAsFixed(6));
        unit = convertTo;
      }
    });
  }

  updateData1() async {
    var data = await convertNow.getConData('ETH', '$convertTo');
    setState(() {
      if (data != null) {
        double ve = data['rate'];
        value1 = double.parse(ve.toStringAsFixed(6));
        unit = convertTo;
      }
    });
  }

  updateData2() async {
    var data = await convertNow.getConData('LTC', '$convertTo');
    setState(() {
      if (data != null) {
        double ve = data['rate'];
        value2 = double.parse(ve.toStringAsFixed(6));
        unit = convertTo;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateData();
    updateData1();
    updateData2();
  }

  @override
  Widget build(BuildContext context) {
    return value == null
        ? Scaffold(body: Center(
            child: SpinKitFadingCube(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text('🤑 Coin Ticker'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                multi.drawCard(value, unit, 'BTC'),
                multi.drawCard(value1, unit, 'ETH'),
                multi.drawCard(value2, unit, 'LTC'),
                SizedBox(
                  height: 384.0,
                ),
                Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  /*
                    * Platform Checker
                    * */
                  child: Platform.isIOS ? androidPicker() : iosPicker(),
                ),
              ],
            ),
          );
  }
}
