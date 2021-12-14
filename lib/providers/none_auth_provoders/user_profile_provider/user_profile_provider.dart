
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/user_profile_model.dart';
import 'package:muslim_app/services/non_auth_apis/user_profile_actions/get_user_profile.dart';
import 'package:muslim_app/src/base_provider.dart';

class UserProfileProvider extends BaseProvider {
  UserProfileModel userData = UserProfileModel();
  void userProfile() async {
    try {
      setLoading = true;
      BotToast.showLoading();
      final profileResponse = await GetUserProfile.getProfile();
      print(profileResponse);
      userData = UserProfileModel.fromJson((profileResponse["data"]));
      Alerts.closeLoadingAlert();
      setLoading = false;
  //
    } catch (r) {
      print('Érror...........$r');

      Alerts.responseAlert(context, "Unable to load profile \n $r", (){Navigator.pop(context);});
      Alerts.closeLoadingAlert();
      rethrow;
    }
  }

  UserProfileProvider() {
    userProfile();
  }
}
