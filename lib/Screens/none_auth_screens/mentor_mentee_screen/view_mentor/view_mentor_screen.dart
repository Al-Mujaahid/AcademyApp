import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/create_schedule.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/view_schedule_screen.dart';
import 'package:muslim_app/model/mentor_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/get_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/view_schedule_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/get_user_profile_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:provider/provider.dart';

class ViewMentorScreen extends StatefulWidget {
  const ViewMentorScreen({Key? key, required this.mentor}) : super(key: key);

  final MentorModel mentor;

  @override
  State<ViewMentorScreen> createState() => _ViewMentorScreenState();
}

class _ViewMentorScreenState extends State<ViewMentorScreen> {
  @override
  Widget build(BuildContext context) {
    // BotToast.closeAllLoading();
    return Scaffold(
      body: Column(
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
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                ),
                YSpace(16),
                Text("${widget.mentor.first_name} ${widget.mentor.last_name}", style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700
                ),),
                YSpace(4),
                Text("Engineering . University of Lagos", style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w600
                ),),

                YSpace(8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(onPressed: () {}, icon: Icon(Icons.meeting_room_rounded)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.chat_rounded)),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("Meeting Sessions:",style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black87
            ),),
          ),
          YSpace(12),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => GetScheduleProvider(
                menteeId: Provider.of<UserProfileProvider>(context, listen: false).userData.user_id.toString(),
                mentorId: widget.mentor.id!.toString()
              ),
              child: Consumer<GetScheduleProvider>(
                builder: (context, value, child) {
                  // value.getSchedule();
                  if (value.loading) {
                    return Center(
                      child: InkWell(
                          onTap: () => value.getSchedule(),
                          child: CircularProgressIndicator()
                      ),
                    );
                  }
                  if (value.scheduleList.isEmpty) {
                    return Center(
                      child: InkWell(
                        onTap: () => value.getSchedule(),
                        child: Text("You do not have any schedule with ${widget.mentor.first_name}, click to refresh", style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w400,
                        ), textAlign: TextAlign.center,),
                      ),
                    );
                  }


                  return ListView.separated(
                    itemCount: value.scheduleList.length,
                    separatorBuilder: (context, index) => Divider(thickness: .5, color: Colors.grey, height: 1,),
                    itemBuilder: (context, index) {
                      final schedule = value.scheduleList[index];

                      return ListTile(
                        title: Text('Mentorship Session'),
                        subtitle: Text('${schedule.objectives}'),
                        onTap: () {
                          ForwardNavigation.withReturn(context, ChangeNotifierProvider(
                            create: (context) => ViewScheduleProvider(schedule, Provider.of<UserProfileProvider>(context, listen: false).userData.user_id.toString()),
                            child: ViewScheduleScreen(),
                          ));
                        },
                      );
                    },
                    padding: const EdgeInsets.all(0),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        // color: Colors.red,
        height: 50,
        child: Center(
          child: ElevatedButton(
            child: Text("Schedule Meeting"),
            onPressed: () async {
              // ForwardNavigation.withReturn(context, CreateScheduleScreen());
              print("MenteeId: ${widget.mentor.id}");
              print("MentorId: ${Provider.of<UserProfileProvider>(context, listen: false).userData.user_id.toString()}");
              final response = await showModalBottomSheet(
                context: context,
                builder: (context) => CreateScheduleScreen(
                  mentorId: widget.mentor.id.toString(),
                  menteeId: Provider.of<UserProfileProvider>(context, listen: false).userData.user_id.toString(),
                ),
                elevation: 0, isScrollControlled: true,
                isDismissible: false,
                enableDrag: true,
                useRootNavigator: true
              );
              if (response == true) {
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }
}
