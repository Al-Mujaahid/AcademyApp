import 'package:flutter/cupertino.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/get_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/get_user_profile_provider.dart';
import 'package:muslim_app/services/non_auth_apis/schedule_meeting/schedule_service.dart';
import 'package:muslim_app/services/non_auth_apis/user_profile_actions/get_user_profile.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:provider/provider.dart';

class ViewScheduleProvider extends BaseProvider {

  GetScheduleModel schedule;
  String userId;

  bool iamMentee = false;
  bool menteeAccepted = false;
  bool mentorAccepted = false;
  bool menteeSentReport = false;
  bool mentorSentReport = false;

  String report = '';
  int rating = 1;
  String comment = '';

  set setRating(int rate) {
    rating = rate;
    notifyListeners();
  }

  ViewScheduleProvider(this.schedule, this.userId) {
    initialize();
  }

  void initialize() async {
    setLoading = true;
    if (userId == schedule.mentee_id.toString()) {
      iamMentee = true;
    }
    menteeAccepted = schedule.mentee_status == 'ACCEPTED';
    mentorAccepted = schedule.mentor_status == 'ACCEPTED';
    setLoading = false;
    menteeSentReport = schedule.mentee_report != null;
    mentorSentReport = schedule.mentor_report != null;

    notifyListeners();
  }


  void makeComment(BuildContext context) async {
    print(comment);
    print(rating);
    try {
      Alerts.loadingAlert(context, 'please wait...');
      final userId = Provider.of<UserProfileProvider>(context, listen: false).userData.user_id;
      var mentorResponse = await ScheduleService.commentOnSchedule(recipientId: userId.toString(), comment: comment, rating: rating, scheduleId: schedule.id!);
      Alerts.successAlert(context, 'Comment submitted successfully', () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (error) {
      Alerts.errorAlert(context, 'An error occurred', () {}, () {});
    }
  }

  void submitReport(BuildContext context) async {
    try {
      Alerts.loadingAlert(context, 'please wait...');
      final userId = Provider.of<UserProfileProvider>(context, listen: false).userData.user_id;
      var mentorResponse = await ScheduleService.commentOnSchedule(recipientId: userId.toString(), comment: comment, rating: rating, scheduleId: schedule.id!);
      Alerts.successAlert(context, 'Comment submitted successfully', () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (error) {
      Alerts.errorAlert(context, 'An error occurred', () {}, () {});
    }
  }


}