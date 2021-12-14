import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/update_profile_screen.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';

class Alerts {
  static loadingAlert(BuildContext? context, String message) {
    BotToast.showLoading();
  }

  // static errorAlert(BuildContext context, String message) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Column(
  //             children: [
  //               MuslimAPPIcon(Icons.delete_forever, Colors.red, 30),
  //               YSpace(20),
  //               TextOf("Error alert", 20, FontWeight.w300, black),
  //               TextOf(message, 20, FontWeight.w200, black)
  //             ],
  //           ),
  //         );
  //       });
  // }

  static errorAlert (context, String message, Function cancel, Function ok){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: TextOf('Request failed', 20, FontWeight.bold, black),
        content: TextOf(message, 20, FontWeight.w200, black),
        actions: [
          CupertinoDialogAction(
            child: TextOf('Cancel', 20, FontWeight.bold, black),
            onPressed: (){cancel();},
          ),CupertinoDialogAction(
            child: TextOf('Ok', 20, FontWeight.bold, black),
            onPressed: (){ok();},
          ),
        ],
      );
    });
  }
  static successAlert (context, String message, Function ok){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: TextOf('Request successful', 20, FontWeight.bold, black),
        content: TextOf(message, 20, FontWeight.w200, black),
        actions: [CupertinoDialogAction(
            child: TextOf('Ok', 20, FontWeight.bold, black),
            onPressed: (){ok();},
          ),
        ],
      );
    });
  }
  static responseAlert (context, String message, Function ok){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: TextOf('Hey!', 20, FontWeight.bold, black),
        content: TextOf(message, 20, FontWeight.w200, black),
        actions: [CupertinoDialogAction(
            child: TextOf('Ok', 20, FontWeight.bold, black),
            onPressed: (){ok();},
          ),
        ],
      );
    });
  }

  static loadedAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                MuslimAPPIcon(Icons.delete_forever, Colors.red, 30),
                YSpace(20),
                TextOf("Error alert", 20, FontWeight.w300, black),
                TextOf(message, 20, FontWeight.w200, black)
              ],
            ),
          );
        });
  }

  static closeLoadingAlert() {
    BotToast.closeAllLoading();
  }



}
