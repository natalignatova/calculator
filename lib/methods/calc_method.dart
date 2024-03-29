import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:core';
import 'package:goldcalc/methods/add_history_method.dart';

class GoldCalcMethod {
  String txtDisplay = '';
  String hist = '';
  String stringToHistory = '';
  String expression = '';

  late AddHistoryMethod addHistory;
  late VoidCallback updateStateCallback;

  GoldCalcMethod({
    required this.updateStateCallback,
    required this.addHistory,
  });

  void setUpdateStateCallback(VoidCallback callback) {
    updateStateCallback = callback;
  }

  void btnClick(String btnVal) {
    //setState(() {
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
        addHistory.addHistoryToList('historyGoldCalc', stringToHistory);
      } else if ((RegExp(r"[\/x+\-]").allMatches(hist)).isEmpty) {
        txtDisplay = (double.parse(hist) * 0.01).toString();
        hist += btnVal;
        stringToHistory = hist + '=' + txtDisplay + ', ' +
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        addHistory.addHistoryToList('historyGoldCalc', stringToHistory);
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
          addHistory.addHistoryToList('historyGoldCalc', stringToHistory);
        } catch (e) {
          txtDisplay = "Error";
          // print('Ошибка: $e');
        }
      }
    }
    // });
    updateStateCallback();
  }
}