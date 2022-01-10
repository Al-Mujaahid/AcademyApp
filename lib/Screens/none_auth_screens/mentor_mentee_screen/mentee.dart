import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/pending_mentor_request.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/view_mentee/view_mentee_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/model/mentee_model.dart';
import 'package:muslim_app/model/pending_request_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentee_provider/get_mentee_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentor_provider/get_mentors_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

import 'mentor.dart';

class Mentee extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Consumer<GetMenteeProvider>(
              builder: (context, value, child) {
                value.setBuildContext = context;
                if (value.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                /// if the list of mentee is empty
                if (value.menteeList.isEmpty) {
                  return SideSpace(
                    10,
                    10,
                    Center(
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
                              "You have no mentees yet!\n Your mentees appear here after you've both been asigned to each other and accepted your match.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                  color: ash1, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            YSpace(5),
                            TextOf('Check pending requests', 15, FontWeight.w300, green),
                            YSpace(5),
                            InkWell(
                                onTap: () {
                                  ForwardNavigation.withReturn(context, PendingMentees());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: white, width: 2),
                                      color: green,
                                      borderRadius: BorderRadius.circular(13)),
                                  child: Center(
                                    child: SideSpace(30, 15,
                                        TextOf("Proceed", 20, FontWeight.w800, white)),
                                  ),
                                )
                            ),
                          ],
                        )),
                  );
                }

                return Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ForwardNavigation.withReturn(context, PendingMentees());
                          },
                          child: Container(
                            decoration: BoxDecoration(color: green),
                            child: SideSpace(
                              10,
                              0,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextOf("Pending mentees...", 14, FontWeight.w700, light_green),
                                  Spacer(),
                                  TextOf(Provider.of<GetPendingRequestsProvider>(context, listen: false).pendingMenteeRequest.length.toString(), 14, FontWeight.w700, light_green),
                                  XSpace(16),
                                  InkWell(
                                    onTap: () => Provider.of<GetMenteeProvider>(context, listen: false).getMentor(),
                                    child: Icon(Icons.refresh, size: 24,)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(thickness: 0.5, color: Colors.grey.shade300, height: 1,),
                            shrinkWrap: true,
                            itemCount: value.menteeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              MenteeModel mentee = value.menteeList[index];
                              return ListTile(
                                onTap: () {
                                  ForwardNavigation.withReturn(context, ViewMenteeScreen(mentee: mentee));
                                },
                                title: Text("${mentee.firstName} ${mentee.lastName}"),
                                trailing: Icon(Icons.remove_red_eye),
                                leading: CircleAvatar(
                                  radius: 15, backgroundColor: Colors.lightBlue,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              );
                            }
                          ),
                        )
                      ],
                    )
                );
              }
          )
      ),
    );
  }
}

class PendingMentees extends StatefulWidget {
  const PendingMentees({Key? key}) : super(key: key);
  static int? pending_mentees;

  @override
  State<PendingMentees> createState() => _PendingMenteesState();
}

class _PendingMenteesState extends State<PendingMentees> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPendingMentorRequest();
  }

  void loadPendingMentorRequest() async {
    Provider.of<GetPendingRequestsProvider>(context, listen: false).getPendingRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextOf('Pending mentees', 20, FontWeight.w700, white),
        backgroundColor: green,
        elevation: 0,
      ),
      body: Column(
        children: [
          YSpace(20),
          Expanded(
            child: Consumer<GetPendingRequestsProvider>(
            builder: (context, value, child) {
              value.setBuildContext = context;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 0.5, color: Colors.grey.shade300, height: 1,),
                shrinkWrap: true,
                itemCount: value.pendingMenteeRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  PendingMenteeRequest pending = value.pendingMenteeRequest[index];
                  PendingRequestPage.user_id = pending.id;
                  PendingMentees.pending_mentees = value.pendingMenteeRequest.length;

                  return ListTile(
                    onTap: () {
                      ForwardNavigation.withReturn(context, AcceptOrDecline(menteePendingRequest: pending,));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 21,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    title: Text('Mentee Request'),
                    subtitle: Text('${pending.mentee_first_name} ${pending.mentee_last_name}  have been assigned as your mentee'),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  );
                });
            })
          ),
        ],
      ),
    );
  }
}
