import 'package:flutter/material.dart';

class SideSpace extends StatelessWidget {
  SideSpace(this.rl, this.bt, this.content, {Key? key}) : super(key: key);
  double rl;
  double bt;
  Widget content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(rl, bt, rl, bt),
      child: content,
    );
  }
}
