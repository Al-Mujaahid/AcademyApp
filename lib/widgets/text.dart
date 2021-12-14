import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOf extends StatelessWidget {
  TextOf(this.text, this.size, this.weight, this.colo, {Key? key})
      : super(key: key);
  String text;
  double size;
  Color colo;
  FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.mulish(
            fontSize: size, color: colo, fontWeight: weight));
  }
}





//192.168.88.38