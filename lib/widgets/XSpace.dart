import 'package:flutter/material.dart';

class XSpace extends StatelessWidget {
  XSpace(this.width, {Key? key}) : super(key: key);
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
