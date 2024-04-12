import 'package:flutter/material.dart';
import 'package:goldcalc/controllers/pers/fs_cont.dart';
import 'package:goldcalc/controllers/pers/pers_contr.dart';
import 'dart:core';


class AddHistoryMethod extends ChangeNotifier{
  //List<String> historyList = [];

  PersistenceController persistenceController = FirestoreController();

  Future<void> addItemHistory(String historyItem) async {
     await persistenceController.saveData(historyItem);
    notifyListeners();
  }

  VoidCallback updateStateCallback;

  AddHistoryMethod({
    required this.updateStateCallback,
  });

  void setUpdateStateCallback(VoidCallback callback) {
    updateStateCallback = callback;
  }

}