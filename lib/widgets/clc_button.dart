import 'package:flutter/material.dart';

class ClcButton extends StatelessWidget {
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
      margin: EdgeInsets.all(MediaQuery.of(context).size.width/5/5/3),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/5,
        height: MediaQuery.of(context).size.width/5,
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
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/10),
              ),
              backgroundColor: Color(backclr)),
        ),
      ),
    );
  }
}
