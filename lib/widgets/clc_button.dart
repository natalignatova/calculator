import 'package:flutter/material.dart';

class ClcButton extends StatelessWidget {
  //const ClcButton({super.key});
  final String txt;
  final int txtclr;
  final int backclr;
  final Function callback;

  const ClcButton(
      {required this.txt,
      required this.txtclr,
      required this.backclr,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 80,
        height: 80,
        child: TextButton(
          onPressed: () => callback(txt),
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Color(txtclr),
              fontSize: 24,
            ),
          ),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: Color(backclr)),
        ),
      ),
    );
  }
}
