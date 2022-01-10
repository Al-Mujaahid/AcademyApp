import 'package:flutter/material.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/view_schedule_provider.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:provider/provider.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewScheduleProvider = Provider.of<ViewScheduleProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              YSpace(25),
              Center(
                child: Text("How will you rate your conversation with the ${viewScheduleProvider.iamMentee ? 'Mentor':'Mentee'}", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700
                ),),
              ),
              YSpace(32),

              // TextFormField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.grey, width: 1)
              //     ),
              //     hintText: "Rating 1 - 5",
              //     counter: Container(),
              //   ),
              //   maxLength: 1,
              //   keyboardType: TextInputType.numberWithOptions(decimal: false, signed: true),
              //   onChanged: (value) => viewScheduleProvider.rating = int.parse(value),
              // ),
              Text('Rating:'),
              YSpace(10),
              Consumer<ViewScheduleProvider>(
                builder: (context, value, child) {
                  return Slider.adaptive(
                    onChanged: (value) {
                      print("Rating Value: $value");
                      viewScheduleProvider.setRating = value.toInt();
                    },
                    min: 1, max: 5,
                    value: viewScheduleProvider.rating.toDouble(), label: '${viewScheduleProvider.rating}',
                    divisions: 5,
                  );
                },
              ),
              YSpace(16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1)
                  ),
                  hintText: "Type your comment here...",
                ),
                maxLines: 5, minLines: 3,
                onChanged: (value) => viewScheduleProvider.comment = value,
              ),

              YSpace(32),
              ElevatedButton(
                child: Text("Submit Rating"),
                onPressed: () {
                  // createScheduleProvider.schedule(context, menteeId: widget.menteeId, mentorId: widget.mentorId);
                  viewScheduleProvider.makeComment(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
