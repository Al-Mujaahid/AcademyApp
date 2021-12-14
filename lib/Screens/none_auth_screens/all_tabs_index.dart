import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:muslim_app/Screens/more_options_screen/more_options_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/azkar.dart';
import 'package:muslim_app/Screens/none_auth_screens/home_page_screen/home.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor_mentee.dart';
import 'package:muslim_app/utils/constants.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({Key? key}) : super(key: key);

  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
        body: SafeArea(
      child: Stack(children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
        ),
        Column(
          children: [
            SideSpace(
              10,
              0,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf("Safar 29, 1443 AH ", 15, FontWeight.w700, white),
                        TextOf("The Academy", 30, FontWeight.bold, white),
                      ]),
                  Row(children: [
                    Image.asset("assets/images/notification.png", height: 80, width: 24,),
                    XSpace(10),
                    InkWell(
                      onTap: () {
                        ForwardNavigation.withReturn(context, MoreOptions());
                      },
                      child: Stack(children: [

                        SpinKitRipple(
                          color: white,
                          size: 100.0,
                        ),
                        Positioned(child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(MUSLIM_SISTER),
                          backgroundColor: ash1,
                        ),
                            top: 30, right: 30, bottom: 30, left: 30
                        ),
                      ],),

                    )
                  ])
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(30)),
                    child: SideSpace(5, 5, TabBar(
                        indicator: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: green, width: 2)
                        ),
                        labelColor: white,
                        indicatorWeight: 0.00000001,
                        unselectedLabelStyle: TextStyle(backgroundColor: null, fontWeight: FontWeight.w900),
                        labelStyle: TextStyle(backgroundColor: green, fontWeight: FontWeight.w900),
                        unselectedLabelColor: ash1,
                        physics: ClampingScrollPhysics(),
                        tabs: [
                          Tab(
                            text: 'Home',
                          ),
                          Tab(text: 'Azkar'),
                          Tab(text: 'Mentor'),
                        ],
                      ),
                    ),
                  ),
                  YSpace(4),
                  Expanded(
                      child: TabBarView(
                          children: [HomePage(), Azkar(), MentorMentee()]))
                ]),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
