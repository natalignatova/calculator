import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:core';
import 'package:goldcalc/controllers/add_hist_contr.dart';

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
        stringToHistory = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}\n  $hist$txtDisplay';
        addHistory.addItemHistory(stringToHistory);
      } else if ((RegExp(r"[\/x+\-]").allMatches(hist)).isEmpty) {
        txtDisplay = (double.parse(hist) * 0.01).toString();
        hist += btnVal;
        stringToHistory = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}\n  $hist = $txtDisplay';
        addHistory.addItemHistory(stringToHistory);
      } else {
        txtDisplay = "Error";
      }
    } else {
      hist += btnVal;

      if (btnVal == "=") {
        expression = hist.substring(0, hist.length - 1);
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();

          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          txtDisplay = '${exp.evaluate(EvaluationType.REAL, cm)}';
          stringToHistory = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}\n  $hist$txtDisplay';
          addHistory.addItemHistory(stringToHistory);
        } catch (e) {
          txtDisplay = "Error";

        }
      }
    }

    updateStateCallback();
  }
}