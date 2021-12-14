import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/azkar_model.dart';
import 'package:muslim_app/services/non_auth_apis/azkar_actions/azkar_getting_action.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class GetAzkar extends BaseProvider {
  List<AzkarData> azkarData = [];

  GetAzkar() {
    getAzkar();
  }

  ///i am trying to re run the app
  ///i am on the azkar listing page but anything is not getting listed

  //  donwt worry this should work
  void getAzkar() async {
    try {
      Alerts.loadingAlert(context, "Trying to get azkar");
      var azkarResponse = await AzkarAction.getazkarAction();
      List all_azkar = json.decode(azkarResponse.data);
      azkarData = all_azkar.map((json) => AzkarData.fromJson(json)).toList();
      print(azkarResponse.runtimeType);
      Alerts.closeLoadingAlert();
      Alerts.successAlert(context, 'Successfully loaded Adhkar', (){Navigator.pop(context);});
      notifyListeners(); // To notify the ui about the changes //i
    } catch (e) {
      print("ErrorMuslimAPP..... $e");
      Alerts.errorAlert(context, 'Some error occurred', (){ForwardNavigation.withReturn(context, HomeIndex());}, (){Navigator.pop(context);});}
  }
}
