import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/model/get_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/get_schedule.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

import '../../rate_mentor_mentee.dart';
import 'create_schedule.dart';

class MentorDetail extends StatelessWidget{
  static int? schedule_id;
  static String? objective;
  //static int? schedule_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
      child: Consumer<GetScheduleProvider>(builder: (context, value, child) {
    value.setBuildContext = context;
    return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: white),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              PreviousPageIcon(black, 20),
              Container(width: 50, height: 50,
                decoration: BoxDecoration(color: white,
                    border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(100)),),
              XSpace(7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextOf('Your activities with', 15, FontWeight.w500, ash2),
                  Row(
                    children: [
                      TextOf(MentorListPage.mentor_first_name!, 20, FontWeight.w900, ash2),
                      XSpace(4),
                      TextOf(MentorListPage.mentor_last_name!, 20, FontWeight.w900, ash2),
                    ],
                  )
                ],
              )
            ],),
            Row(
              children: [
                IconButton(onPressed: (){ForwardNavigation.withReturn(context, CreateSchedule());}, icon: Icon(Icons.video_camera_back_outlined, color: black,),),
                //IconButton(onPressed: (){ForwardNavigation.withReturn(context, RateMentorMenteePage());}, icon: Icon(Icons.star, color: Colors.amber,),),

              ],
            )
          ],
        ),),
    YSpace(10),

      SideSpace(10, 0, Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextOf("Concluded", 17, FontWeight.w900, green),
          ],
        ),
      ),
    Expanded(
    child: ListView.builder(
    itemCount: value.scheduleModel.length,
    itemBuilder: (BuildContext context, int index) {
      GetScheduleModel schedule = value.scheduleModel[index];
      MentorDetail.schedule_id = schedule.id;
      MentorDetail.objective = schedule.objectives!;
    return InkWell(
    onTap: (){
    ForwardNavigation.withReturn(context, RateMentorMenteePage());
    },
    child: SideSpace(10, 10, Container(
      decoration: BoxDecoration(
      color: light_green,
      border: Border.all(color: green, width: 1),
      borderRadius: BorderRadius.circular(10)
      ),
      child: SideSpace(10,5, Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextOf(schedule.objectives!, 18, FontWeight.w500, ash2),
            XSpace(10),
            TextOf(schedule.schedule_date!, 18, FontWeight.w700, ash2),
          ],
        ),
        MuslimAPPIcon(Icons.menu, green, 20)
      ],),
        ),
      ),
      ),
    );
    }),
    ),

    ],
    );
    })),
      ),
    );
  }}