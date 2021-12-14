import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/text.dart';

class MuslimButton extends StatelessWidget {
  MuslimButton(this.color, this.real_content, this.btn_color, {Key? key})
      : super(key: key);
  Widget real_content;
  Color color;
  Color btn_color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: btn_color,
          borderRadius: BorderRadius.circular(13)),
      child: Center(
        child: real_content,
      ),
    );
  }
}
//TextOf("Login", 20, FontWeight.w800, white)