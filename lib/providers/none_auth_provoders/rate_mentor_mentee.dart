import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/services/non_auth_apis/mentor_mentee/rate_mentor_mentee.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class RateMentorMenteeProvider extends BaseProvider {
  double? _ratings;
  String? _comments;
  bool formValidity = false;

  double get ratings => _ratings!;
  String get comments => _comments ?? '';

  set setratings(double ratings) {
    _ratings = ratings;
    checkFormValidity();
    notifyListeners();
  }


  set set_comments(String comments) {
    _comments = comments;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_ratings != null)||
        (_comments != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void rate(BuildContext context) async {
    try {
      if (_ratings == null ||
          _comments == null) {
        Alerts.responseAlert(context, "Comment and the Rating required", (){Navigator.pop(context);});
      } else {
        Alerts.loadingAlert(context, " RateMentorMentee saving in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var RateMentorMenteeResponse = await RateMentorMenteeAction.rateMentorMenteeAction(
          ratings: _ratings,
          comments: _comments,
        );
        Alerts.closeLoadingAlert();
        print("Muslim RateMentorMenteeRegister Response is $RateMentorMenteeResponse");

        print("Muslim RateMentorMenteeRegister Response is $RateMentorMenteeResponse");

        Alerts.responseAlert(context, "Rating successful", (){ForwardNavigation.withNoReturn(context, HomeIndex());});
        }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.responseAlert(context, "Check your internet connection", (){Navigator.pop(context);});
      Alerts.closeLoadingAlert();
    }
  }

  RateMentorMenteeProvider() {
    checkFormValidity();
  }
}
