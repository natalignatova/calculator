import 'package:flutter/material.dart';
import 'package:goldcalc/screens/gold_calc_screen.dart';
import 'package:goldcalc/widgets/clc_button.dart';

class MileToKm extends StatefulWidget {
  const MileToKm({super.key});

  @override
  State<MileToKm> createState() => _MileToKmState();
}

class _MileToKmState extends State<MileToKm> {
  //late double km;
  //late double mile;
  String txtDisplayMile = '0';
  String txtDisplayKm = '0';

  //String res = '';

  final List<String> notes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  void btnClick(String btnVal) {
    if (btnVal == 'AC') {
      txtDisplayMile = '0';
      txtDisplayKm = '0';
      //res = '';
    } else if (txtDisplayKm.length < 10 || txtDisplayMile.length < 10 ) {
      if (btnVal == '.') {
        if (!txtDisplayKm.contains('.')) {
          txtDisplayKm += '.';
        }
      } else if (notes.contains(btnVal)) {
        if (txtDisplayKm == '0') {
          txtDisplayKm = btnVal;
        } else {
          txtDisplayKm += btnVal;
        }
        txtDisplayMile =
            (double.parse(txtDisplayKm) * 0.621371).toStringAsFixed(2);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'G O L D  C O N V E R T E R',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Outfit',
          ),
        ),
        backgroundColor: Color(0xFF000000),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GoldCalcScreen()));
            },
            icon: Icon(Icons.calculate, color: Color(0xFFD4AF37)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      txtDisplayKm,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFD4AF37),
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'km',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFD4AF37),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      txtDisplayMile,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFD4AF37),
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'mi',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFD4AF37),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    txt: 'AC',
                    txtclr: 0xFF000000,
                    backclr: 0xBFD4AF37,
                    callback: btnClick),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
