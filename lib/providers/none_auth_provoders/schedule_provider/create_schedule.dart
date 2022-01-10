import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/services/non_auth_apis/schedule_meeting/create_schedule.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:provider/provider.dart';

class CreateScheduleProvider extends BaseProvider {

  DateTime? _schedule_date;
  TimeOfDay? _schedule_time;
  bool formValidity = false;
  String objective = '';

  DateTime? get scheduleDate => _schedule_date;
  TimeOfDay? get scheduleTime => _schedule_time;



  set setScheduleDate(DateTime schedulDate) {
    _schedule_date = schedulDate;
    checkFormValidity();
    notifyListeners();
  }

  set setScheduleTime(TimeOfDay scheduleTime) {
    _schedule_time = scheduleTime;
    checkFormValidity();
    notifyListeners();
  }

  set setObjective(String obj) {
    objective = obj;
    notifyListeners();
  }


  void checkFormValidity() {
    if ((_schedule_date != null) ) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void schedule(BuildContext context, {mentorId, menteeId}) async {
    try {
      Alerts.loadingAlert(context, 'please wait...');
      print('schedule date is $_schedule_date');
      if (_schedule_date == null || objective.isEmpty) {
        Alerts.responseAlert(context, 'All fields are required', (){Navigator.pop(context);});

      } else {
        FocusScope.of(context).unfocus();
        setLoading = true;
        final date = scheduleDate!;
        final time = scheduleTime!;

        var scheduleResponse = await CreateSchedule.scheduleMeeting(
          scheduleDate: "${date.year}/${date.month}/${date.day} - ${time.hour}:${time.minute}", mentorId: mentorId.toString(), menteeId: menteeId.toString(),
          objective: objective
        );
        Alerts.closeLoadingAlert();
        print("Muslim scheduleResponse Response is ${scheduleResponse['message']}");

        print("Muslim scheduleResponse Response is $scheduleResponse");
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeIndex()), (route) => false);
        Alerts.responseAlert(context, 'Schedule creation successful', (){
          // ForwardNavigation.withNoReturn(context, HomeIndex());
          Navigator.pop(context);
          Navigator.pop(context, true);
        });
      }

    } catch (e) {
      print("Muslim error: $e");
      Alerts.errorAlert(context, 'An error occurred', () {}, () {});
      rethrow;
    }
  }

  CreateScheduleProvider() {
    checkFormValidity();
  }
}
