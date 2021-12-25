import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/azkar.dart';
import 'package:muslim_app/Screens/none_auth_screens/home_page_screen/home.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor_mentee.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UnauthorisedHomeIndex extends StatefulWidget {
  const UnauthorisedHomeIndex({Key? key}) : super(key: key);

  @override
  _UnauthorisedHomeIndexState createState() => _UnauthorisedHomeIndexState();
}

class _UnauthorisedHomeIndexState extends State<UnauthorisedHomeIndex> {
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
                            TextOf("Safar 29, 1443 AH ", 15, FontWeight.w700,
                                white),
                            TextOf("The Academy", 30, FontWeight.bold, white),
                          ]),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30)),
                        child: SideSpace(
                          5,
                          5,
                          TabBar(
                            indicator: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: green, width: 2)),
                            labelColor: white,
                            indicatorWeight: 0.00000001,
                            unselectedLabelStyle: TextStyle(
                                backgroundColor: null,
                                fontWeight: FontWeight.w900),
                            labelStyle: TextStyle(
                                backgroundColor: green,
                                fontWeight: FontWeight.w900),
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
                          child: TabBarView(children: [
                        HomePage(),
                        Azkar(),
                        UnauthorisedMentorMentee()
                      ]))
                    ]),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}

class UnauthorisedMentorMentee extends StatefulWidget {
  const UnauthorisedMentorMentee({Key? key}) : super(key: key);

  @override
  _UnauthorisedMentorMenteeState createState() =>
      _UnauthorisedMentorMenteeState();
}

class _UnauthorisedMentorMenteeState extends State<UnauthorisedMentorMentee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        color: white,
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                    labelColor: green,
                    unselectedLabelColor: ash1,
                    indicatorWeight: 0.01,
                    tabs: [
                      Tab(
                          icon: ImageIcon(
                            AssetImage("assets/images/mentor.png"),
                          ),
                          text: "Mentor"),
                      Tab(
                          icon: ImageIcon(
                            AssetImage("assets/images/mentee.png"),
                          ),
                          text: "menteee")
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  UnauthorisedMentorListPage(),
                  UnauthorisedMentee()
                ]))
              ],
            )),
      ),
    );
  }
}

class UnauthorisedMentorListPage extends StatelessWidget {
  const UnauthorisedMentorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideSpace(
      10,
      10,
      Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 46,
              backgroundColor: green,
              child: Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: ash_lite,
                    child: ImageIcon(
                      AssetImage("assets/images/mentor.png"),
                      color: green,
                      size: 40,
                    ),
                  )),
            ),
            YSpace(20),
            TextOf('My mentors', 20, FontWeight.bold, ash2),
            YSpace(7),
            Text(
              "Your mentors appear here after you've both been asigned to each other and accepted your match.",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                  color: ash1, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            YSpace(5),
            TextOf('Proceed to login', 15, FontWeight.w300, green),
            YSpace(5),
            InkWell(
                onTap: () {
                  ForwardNavigation.withNoReturn(context, LoginRegister());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: white, width: 2),
                      color: green,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                    child: SideSpace(
                        30, 15, TextOf("Login", 20, FontWeight.w800, white)),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}

class UnauthorisedMentee extends StatelessWidget {
  const UnauthorisedMentee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideSpace(
      10,
      10,
      Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 46,
              backgroundColor: green,
              child: Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: ash_lite,
                    child: ImageIcon(
                      AssetImage("assets/images/mentee.png"),
                      color: green,
                      size: 40,
                    ),
                  )),
            ),
            YSpace(20),
            TextOf('My mentees', 20, FontWeight.bold, ash2),
            YSpace(7),
            Text(
              "Your mentees appear here after you've both been asigned to each other and accepted your match.",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                  color: ash1, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            YSpace(5),
            TextOf('Proceed to login', 15, FontWeight.w300, green),
            YSpace(5),
            InkWell(
                onTap: () {
                  ForwardNavigation.withNoReturn(context, LoginRegister());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: white, width: 2),
                      color: green,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                    child: SideSpace(
                        30, 15, TextOf("Login", 20, FontWeight.w800, white)),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
