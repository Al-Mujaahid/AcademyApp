import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/update_profile_pages/other_personal_information.dart';
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

  static errorAlert(context, String message, Function cancel, Function ok) {
    closeLoadingAlert();
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: TextOf('Request failed', 20, FontWeight.bold, black),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red.shade300,
                  child: MuslimAPPIcon(Icons.highlight_off_rounded, white, 40),
                ),
                TextOf(message, 20, FontWeight.w200, black)
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Container(
                  decoration: BoxDecoration(
                      color: green,
                      border: Border.all(color: green, width: 1),
                      borderRadius: BorderRadius.circular(90)),
                  child: SideSpace(
                      100, 10, TextOf('Ok', 20, FontWeight.bold, white)),
                ),
                onPressed: () {
                  ok();
                },
              ),
            ],
          );
        });
  }

  static successAlert(context, String message, Function ok) {
    closeLoadingAlert();
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: TextOf('Request successful', 20, FontWeight.bold, black),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade500,
                  child: MuslimAPPIcon(Icons.task_alt_rounded, white, 40),
                ),
                TextOf(message, 20, FontWeight.w200, black)
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Container(
                  decoration: BoxDecoration(
                      color: green,
                      border: Border.all(color: green, width: 1),
                      borderRadius: BorderRadius.circular(90)),
                  child: SideSpace(
                      100, 10, TextOf('Ok', 20, FontWeight.bold, white)),
                ),
                onPressed: () {
                  ok();
                },
              ),
            ],
          );
        });
  }

  static responseAlert(context, String message, Function ok) {
    closeLoadingAlert();
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: TextOf('Hey!', 20, FontWeight.bold, black),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade400,
                  child: MuslimAPPIcon(Icons.info_outline_rounded, white, 40),
                ),
                TextOf(message, 20, FontWeight.w200, black)
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Container(
                  decoration: BoxDecoration(
                      color: green,
                      border: Border.all(color: green, width: 1),
                      borderRadius: BorderRadius.circular(90)),
                  child: SideSpace(
                      100, 10, TextOf('Ok', 20, FontWeight.bold, white)),
                ),
                onPressed: () {
                  ok();
                },
              ),
            ],
          );
        });
  }

  static loadedAlert(BuildContext context, String message) {
    closeLoadingAlert();
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
