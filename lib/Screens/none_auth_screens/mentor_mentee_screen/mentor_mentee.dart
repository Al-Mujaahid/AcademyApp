import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentee.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/utils/style.dart';

class MentorMentee extends StatefulWidget {
  const MentorMentee({Key? key}) : super(key: key);

  @override
  _MentorMenteeState createState() => _MentorMenteeState();
}

class _MentorMenteeState extends State<MentorMentee> {
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
                TabBar(labelColor: green, indicatorWeight: 0.01, unselectedLabelColor: ash1, tabs: [
                  Tab(
                      icon: ImageIcon(
                        AssetImage("assets/images/mentor.png"),
                      ),
                      text: "Mentor"),
                  Tab(
                      icon: ImageIcon(
                        AssetImage("assets/images/mentee.png"),
                      ),
                      text: "Mentee")
                ]),
                Expanded(child: TabBarView(children: [MentorListPage(), Mentee()]))
              ],
            )),
      ),
    );
  }
}
