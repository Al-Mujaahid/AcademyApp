import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/pending_request_model.dart';
import 'package:muslim_app/services/non_auth_apis/pending_mentor_mentee_request/get_pending_mentor_mentee.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetPendingRequestsProvider extends BaseProvider {
   List<PendingRequestModel> pendingRequestModel = [];

  GetPendingRequestsProvider() {
    getPendingRequests();
  }
   getPendingRequests() async {
    try {
      BotToast.showLoading();
      var pendingRequestResponse = await PendingMentorMentee.getPendingMentorMentee();
      List mentors = List.from(pendingRequestResponse['data']);
      print('ooooooooetttttting');
      print(mentors);
      pendingRequestModel =  mentors.map((json) => PendingRequestModel.fromJson(json)).toList();
      Alerts.closeLoadingAlert();
      notifyListeners();
    } catch (e) {
      print("ErrorMuslimAPP..... $e");
      Alerts.closeLoadingAlert();
    }
  }
}
