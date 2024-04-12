import 'package:goldcalc/controllers/pers/fs_cont.dart';
import 'package:goldcalc/controllers/pers/pers_contr.dart';

class GetHistoryMethod {
  List<String> historyList = [];

  PersistenceController persistenceController = FirestoreController();

  Future<List<String>> getAllHistory() async {
    return persistenceController.getAllData();
  }
}

