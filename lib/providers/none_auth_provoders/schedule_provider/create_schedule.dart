import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/services/non_auth_apis/schedule_meeting/create_schedule.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class CreateScheduleProvider extends BaseProvider {

  String? _schedule_date;
  bool formValidity = false;

  String get schedule_date => _schedule_date ?? '';



  set setschedule_date(String schedule_date) {
    _schedule_date = schedule_date;
    checkFormValidity();
    notifyListeners();
  }



  void checkFormValidity() {
    if (
        (_schedule_date != null) ) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void schedule(BuildContext context) async {
    try {
      print('schedule date is $_schedule_date');
      if (_schedule_date == null) {
        Alerts.responseAlert(context, 'Date not picked', (){Navigator.pop(context);});
      } else {
        FocusScope.of(context).unfocus();
        setLoading = true;
        var scheduleResponse = await CreateSchedule.scheduleMeeting(
          schedule_date: _schedule_date,
        );
        Alerts.closeLoadingAlert();
        print("Muslim scheduleResponse Response is $scheduleResponse['message']");

        print("Muslim scheduleResponse Response is $scheduleResponse");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeIndex()),
                (route) => false);
        Alerts.responseAlert(context, 'Schedule creation successful', (){ForwardNavigation.withNoReturn(context, HomeIndex());});

      }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.responseAlert(context, 'Schedule creation successful', (){ForwardNavigation.withNoReturn(context, HomeIndex());});
      rethrow;
    }
  }

  CreateScheduleProvider() {
    checkFormValidity();
  }
}
