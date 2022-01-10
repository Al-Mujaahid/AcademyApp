import 'package:flutter/material.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/view_schedule_provider.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewScheduleProvider = Provider.of<ViewScheduleProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              YSpace(25),
              Center(
                child: Text("Submit your report on the conversation with the ${viewScheduleProvider.iamMentee ? 'Mentor':'Mentee'}", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700
                ),),
              ),
              YSpace(32),

              TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)
                  ),
                  hintText: "Type your report here...",
                ),
                maxLines: 5, minLines: 3,
                onChanged: (value) => viewScheduleProvider.report = value,
              ),
              YSpace(32),
              ElevatedButton(
                child: Text("Submit Report"),
                onPressed: () {
                  // createScheduleProvider.schedule(context, menteeId: widget.menteeId, mentorId: widget.mentorId);
                  viewScheduleProvider.submitReport(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
