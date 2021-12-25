import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/mentee_model.dart';
import 'package:muslim_app/services/non_auth_apis/mentor_mentee/mentee_actions/get_mentee_actions.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetMenteeProvider extends BaseProvider {
  List<MenteeModel> menteeModel = [];

  GetMenteeProvider() {
    getMentor();
  }
  void getMentor() async {
    try {
      setLoading = true;
      // Alerts.loadingAlert(context, "Trying to get mentees");
      BotToast.showLoading();

      var mentorResponse = await MenteeList.getMentees();
      List mentees = List.from(mentorResponse['data']);
      print(mentees);
      menteeModel = mentees
          .map((json) => MenteeModel.fromJson(json))
          .where((element) => element.id != UserProfile.one_user_id)
          .toList();
      Alerts.closeLoadingAlert();
      setLoading = false;
      notifyListeners();
    } catch (e) {
      print("ErrorMuslimAPP..... $e");
      Alerts.closeLoadingAlert();
    }
  }
}
