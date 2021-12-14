import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/providers/auth_providers/verify_email_provider.dart';
import 'package:muslim_app/services/auth_apis/AuthAPI_Basics.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/constants.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class RegisterProvider extends BaseProvider {
  String? _first_name;
  String? _last_name;
  String? _email;
  String? _phone_number;
  String? _confirm_password;
  String? _password;
  bool formValidity = false;

  String get first_name => _first_name ?? "";
  String get last_name => _last_name ?? "";
  String get phone_number => _phone_number ?? "";
  String get email => _email ?? "";
  String get confirm_password => _confirm_password ?? '';
  String get password => _password ?? '';

  set setFirstName(String first_name) {
    _first_name = first_name;
    checkFormValidity();
    notifyListeners();
  }

  set setPhoneNumber(String phone_number) {
    _phone_number = phone_number;
    checkFormValidity();
    notifyListeners();
  }

  set setLastName(String last_name) {
    _last_name = last_name;
    checkFormValidity();
    notifyListeners();
  }

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

  set setConfirmPasword(String confirm_password) {
    _confirm_password = confirm_password;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_first_name != null) &&
        (_last_name != null) &&
        (_phone_number != null) &&
        (_email != null) &&
        (_password != null) &&
        (_password!.length > 7) &&
        (_email!.length > 0) &&
        (_confirm_password!.length > 7)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void register(BuildContext context) async {
    try {
      if (_email == null ||
          _password == null ||
          _first_name == null ||
          _phone_number == null ||
          _last_name == null ||
          _confirm_password == null) {
        Alerts.responseAlert(context, 'All fields are required', (){Navigator.pop(context);});
      } else if (_password!.length < 8) {
        Alerts.responseAlert(context, 'Password length too short', (){Navigator.pop(context);});      } else if (_phone_number!.length < 11 || _phone_number!.length > 11) {
        Alerts.responseAlert(context, 'Phone number length must me exactly 11', (){Navigator.pop(context);});
      } else if (_password != _confirm_password) {
        Alerts.responseAlert(context, 'Password mismatch', (){Navigator.pop(context);});      } else if (_first_name!.length == 0) {
        Alerts.responseAlert(context, 'First name required', (){Navigator.pop(context);});      } else if (_last_name!.length == 0) {
        Alerts.responseAlert(context, 'Last name required', (){Navigator.pop(context);});      } else if (_email!.length == 0) {
        Alerts.responseAlert(context, 'Email required', (){Navigator.pop(context);});      } else {
        Alerts.loadingAlert(context, "Registration in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var registerResponse = await AuthBasics.register(
          first_name: _first_name,
          last_name: _last_name,
          phone_number: _phone_number,
          email: _email,
          password: _password,
          confirm_password: _confirm_password,
        );
        Alerts.closeLoadingAlert();
        print("Muslim Register Response is $registerResponse");
        if (registerResponse['status'] = true) {
          Alerts.successAlert(context, 'Confirmation link has been sent to your mail', (){ForwardNavigation.withNoReturn(context, EmailVerificationPage());});

        } else {
          print("Failed $registerResponse['message']");
        }
      }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.responseAlert(context, 'Some error occurred', (){Navigator.pop(context);});
      print("Muslim error: $e");
    }
  }

  RegisterProvider() {
    checkFormValidity();
  }
}
//Another exception was thrown: LateInitializationError: Field '_password@18021021' has not been initialized.