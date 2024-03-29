import 'package:flutter/material.dart';
import 'package:goldcalc/screens/gold_calc_screen.dart';
import 'package:goldcalc/methods/get_history_method.dart';

class GoldCalcHistory extends StatefulWidget {
  const GoldCalcHistory({Key? key}) : super(key: key);

  @override
  State<GoldCalcHistory> createState() => _GoldCalcHistory();
}

class _GoldCalcHistory extends State<GoldCalcHistory> {
  late GetHistoryMethod getHistory;


  @override
  void initState() {
    super.initState();
    getHistory = GetHistoryMethod(updateStateCallback: () {
      setState(() {});
    });
    getHistory.loadHistoryList();
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoldCalcScreen()));
          },
        ),
      ),
      body: SingleChildScrollView( // Обернуть контейнер в SingleChildScrollView
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              ListView.builder(
                shrinkWrap: true, // ListView занимает только необходимое пространство
                physics: NeverScrollableScrollPhysics(), // Отключает прокрутку ListView, так как уже есть SingleChildScrollView
                itemCount: getHistory.historyList.length,
                itemBuilder: (context, index) {
                  return Text(
                    getHistory.historyList[index],
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