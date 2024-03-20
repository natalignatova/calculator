import 'package:flutter/material.dart';
import 'package:goldcalc/screens/gold_calc_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoldCalcHistory extends StatefulWidget {
  const GoldCalcHistory({Key? key}) : super(key: key);

  @override
  State<GoldCalcHistory> createState() => _GoldCalcHistory();
}

class _GoldCalcHistory extends State<GoldCalcHistory> {
  List<String> historyList = [];

  @override
  void initState() {
    super.initState();
    loadHistoryList();
  }

  Future<void> loadHistoryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList('historyGoldCalc');
    if (list != null) {
      setState(() {
        historyList = list;
      });
    }
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
      body: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}