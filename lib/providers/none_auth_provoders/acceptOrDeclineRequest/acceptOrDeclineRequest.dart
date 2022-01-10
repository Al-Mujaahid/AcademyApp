import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentee_provider/get_mentee_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentor_provider/get_mentors_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/services/non_auth_apis/mentor_mentee/mentors_actions/acceptOrDeclineRequest.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:provider/provider.dart';

class AcceptOrDeclineRequestProvider extends BaseProvider {
  String? _status;
  String? _comment;
  bool formValidity = false;

  String get status => _status ?? "";
  String get comment => _comment ?? '';

  set setStatus(String status) {
    _status = status;
    checkFormValidity();
    notifyListeners();
  }

  set setComment(String comment) {
    _comment = comment;
    checkFormValidity();
    notifyListeners();
  }


  void checkFormValidity() {
    if ((_status != null) ||
        (_comment != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void respond(BuildContext context, recepId) async {
    print("Here is the issue causing id: $recepId");
    try {
      if (_status == null || _comment == null) {
        Alerts.responseAlert(context, "Comment can't be empty", (){Navigator.pop(context);});
      } else {
        Alerts.loadingAlert(context, "Request saving in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var acceptOrDecline = await AcceptOrDeclineRequest.acceptOrDeclineRequest(
          status: _status,
          comment: _comment,
          recipient_id: recepId
        );
        Alerts.closeLoadingAlert();
        print("Muslim acceptOrDecline Response is $acceptOrDecline");
        print("Muslim acceptOrDecline Response is $acceptOrDecline");
        Provider.of<GetPendingRequestsProvider>(context, listen: false).getPendingRequests();
        Provider.of<GetMentorProvider>(context, listen: false).getMentor();
        Provider.of<GetMenteeProvider>(context, listen: false).getMentor();
        // Navigator.of(context).pop();
        if (status == 'DECLINED') {
          Alerts.successAlert(context, "Request have been declined successfully", (){
            Navigator.pop(context);
          });
        } else {
          Alerts.successAlert(context, "Request have been accepted successfully", (){
            Navigator.pop(context);
          });
        }

      }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.closeLoadingAlert();
      Alerts.errorAlert(context, 'Some error occurred', (){ForwardNavigation.withNoReturn(context, HomeIndex());}, (){Navigator.pop(context);});
      rethrow;
    }
  }

  AcceptOrDeclineRequestProvider() {
    checkFormValidity();
  }
}
