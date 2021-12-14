import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/services/non_auth_apis/azkar_actions/azkar_creation_actions.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class CreateAzkarProvider extends BaseProvider {
  String? _title;
  String? _azkar_text;
  String? _azkar_transliteration;
  String? _azkar_translation;
  String? _duration;
  String? _time;
  bool formValidity = false;

  String get title => _azkar_text ?? "";
  String get azkar_text => _azkar_text ?? "";
  String get azkar_transliteration => _azkar_transliteration ?? '';
  String get azkar_translation => _azkar_translation ?? '';
  String get time => _time ?? '';
  String get duration => _duration ?? '';

  set settitle(String title) {
    _title = title;
    checkFormValidity();
    notifyListeners();
  }

  set setazkar_text(String azkar_text) {
    _azkar_text = azkar_text;
    checkFormValidity();
    notifyListeners();
  }

  set settranslation(String azkar_translation) {
    _azkar_translation = azkar_translation;
    checkFormValidity();
    notifyListeners();
  }

  set settransliteration(String azkar_transliteration) {
    _azkar_transliteration = azkar_transliteration;
    checkFormValidity();
    notifyListeners();
  }

  set settime(String time) {
    _time = time;
    checkFormValidity();
    notifyListeners();
  }

  set setduration(String duration) {
    _duration = duration;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_title != null) ||
        (_azkar_text != null) ||
        (_azkar_translation != null) ||
        (_azkar_transliteration != null) ||
        (_duration != null) ||
        (_time != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void azkar(BuildContext context) async {
    try {
      if (_azkar_text == null ||
          _azkar_translation == null ||
          _title == null ||
          _azkar_transliteration == null ||
          _time == null ||
          _duration == null) {
      } else {
        Alerts.loadingAlert(context, "Azkar saving in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var azkarResponse = await AzkarCreationAction.azkarCreationAction(
          title: _title,
          azkar_text: _azkar_text,
          azkar_translation: _azkar_translation,
          azkar_transliteration: _azkar_transliteration,
          time: _time,
          duration: _duration,
        );
        Alerts.closeLoadingAlert();
        print("Muslim azkarRegister Response is $azkarResponse");

        print("Muslim azkarRegister Response is $azkarResponse");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginRegister()),
            (route) => false);
        Alerts.successAlert(context, "Azkar creation successful", (){Navigator.pop(context);});
      }
    } catch (e) {
      print("Muslim error: $e");
    Alerts.errorAlert(context, 'Some error occurred', (){
      ForwardNavigation.withNoReturn(context, HomeIndex());
    }, (){Navigator.pop(context);});
    }
  }

  CreateAzkarProvider() {
    checkFormValidity();
  }
}
