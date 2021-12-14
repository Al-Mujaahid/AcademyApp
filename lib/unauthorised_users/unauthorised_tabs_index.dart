import 'package:flutter/material.dart';
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
                        TextOf("Safar 29, 1443 AH ", 15, FontWeight.w700, white),
                        TextOf("The Academy", 30, FontWeight.bold, white),
                      ]),
                  Expanded(child: SizedBox(width: 10,)),
                  Stack(children: [

                  SpinKitRipple(
                  color: white,

                  size: 102.0,
                  ),
                    Positioned(child: CircleAvatar(child: InkWell(child: MuslimAPPIcon(Icons.person, white, 20),
                        onTap:(){ForwardNavigation.withNoReturn(context, LoginRegister());}),), top: 30, right: 30, bottom: 30, left: 30
                    ),
                  ],),
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
                          children: [HomePage(), Azkar(), UnauthorisedMentorMentee()]))
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
  _UnauthorisedMentorMenteeState createState() => _UnauthorisedMentorMenteeState();
}

class _UnauthorisedMentorMenteeState extends State<MentorMentee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        color: white,
        child: Container(
          child: Center(
            child: Stack(children: [

              SpinKitRipple(
                color: white,

                size: 102.0,
              ),
              Positioned(child: CircleAvatar(child: InkWell(child: MuslimAPPIcon(Icons.person, white, 20),
                  onTap:(){ForwardNavigation.withNoReturn(context, LoginRegister());}),), top: 30, right: 30, bottom: 30, left: 30
              ),
            ],),
          ),
        )
        // DefaultTabController(
        //     length: 2,
        //     child: Column(
        //       children: [
        //         TabBar(labelColor: green, indicatorWeight: 0.01, unselectedLabelColor: ash1, tabs: [
        //           Tab(
        //               icon: ImageIcon(
        //                 AssetImage("assets/images/mentor.png"),
        //               ),
        //               text: "Mentor"),
        //           Tab(
        //               icon: ImageIcon(
        //                 AssetImage("assets/images/mentee.png"),
        //               ),
        //               text: "Mentee")
        //         ]),
        //         Expanded(child: TabBarView(children: [UnauthorisedMentorListPage(), UnauthorisedMentee()]))
        //       ],
        //     )),
      ),
    );
  }
}

class UnauthorisedMentorListPage extends StatelessWidget {
  const UnauthorisedMentorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Stack(children: [

          SpinKitRipple(
            color: white,

            size: 102.0,
          ),
          Positioned(child: CircleAvatar(child: InkWell(child: MuslimAPPIcon(Icons.person, white, 20),
              onTap:(){ForwardNavigation.withNoReturn(context, LoginRegister());}),), top: 30, right: 30, bottom: 30, left: 30
          ),
        ],),
      ),
    );
  }
}
 class UnauthorisedMentee extends StatelessWidget {
   const UnauthorisedMentee({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(child: Center(
       child: Stack(children: [

         SpinKitRipple(
           color: white,

           size: 102.0,
         ),
         Positioned(child: CircleAvatar(child: InkWell(child: MuslimAPPIcon(Icons.person, white, 20),
             onTap:(){ForwardNavigation.withNoReturn(context, LoginRegister());}),), top: 30, right: 30, bottom: 30, left: 30
         ),
       ],),
     ),);
   }
 }
 