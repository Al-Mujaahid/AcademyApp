import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/update_profile_screen.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/text.dart';

class EditProfileAlert{
  static editProfilrAlert (context,){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
      title: TextOf('Edit...', 20, FontWeight.bold, black),
      actions: [
        CupertinoDialogAction(
          child: SideSpace(10, 10, Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextOf('Profile picture', 20, FontWeight.bold, black),
              TextOf('Edit only your profile picture', 18, FontWeight.w200, black)
            ],),
          ),
          onPressed: (){},
        ),
        CupertinoDialogAction(
          child: SideSpace(10, 10, Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextOf('Identity', 20, FontWeight.bold, black),
              TextOf('Email, username, phone number', 18, FontWeight.w200, black)
            ],),
          ),
          onPressed: (){},
        ),CupertinoDialogAction(
          child: SideSpace(10, 10, Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextOf('Others', 20, FontWeight.bold, black),
              TextOf('Other personal information', 18, FontWeight.w200, black)
            ],),
          ),
          onPressed: (){
            ForwardNavigation.withReturn(context, UpdateUserProfile());
          },
        ),
      ],
      );
  });
  }
}

// Column(
//               children: [
//                 TextOf('Profile pic', 20, FontWeight.bold, black),
//                 TextOf('Edit only your profile picture', 18, FontWeight.w200, black)
//               ],
//             ),