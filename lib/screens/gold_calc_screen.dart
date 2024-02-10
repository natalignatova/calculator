import 'package:flutter/material.dart';
import 'package:goldcalc/widgets/clc_button.dart';

class GoldCalcScreen extends StatefulWidget {
  const GoldCalcScreen({super.key});

  @override
  State<GoldCalcScreen> createState() => _GoldCalcScreenState();
}

class _GoldCalcScreenState extends State<GoldCalcScreen> {
  double number1 = 0;
  double number2 = 0;
  String operation = '';
  String txtDisplay = '';
  String res = '';
  String hist = '';
  final notes = <String>['00','0','1','2','3','4','5','6','7','8','9'] ;

  void btnClick(String btnVal) {
    //print(btnVal);
    if (btnVal == 'AC') {
      txtDisplay = '';
      hist = '';
      number1 = 0;
      number2 = 0;
      res = '';
      operation = '';
    } else if (btnVal == '/' || btnVal == 'x' || btnVal == '-' || btnVal == '+' ){
      operation = btnVal;
    } else if (notes.indexOf(btnVal)!=-1) {
       if(operation !='')    {

       }
    }


      /*
    } else if (btnVal != '%' &&
        btnVal != 'DEL' &&
        btnVal != '/' &&
        btnVal != 'x' &&
        btnVal != '-' &&
        btnVal != '+' &&
        btnVal != '=') {
      if (btnVal == '.' && !txtDisplay.contains('.')) {
        if (txtDisplay == '') {
          txtDisplay = '0.';
        } else {
          txtDisplay += btnVal;
        }
        hist = txtDisplay;
      } else if (btnVal == '00') {
        txtDisplay = '0';
      } else {
        txtDisplay += btnVal;
      }
      hist = txtDisplay;
      number1 == 0 && operation == ''
          ? number1 = int.parse(txtDisplay).toDouble()
          : number2 = int.parse(txtDisplay).toDouble();
    } else if (btnVal == '%') {
      if (number1 == 0 && number2 == 0) {
        txtDisplay = '0%';
        hist = txtDisplay;
      } else if (number1 != 0 && number2 == 0) {
        number1 = number1 / 100;
        txtDisplay = number1.toString();
        hist += '%';
      }
    }
    else if (btnVal == '/' || btnVal == 'x' || btnVal == '-' || btnVal == '+' && btnVal == '='){
      operation = btnVal;
      
    }
     */




    setState(() {
      res = txtDisplay;
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
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  res,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFFD4AF37),
                    fontSize: 60,
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
                  hist,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0x7FD4AF37),
                    fontSize: 36,
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
                    callback: btnClick),
                ClcButton(
                    txt: '%',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: 'DEL',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '/',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '7',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '8',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '9',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: 'x',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '4',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '5',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '6',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '-',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '1',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '2',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '3',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '+',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClcButton(
                    txt: '00',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '0',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '.',
                    txtclr: 0xFFFFFFFF,
                    backclr: 0x7FD4AF37,
                    callback: btnClick),
                ClcButton(
                    txt: '=',
                    txtclr: 0xFF000000,
                    backclr: 0xFFD4AF37,
                    callback: btnClick)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
