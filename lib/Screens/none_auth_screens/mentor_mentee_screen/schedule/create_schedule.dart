import 'package:flutter/material.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/create_schedule.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class CreateSchedule extends StatefulWidget {
  const CreateSchedule({Key? key}) : super(key: key);

  @override
  _CreateScheduleState createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  String times = '0000-00-00';
  DateTime? _myDateTime ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<CreateScheduleProvider>(builder: (context, value, child){

          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextOf('Your scheduled date is....', 15, FontWeight.w300, black),
                  TextOf(times, 20, FontWeight.w800, black),
                  ElevatedButton(onPressed: () async{
                     _myDateTime = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2025));
                    setState(() {
                      times = DateFormat('yyyy-MM-dd').format(_myDateTime!);
                      value.setschedule_date = times;
                    }
                    );

                  }, child: TextOf('Pick shedule date', 15, FontWeight.w700, white)),
                  ElevatedButton(onPressed: (){value.schedule(context);}, child: TextOf('Finish', 15, FontWeight.w300, white))
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
