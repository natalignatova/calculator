import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';


class AddHistoryMethod {
  List<String> historyList = [];

  VoidCallback updateStateCallback;

  AddHistoryMethod({
    required this.updateStateCallback,
  });

  void setUpdateStateCallback(VoidCallback callback) {
    updateStateCallback = callback;
  }

  Future<void> addHistoryToList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    list.add(value);
    await prefs.setStringList(key, list);
    updateStateCallback();
  }


}