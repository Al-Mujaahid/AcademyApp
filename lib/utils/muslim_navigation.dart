import 'package:flutter/material.dart';

class ForwardNavigation {
  static withReturn(context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
  }

  static withNoReturn(context, Widget page) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}

class PreviousPageIcon extends StatelessWidget {
  Color color;
  double size;
  PreviousPageIcon(this.color, this.size,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: color, size: size,));
  }
}
