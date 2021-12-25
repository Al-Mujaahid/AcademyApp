import 'package:bot_toast/bot_toast.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/mentor_model.dart';
import 'package:muslim_app/services/non_auth_apis/mentor_mentee/mentors_actions/get_mentors_actions.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetMentorProvider extends BaseProvider {
  List<MentorModel> mentorModel = [];

  GetMentorProvider() {
    getMentor();
  }
  void getMentor() async {
    try {
      setLoading = true;
      // Alerts.loadingAlert(context, "Trying to get azkar");
      BotToast.showLoading();
      var mentorResponse = await MentorList.getMentors();
      List mentors = List.from(mentorResponse['data']);
      print('ooooooooetttttting');
      print(mentors);
      mentorModel = mentors
          .map((json) => MentorModel.fromJson(json))
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
