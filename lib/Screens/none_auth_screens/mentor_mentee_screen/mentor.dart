import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/pending_mentor_request.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/model/mentor_model.dart';
import 'package:muslim_app/model/pending_request_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentor_provider/get_mentors_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

import 'schedule/get_all_schedule.dart';



class MentorListPage extends StatelessWidget {
  static int? mentor_id_of_mentor;
  static String? mentor_first_name;
  static String? mentor_last_name;

  static int? number_of_mentors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SideSpace(
          0,
          10,
          Column(
            children: [
              InkWell(
                onTap: (){
                  ForwardNavigation.withReturn(context, PendingMentor());
                },
                child: Container(
                  decoration: BoxDecoration(color: green),
                  child: SideSpace(10, 0,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextOf("Pending mentors...", 14, FontWeight.w700, light_green), TextOf(PendingMentor.length_of_pending.toString()?? 'loading...', 14, FontWeight.w700, light_green)],),
                  ),
                ),
              ),
              //PendingMentor.length_of_pending
              YSpace(3),
              SideSpace(10, 0, Expanded(
                  child: Container(
                            child: Consumer<GetMentorProvider>(builder: (context, value, child) {
                              value.setBuildContext = context;
                              return
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.mentorModel.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        MentorModel mentor = value.mentorModel[index];
                                        mentor_id_of_mentor = mentor.id;
                                        MentorListPage.mentor_first_name = mentor.first_name;
                                        MentorListPage.mentor_last_name = mentor.last_name;
                                        MentorListPage.number_of_mentors = value.mentorModel.length;
                                        return InkWell(
                                          onTap: (){
                                            ForwardNavigation.withReturn(context, MentorDetail());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: light_green,
                                              border: Border.all(color: green),
                                              borderRadius: BorderRadius.circular(25)
                                            ),
                                            child: SideSpace(10,5, Row(
                                                children: [
                                                  Stack(children: [CircleAvatar(radius: 30, backgroundColor: green,),Positioned(child: CircleAvatar(radius: 28, backgroundColor: white,), left: 1, right: 1, top: 1, bottom: 1,)]),
                                                  XSpace(10),
                                                  TextOf(mentor.first_name!, 20, FontWeight.w700, ash2),
                                                  XSpace(10),
                                                  TextOf(mentor.last_name!, 20, FontWeight.w700, ash2),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                            });
                },
    )
          ),

        ),
              )]
    ),
    ),
    );
  }
}

class PendingMentor extends StatelessWidget {
  const PendingMentor({Key? key}) : super(key: key);
  static int? length_of_pending;
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(title: TextOf('Pending mentors', 20, FontWeight.w700, white), backgroundColor: green,),
          body: Column(
            children: [
              Expanded(child: Consumer<GetPendingRequestsProvider>(builder: (context, value, child) {
                value.setBuildContext = context;
                return
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.pendingRequestModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        PendingRequestModel pending = value.pendingRequestModel[index];
                        //....................
                        //....................
                        PendingMentor.length_of_pending = value.pendingRequestModel.length;
                        PendingRequestPage.user_id  = pending.id;
                        if(pending.mentee_id != UserProfile.one_user_id){
                          PendingRequestPage.recipient_id = pending.mentor_id;
                        }else if(pending.mentor_id != UserProfile.one_user_id){
                          PendingRequestPage.recipient_id = pending.mentee_id;
                        } else{
                          PendingRequestPage.recipient_id = null;
                        };
                        return Column(
                          children: [
                            SideSpace(10, 0, InkWell(
                              onTap: (){ForwardNavigation.withReturn(context, AcceptOrDecline());},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: light_green,
                                    border: Border.all(color: green),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child:SideSpace(10,10, Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Stack(children: [CircleAvatar(radius: 30, backgroundColor: green,),Positioned(child: CircleAvatar(radius: 28, backgroundColor: white,), left: 1, right: 1, top: 1, bottom: 1,)]),
                                      XSpace(10),
                                      Column(children: [Row(children: [TextOf(pending.mentor_first_name, 20, FontWeight.w700, ash2),
                                        XSpace(10),
                                        TextOf(pending.mentor_last_name, 20, FontWeight.w700, ash2),
                                      ],),
                                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children: [Column(children: [TextOf("Your status:", 10, FontWeight.bold, black), TextOf("${pending.mentee_status}", 10, FontWeight.w400, black),],),XSpace(20),Column(children: [TextOf("Mentor status:", 10, FontWeight.bold, black), TextOf("${pending.mentor_status}", 10, FontWeight.w400, black)],)],)
                                      ],)

                                    ],),
                                  ],

                                ),
                                ),
                              ),
                            )
                            ),
                            YSpace(8),
                          ],
                        );
                      });
              })),
            ],
          ),
        );
  }
}
