import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: green,
                  border: Border.all(color: green),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousPageIcon(white, 20),
                    TextOf('More', 15, FontWeight.w700, white),
                    Icon(Icons.arrow_back, color: green,)
                  ],
                ),),
              SideSpace(10, 5, Column(children: [
                InkWell(
                  onTap:(){ForwardNavigation.withReturn(context, UserProfile());},
                  child:
                  Card(child:
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: white),),
                    child:
                        SideSpace(10, 10, TextOf('Profile', 15, FontWeight.w500, ash2)),
                  ),),
                ),

                YSpace(5),
                InkWell(
                  onTap:(){},
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: white),),
                      child:
                      SideSpace(10, 10, TextOf('Branches', 15, FontWeight.w500, ash2)),
                    ),
                  ),
                ),
                YSpace(5),
                InkWell(
                  onTap:(){},
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: white),),
                      child:
                      SideSpace(10, 10, TextOf('Reset pasword', 15, FontWeight.w500, ash2)),
                    ),
                  ),
                ),
              ],))
            ],)));
  }
}
