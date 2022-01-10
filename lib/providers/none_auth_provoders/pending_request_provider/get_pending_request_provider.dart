import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/pending_request_model.dart';
import 'package:muslim_app/services/non_auth_apis/pending_mentor_mentee_request/get_pending_mentor_mentee.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetPendingRequestsProvider extends BaseProvider {
   List<PendingMentorRequest> pendingMentorRequest = [];
   List<PendingMenteeRequest> pendingMenteeRequest = [];

  GetPendingRequestsProvider() {
    getPendingRequests();
  }
   getPendingRequests() async {
    try {
      BotToast.showLoading();
      var mentorRequest = await PendingMentorMentee.getPendingMentorRequest();
      var menteeRequest = await PendingMentorMentee.getPendingMenteeRequest();
      List mentors = List.from(mentorRequest['data']);
      List mentee = List.from(menteeRequest['data']);

      pendingMentorRequest =  mentors.map((json) => PendingMentorRequest.fromJson(json)).toList();
      pendingMenteeRequest =  mentee.map((json) => PendingMenteeRequest.fromJson(json)).toList();

      Alerts.closeLoadingAlert();
      notifyListeners();
    } catch (e) {
      print("ErrorMuslimAPP..... $e");
      Alerts.closeLoadingAlert();
      rethrow;
    }
  }
}
