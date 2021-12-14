import 'package:flutter/material.dart';
import 'package:muslim_app/widgets/YSpace.dart';

class AdhkarPlayerWidget extends StatelessWidget {
  const AdhkarPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.fast_rewind_rounded),
              Icon(Icons.play_arrow),
              Icon(Icons.fast_forward_rounded),
            ],
          ),
          YSpace(15),
          LinearProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.grey,
            minHeight: 5,
            value: 0.4,
          ),
          YSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1:00', style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600
              ),),
              Text('10:00', style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600
              ),),
            ],
          )
        ],
      ),
    );
  }
}
