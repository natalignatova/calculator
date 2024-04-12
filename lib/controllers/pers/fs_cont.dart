import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goldcalc/controllers/pers/pers_contr.dart';
import '../../firebase_options.dart';

class FirestoreController implements PersistenceController {
  late FirebaseFirestore db;

  @override
  Future<List<String>> getAllData() async {
    await init();
    QuerySnapshot snapshot = await db.collection('goldcalcdatabase').get();
    List<String> history = snapshot.docs.map((mem) {
      Map<String, dynamic> data = mem.data() as Map<String, dynamic>;
      return data['goldcalchistory'].toString();
    }).toList();
    history.sort((a, b) => b.substring(0, 19).compareTo(a.substring(0, 19)));
    return history;
  }

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    db = FirebaseFirestore.instance;
  }

  @override
  Future<void> saveData(String gchistory) async {
    await init();
    await db.collection('goldcalcdatabase').add({'goldcalchistory': gchistory});
  }

}