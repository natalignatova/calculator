import 'package:flutter/material.dart';
import 'package:goldcalc/widgets/clc_button.dart';
import 'package:goldcalc/screens/mile_to_km.dart';
import 'package:goldcalc/screens/goldcalchistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class GoldCalcScreen extends StatefulWidget {
  const GoldCalcScreen({super.key});

  @override
  State<GoldCalcScreen> createState() => _GoldCalcScreenState();
}

class _GoldCalcScreenState extends State<GoldCalcScreen> {
  late double number1;
  late double number2;
  String operation = '';
  String txtDisplay = '';
  String res = '';
  String hist = '';
  String stringToHistory = '';

  final List<String> notes = [ '00','0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  final List<String> operations = ['DEL', 'AC', '%', '/', '.', 'x', '+', '-', '='];

  //SharedPreferences
  /*
  Future<void> addHistoryToList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    list.add(value);
    await prefs.setStringList(key, list);
  }
  */


  Future<void> addHistoryToList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    list.add(value);
    await prefs.setStringList(key, list);
  }

  void btnClick(String btnVal) {
    if (btnVal == 'AC') {
      txtDisplay = '';
      hist = '';
      number1 = 0;
      number2 = 0;
      res = '';
      operation = '';
    } else if (btnVal == 'DEL') {
      if (res.isNotEmpty) {
        res = res.substring(0, res.length - 1);
        if (operation == '') {
          number1 = double.parse(res);
        } else {
          number2 = double.parse(res.substring(0, res.indexOf(operation)));
        }
      }
    } else if (btnVal == '%') {
      if (res.isNotEmpty) {
        double value = double.parse(res);
        value /= 100;
        res = value.toString();
        if (operation == '') {
          number1 = value;
        } else {
          number2 = value;
        }
      }
    } else if (notes.contains(btnVal)) {
      if (operation == '') {
        res += btnVal;
        number1 = double.parse(res);
      } else if (operation != '') {
        res += btnVal;
        number2 = double.parse(res.substring(res.indexOf(operation) + 1));
      }
    } else if (operations.contains(btnVal)) {
      if (btnVal == '.') {
        if (!res.contains('.')) {
          res += '.';
        }
      } else if (btnVal == '00') {
        if (res.isNotEmpty) {
          res += '00';
        }
      } else if (btnVal == '0') {
        if (res.isNotEmpty) {
          res += '0';
        }
      } else if (btnVal != '=') {
        operation = btnVal;
        hist += '$number1 $operation ';
        txtDisplay = hist;
        res = '';
      } else {
        double result = 0;
        // String resStr ='';
        if (operation == '+') {
          result = 0.000001 * (1000000 * (number1 + number2)).floor();
        } else if (operation == '-') {
          result = 0.000001 * (1000000 * (number1 - number2)).floor();
        } else if (operation == 'x') {
          result = 0.000001 * (1000000 * (number1 * number2)).floor();
        } else if (operation == '/') {
          result = 0.000001 * (1000000 * (number1 / number2)).floor();
        }
        //txtDisplay = result.toString();
        //resStr = result.toStringAsFixed(2);
        hist += '$number2 = $result';
        stringToHistory = hist + ', ' + DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        addHistoryToList('historyGoldCalc', stringToHistory);
        //res = '';
        res = result.toString();
        number1 = result;
        number2 = 0;
        //operation = '';
      }
      // operation = btnVal;
    }

    setState(() {
      txtDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'G O L D  C A L C U L A T O R',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Outfit',
          ),
        ),
        backgroundColor: Color(0xFF000000),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.history,color: Color(0xFFD4AF37)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GoldCalcHistory()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MileToKm()));
            },
            icon: Icon(Icons.straighten, color: Color(0xFFD4AF37)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  txtDisplay,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFFD4AF37),
                    fontSize: 60,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  hist,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0x7FD4AF37),
                    fontSize: 36,
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: 'AC',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '%',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: 'DEL',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '/',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '7',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '8',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '9',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: 'x',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '4',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '5',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '6',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '-',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '1',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '2',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '3',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '+',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '00',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '0',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '.',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '=',
                    txtclr: 0xFF000000,
                    backclr: 0xFFD4AF37,
                    callback: btnClick)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
