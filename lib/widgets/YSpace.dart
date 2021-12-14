import 'package:flutter/material.dart';

class YSpace extends StatelessWidget {
  YSpace(this.height, {Key? key}) : super(key: key);
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
