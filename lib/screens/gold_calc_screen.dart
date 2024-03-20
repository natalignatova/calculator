import 'package:flutter/material.dart';
import 'package:goldcalc/widgets/clc_button.dart';
import 'package:goldcalc/screens/mile_to_km.dart';
import 'package:goldcalc/screens/goldcalchistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:core';

class GoldCalcScreen extends StatefulWidget {
  const GoldCalcScreen({super.key});

  @override
  State<GoldCalcScreen> createState() => _GoldCalcScreenState();
}

class _GoldCalcScreenState extends State<GoldCalcScreen> {
  String txtDisplay = '';
  String hist = '';
  String stringToHistory = '';
  String expression = '';



  Future<void> addHistoryToList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    list.add(value);
    await prefs.setStringList(key, list);
  }

  void btnClick(String btnVal) {
    setState(() {
      if (btnVal == 'AC') {
        txtDisplay = '';
        hist = '';
        stringToHistory = '';
        expression = '';
      } else if (btnVal == 'DEL') {
        if (hist.isNotEmpty) {
          hist = hist.substring(0, hist.length - 1);
        }
      } else if (btnVal == '%') {
       print(RegExp(r"[\/x+\-]").allMatches(hist));
        if (txtDisplay.isNotEmpty) {
          hist = txtDisplay + '% =';
          txtDisplay = (double.parse(txtDisplay) * 0.01).toString();
          stringToHistory = hist + txtDisplay + ', ' +
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          addHistoryToList('historyGoldCalc', stringToHistory);

        } else if ((RegExp(r"[\/x+\-]").allMatches(hist)).isEmpty) {
          txtDisplay = (double.parse(hist) * 0.01).toString();
          hist += btnVal;
          stringToHistory = hist + '=' + txtDisplay + ', ' +
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          addHistoryToList('historyGoldCalc', stringToHistory);
        } else {
          txtDisplay = "Error";
        }


      } else {
        hist += btnVal;

        if (btnVal == "=") {
            expression = hist.substring(0, hist.length - 1);
            expression = expression.replaceAll('x', '*');
            expression = expression.replaceAll('÷', '/');
            // print(expression);
          try {
            Parser p = Parser();
          //  print(p);
            Expression exp = p.parse(expression);
          //  print(exp);
            ContextModel cm = ContextModel();
            txtDisplay = '${exp.evaluate(EvaluationType.REAL, cm)}';
           // txtDisplay = res.substring(0, 9);;
            stringToHistory = hist + txtDisplay + ', ' +
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
            addHistoryToList('historyGoldCalc', stringToHistory);
          } catch (e) {
            txtDisplay = "Error";
           // print('Ошибка: $e');
          }
        }
      }
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
