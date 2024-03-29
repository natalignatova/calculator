import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class GetHistoryMethod {
  List<String> historyList = [];

  VoidCallback updateStateCallback;

  GetHistoryMethod({
    required this.updateStateCallback,
  });

  void setUpdateStateCallback(VoidCallback callback) {
    updateStateCallback = callback;
  }

  Future<void> loadHistoryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList('historyGoldCalc');
    if (list != null) {
      historyList = list;
    }
    updateStateCallback();
  }
}