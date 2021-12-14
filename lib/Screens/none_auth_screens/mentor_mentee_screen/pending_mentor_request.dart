import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/model/pending_request_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/acceptOrDeclineRequest/acceptOrDeclineRequest.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';
class PendingRequestPage extends StatefulWidget {
  static int? user_id ;
  static int? recipient_id;
  const PendingRequestPage ({Key? key}) : super(key: key);

  @override
  _PendingRequestPageState createState() => _PendingRequestPageState();
}

class _PendingRequestPageState extends State<PendingRequestPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          SafeArea(
            child: Container(
                child: Consumer<GetPendingRequestsProvider>(builder: (context, value, child) {
                  value.setBuildContext = context;
                  return Column(
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PreviousPageIcon(white, 20),
                              TextOf('Pending requests', 15, FontWeight.w700, white),
                            Icon(Icons.arrow_back, color: green,)
                            ],
                          ),),

                      YSpace(10),
                      Expanded(
                        child: ListView.builder(
                            itemCount: value.pendingRequestModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              PendingRequestModel pending = value.pendingRequestModel[index];
                              PendingRequestPage.user_id  = pending.id;
                              if(pending.mentee_id != UserProfile.one_user_id){
                                PendingRequestPage.recipient_id = pending.mentor_id;
                              }else if(pending.mentor_id != UserProfile.one_user_id){
                                PendingRequestPage.recipient_id = pending.mentee_id;
                              } else{
                                PendingRequestPage.recipient_id = null;
                              };
                              return Expanded(
                                child:
                                Column(
                                  children: [
                                    SideSpace(10, 0, Container(
                                        decoration: BoxDecoration(
                                            color: light_green,
                                            border: Border.all(color: green),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: SideSpace(10,10, Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextOf('Mentor ', 15, FontWeight.w400, black),
                                            YSpace(5),
                                            Row(children: [TextOf(pending.mentor_first_name, 15, FontWeight.w200, ash2),
                                              XSpace(3),
                                              TextOf(pending.mentor_last_name, 15, FontWeight.w200, ash2),],),
                                            TextOf(pending.mentor_email, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentor_phone_number, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentor_comment, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentor_status, 15, FontWeight.w200, ash2),
                                            Divider(color: ash2, thickness: 1,),
                                            TextOf('Mentee ', 15, FontWeight.w400, black),
                                            YSpace(5),
                                            Row(children: [TextOf(pending.mentee_first_name, 15, FontWeight.w200, ash2),
                                              XSpace(3),
                                              TextOf(pending.mentee_last_name, 15, FontWeight.w200, ash2),],),
                                            TextOf(pending.mentee_email, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentee_phone_number, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentee_comment, 15, FontWeight.w200, ash2),
                                            TextOf(pending.mentee_status, 15, FontWeight.w200, ash2),
                                            YSpace(5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: (){ForwardNavigation.withReturn(context, AcceptOrDecline());},
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: green,
                                                        border: Border.all(color: white),
                                                        borderRadius: BorderRadius.circular(40)),
                                                    child: SideSpace(10, 5, TextOf('Respond', 15, FontWeight.w700, white),),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ),
                                      ),


                                    ),
                                    YSpace(8),

                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                })),
          ),

        );
  }
}

class AcceptOrDecline extends StatefulWidget {
  AcceptOrDecline({Key? key}) : super(key: key);
  @override
  _AcceptOrDeclineState createState() => _AcceptOrDeclineState();
}

class _AcceptOrDeclineState extends State<AcceptOrDecline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<AcceptOrDeclineRequestProvider>(builder: (context, value, child){
        return Column(children: [
          InkWell(
            onTap: (){ForwardNavigation.withReturn(context, AcceptOrDecline());},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: green,
                border: Border.all(color: green),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousPageIcon(white, 20),
                  TextOf('Respond', 15, FontWeight.w700, white),
                  Icon(Icons.arrow_back, color: green,)
                ],
              ),),
          ),
          YSpace(20),
        SideSpace(10, 10, Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextOf("Comment", 20, FontWeight.w500, ash2),
                  TextFormField(
                    onChanged: (String text) => value.setComment = text,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter comment",
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: green, width: 1))),
                  )
                ],
              ),
              YSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [InkWell(
                  onTap: (){value.setStatus = 'ACCEPT';
                  value.respond(context);},
                  child: Container(
                    decoration: BoxDecoration(
                        color: green,
                        border: Border.all(color: white),
                        borderRadius: BorderRadius.circular(40)),
                    child: SideSpace(10, 5, TextOf('ACCEPT', 15, FontWeight.w700, white),),),
                ),
                  InkWell(
                    onTap: (){
                      value.setStatus = 'DECLINE';
                      value.respond(context);},
                    child: Container(
                      decoration: BoxDecoration(
                          color: green,
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(40)),
                      child: SideSpace(10, 5, TextOf('DECLINE', 15, FontWeight.w700, white),),),
                  ),
                ],)
            ],
          ),
          )
        ],);
      })),
    );
  }
}
