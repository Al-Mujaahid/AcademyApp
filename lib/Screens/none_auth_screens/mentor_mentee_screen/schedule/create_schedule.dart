import 'package:flutter/material.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/create_schedule.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({Key? key, required this.mentorId, required this.menteeId}) : super(key: key);

  final String mentorId;
  final String menteeId;

  @override
  _CreateScheduleScreenState createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {

  @override
  Widget build(BuildContext context) {
    final createScheduleProvider = Provider.of<CreateScheduleProvider>(context,listen: false);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              YSpace(30),
              Center(
                child: Text("Schedule a Meeting", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700
                ),),
              ),
              YSpace(32),
              Text("Meeting Date", style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w400, color: Colors.black54
              ),),
              YSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<CreateScheduleProvider>(
                    builder: (context, value, child) {
                      final date = value.scheduleDate;
                      final time = value.scheduleTime;
                      if (date == null) {
                        return Text("");
                      }
                      return Text("${date.year}/${date.month}/${date.day} - ${time!.hour}:${time.minute}", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700
                      ),);
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365))
                      );
                      final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now(),
                      );
                      if (time != null && date != null) {
                        createScheduleProvider.setScheduleDate = date;
                        createScheduleProvider.setScheduleTime = time;
                      }
                    },
                    child: Text('select date', style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700, color: Colors.blue
                    ),),
                  )
                ],
              ),


              YSpace(24),
              Text("Meeting Objective", style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w400, color: Colors.black54
              ),),
              YSpace(16),
              TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1)
                  ),
                  hintText: "Type meeting objective here...",
                ),
                maxLines: 5, minLines: 3,
                onChanged: (value) => createScheduleProvider.setObjective = value,
              ),
              YSpace(32),
              ElevatedButton(
                child: Text("Schedule Meeting"),
                onPressed: () {
                  createScheduleProvider.schedule(context, menteeId: widget.menteeId, mentorId: widget.mentorId);
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
