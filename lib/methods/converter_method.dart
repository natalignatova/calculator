import 'package:flutter/material.dart';

class MileToKmMethod {
  String txtDisplayMile = '0';
  String txtDisplayKm = '0';
  final List<String> notes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  VoidCallback updateStateCallback;

  MileToKmMethod({
    required this.updateStateCallback,
  });

  void btnClick(String btnVal) {
    if (btnVal == 'AC') {
      txtDisplayMile = '0';
      txtDisplayKm = '0';
      //res = '';
    } else if (txtDisplayKm.length < 10 || txtDisplayMile.length < 10) {
      if (btnVal == '.') {
        if (!txtDisplayKm.contains('.')) {
          txtDisplayKm += '.';
        }
      } else if (notes.contains(btnVal)) {
        if (txtDisplayKm == '0') {
          txtDisplayKm = btnVal;
        } else {
          txtDisplayKm += btnVal;
        }
        txtDisplayMile =
            (double.parse(txtDisplayKm) * 0.621371).toStringAsFixed(2);
      }
    }

    updateStateCallback();
  }
}