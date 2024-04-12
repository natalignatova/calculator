import 'package:flutter/material.dart';
import 'package:goldcalc/widgets/clc_button.dart';
import 'package:goldcalc/screens/mile_to_km.dart';
import 'package:goldcalc/screens/gсhistory_screen.dart';
import 'dart:core';
import 'package:goldcalc/controllers/calc_contr.dart';
import 'package:goldcalc/controllers/add_hist_contr.dart';

class GoldCalcScreen extends StatefulWidget {
  const GoldCalcScreen({super.key});

  @override
  State<GoldCalcScreen> createState() => _GoldCalcScreenState();
}

class _GoldCalcScreenState extends State<GoldCalcScreen> {
  late GoldCalcMethod calcMethod;
  late AddHistoryMethod addHistory;

  @override
  void initState() {
    super.initState();
    addHistory = AddHistoryMethod(updateStateCallback: () {
      setState(() {});
    });
    calcMethod = GoldCalcMethod(addHistory: addHistory, updateStateCallback: () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'G O L D  C A L C U L A T O R',
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
          icon: Icon(Icons.history,color: Color(0xFFD4AF37)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GoldCalcHistory()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MileToKm()));
            },
            icon: Icon(Icons.straighten, color: Color(0xFFD4AF37)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  //txtDisplay,
                  calcMethod.txtDisplay,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFFD4AF37),
                    fontSize: 50,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  //hist,
                  calcMethod.hist,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0x7FD4AF37),
                    fontSize: 32,
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: 'AC',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '%',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: 'DEL',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '/',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '7',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '8',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '9',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: 'x',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '4',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '5',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '6',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '-',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '1',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '2',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '3',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '+',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: calcMethod.btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '00',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '0',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '.',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: calcMethod.btnClick),
                ClcButton(
                    txt: '=',
                    txtclr: 0xFF000000,
                    backclr: 0xFFD4AF37,
                    callback: calcMethod.btnClick)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
