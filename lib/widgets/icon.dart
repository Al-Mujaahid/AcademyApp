import 'package:flutter/material.dart';

class MuslimAPPIcon extends StatelessWidget {
  MuslimAPPIcon(this.type, this.color, this.size, {Key? key}) : super(key: key);
  IconData type;
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      type,
      color: color,
      size: size,
    );
  }
}
