import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/rating_screen/rating_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/report_screen/report_screen.dart';
import 'package:muslim_app/model/get_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/view_schedule_provider.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:provider/provider.dart';

class ViewScheduleScreen extends StatelessWidget {
  const ViewScheduleScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final viewScheduleProvider = Provider.of<ViewScheduleProvider>(context, listen: false);
    // print("I AM MENTEE: ${viewScheduleProvider.iamMentee}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            YSpace(36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back)
                  ),
                ],
              ),
            ),
            YSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Mentorship meeting session with Adeola Jamiu", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87
              ),),
            ),
            YSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Objectives", style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87
              ),),
            ),
            YSpace(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("${viewScheduleProvider.schedule.objectives}", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87
              ),),
            ),

            YSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Mentor Comment", style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87
              ),),
            ),
            YSpace(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("${viewScheduleProvider.schedule.mentor_comment}", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87
              ),),
            ),

            YSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Mentee Comment", style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87
              ),),
            ),
            YSpace(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("${viewScheduleProvider.schedule.mentee_comment}", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87
              ),),
            ),




          ],
        ),
      ),
      bottomSheet: Container(
        // color: Colors.red,
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // mentee has sent report, so they should send a comment and rating
              if ((viewScheduleProvider.iamMentee && viewScheduleProvider.menteeSentReport))
                ...[
                  ElevatedButton(
                    child: Text("Rate ${viewScheduleProvider.iamMentee ? 'Mentor':'Mentee'}"),
                    onPressed: () {
                      // ForwardNavigation.withReturn(context, CreateScheduleScreen());
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider(
                            create: (context) => ViewScheduleProvider(viewScheduleProvider.schedule, viewScheduleProvider.userId),
                            builder: (context, child) {
                              return RatingScreen();
                            },
                          );
                        },
                        isScrollControlled: true
                      );
                    },
                  ),
                ],
              // mentor has sent report, so they should send a comment and rating
              if ((!viewScheduleProvider.iamMentee && viewScheduleProvider.mentorSentReport))
                ...[
                  ElevatedButton(
                    child: Text("Rate ${viewScheduleProvider.iamMentee ? 'Mentor':'Mentee'}"),
                    onPressed: () {
                      // ForwardNavigation.withReturn(context, CreateScheduleScreen());
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider(
                            create: (context) => ViewScheduleProvider(viewScheduleProvider.schedule, viewScheduleProvider.userId),
                            builder: (context, child) {
                              return RatingScreen();
                            },
                          );
                        },
                        isScrollControlled: true
                      );
                    },
                  ),
                ],

              // mentee has not send report, so they should send a report
              if ((viewScheduleProvider.iamMentee || !viewScheduleProvider.menteeSentReport))
                ...[
                  ElevatedButton(
                    child: Text("Submit Report"),
                    onPressed: () {
                      // ForwardNavigation.withReturn(context, CreateScheduleScreen());
                      showModalBottomSheet(
                        context: context, builder: (context) {
                          return ChangeNotifierProvider(
                            create: (context) => ViewScheduleProvider(viewScheduleProvider.schedule, viewScheduleProvider.userId),
                            builder: (context, child) {
                              return ReportScreen();
                            },
                          );
                        },
                        isScrollControlled: true
                      );
                    },
                  ),
                ],
              // mentor has not send a report, so they should send a report
              if ((!viewScheduleProvider.iamMentee || !viewScheduleProvider.mentorSentReport))
                ...[
                  ElevatedButton(
                    child: Text("Submit Report"),
                    onPressed: () {
                      // ForwardNavigation.withReturn(context, CreateScheduleScreen());
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider(
                            create: (context) => ViewScheduleProvider(viewScheduleProvider.schedule, viewScheduleProvider.userId),
                            builder: (context, child) {
                              return ReportScreen();
                            },
                          );
                        },
                        isScrollControlled: true
                      );
                    },
                  ),
                ],


            ],
          ),
        ),
      ),
    );
  }
}
