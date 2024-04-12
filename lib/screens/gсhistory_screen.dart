import 'package:flutter/material.dart';
import 'package:goldcalc/screens/gc_screen.dart';
import 'package:goldcalc/controllers/get_hist_contr.dart';

class GoldCalcHistory extends StatefulWidget {
  const GoldCalcHistory({Key? key}) : super(key: key);

  @override
  State<GoldCalcHistory> createState() => _GoldCalcHistory();
}

class _GoldCalcHistory extends State<GoldCalcHistory> {
  late GetHistoryMethod getHistory;
  List<String> historyList = [];

  @override
  void initState() {
    super.initState();
    getHistory = GetHistoryMethod();
    loadHistory();
  }

  // Метод для загрузки истории из Firestore и обновления состояния виджета
  Future<void> loadHistory() async {
    List<String> history = await getHistory.getAllHistory(); // Получаем историю из Firestore
    setState(() {
      historyList = history; // Обновляем состояние виджета
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'G O L D  H I S T O R Y',
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
          icon: Icon(Icons.calculate, color: Color(0xFFD4AF37)),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GoldCalcScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        // Обернуть контейнер в SingleChildScrollView
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              ListView.builder(
                shrinkWrap: true,
                // ListView занимает только необходимое пространство
                physics: NeverScrollableScrollPhysics(),
                // Отключает прокрутку ListView, так как уже есть SingleChildScrollView
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  return Text(
                    historyList[index],
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}