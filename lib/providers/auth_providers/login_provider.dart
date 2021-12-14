import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/services/auth_apis/AuthAPI_Basics.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/unauthorised_users/unauthorised_tabs_index.dart';
import 'package:muslim_app/utils/constants.dart';
import 'package:muslim_app/utils/index.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class LoginProvider extends BaseProvider {
  String? _email;
  String? _password;
  String? TOKEN;
  bool formValidity = false;

  String get email => _email ?? "";
  String get password => _password ?? '';

  set setEmail(String email) {
    _email = email;
    checkFormValidity();
    notifyListeners();
  }

  set setPasword(String password) {
    _password = password;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_email != null) &&
        (_password != null) &&
        (_email!.length > 7) &&
        (_email!.length > 0) &&
        (_password!.length > 0)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void login(BuildContext context) async {
    try {
      if (_email == null || _password == null) {
        Alerts.responseAlert(context, "All fields are required", (){
          Navigator.pop(context);
        });
      } else if (_password!.length < 8) {
        Alerts.responseAlert(context, "Password length too short", (){
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, "Login in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var loginResponse =
            await AuthBasics.login(email: _email, password: _password);
        print("Muslim Login Response is $loginResponse");
        Alerts.closeLoadingAlert();
        if (loginResponse['status'] == true) {
          var tokenBox = await Hive.openBox(TOKEN_BOX);
          tokenBox.put(TOKEN_KEY, loginResponse['data']["token"]);
          Alerts.successAlert(context, "Login successful", (){
            ForwardNavigation.withNoReturn(context, HomeIndex());
          });
        } else {
          print("Muslim Login Response is $loginResponse");
        }
      }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.closeLoadingAlert();
      Alerts.errorAlert(context, 'Login failed', (){ForwardNavigation.withNoReturn(context, UnauthorisedHomeIndex());}, (){Navigator.pop(context);});
    }
  }

  LoginProvider() {
    checkFormValidity();
  }
}
//Another exception was thrown: LateInitializationError: Field '_password@18021021' has not been initialized.