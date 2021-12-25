import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/auth_screens/login_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/services/non_auth_apis/user_profile_actions/update_profile_action.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';

class OtherPersonalInfoProvider extends BaseProvider {
  String? _phone;
  String? _nick_name;
  String? _branch;
  String? _school;
  String? _classs;
  String? _course_of_study;
  String? _qualification;
  String? _no_of_children;
  String? _social_media;
  String? _skills;
  String? _availability_status;
  String? _marital_status;
  String? _post;
  String? _address;
  String? _sex;

  bool formValidity = false;

  String get phone => _phone ?? "";
  String get address => _address ?? "";
  String get availability_status => _availability_status ?? '';
  String get branch => _branch ?? '';
  String get classs => _classs ?? '';
  String get course_of_study => _course_of_study ?? '';
  String get marital_status => _marital_status ?? '';
  String get nick_name => _nick_name ?? '';
  String get no_of_children => _no_of_children ?? '';
  String get post => _post ?? '';
  String get qualification => _qualification ?? '';
  String get school => _school ?? '';
  String get sex => _sex ?? '';
  String get skills => _skills ?? '';
  String get social_media => _social_media ?? '';

  set setPhone(String phone) {
    _phone = phone;
    checkFormValidity();
    notifyListeners();
  }

  set setAddress(String address) {
    _address = address;
    checkFormValidity();
    notifyListeners();
  }

  set setAvailabilityStatus(String availability_status) {
    _availability_status = availability_status;
    checkFormValidity();
    notifyListeners();
  }

  set setBranch(String branch) {
    _branch = branch;
    checkFormValidity();
    notifyListeners();
  }

  set setclasss(String classs) {
    _classs = classs;
    checkFormValidity();
    notifyListeners();
  }

  set setcourse_of_study(String course_of_study) {
    _course_of_study = course_of_study;
    checkFormValidity();
    notifyListeners();
  }

  set setmarital_status(String marital_status) {
    _marital_status = marital_status;
    checkFormValidity();
    notifyListeners();
  }

  set setnick_name(String nick_name) {
    _nick_name = nick_name;
    checkFormValidity();
    notifyListeners();
  }

  set setno_of_children(String no_of_children) {
    _no_of_children = no_of_children;
    checkFormValidity();
    notifyListeners();
  }

  set setpost(String post) {
    _post = post;
    checkFormValidity();
    notifyListeners();
  }

  set setqualification(String qualification) {
    _qualification = qualification;
    checkFormValidity();
    notifyListeners();
  }

  set setschool(String school) {
    _school = school;
    checkFormValidity();
    notifyListeners();
  }

  set setsex(String sex) {
    _sex = sex;
    checkFormValidity();
    notifyListeners();
  }

  set setskills(String skills) {
    _skills = skills;
    checkFormValidity();
    notifyListeners();
  }

  set setsocial_media(String social_media) {
    _social_media = social_media;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_address != null) ||
        (_availability_status != null) ||
        (_branch != null) ||
        (_classs != null) ||
        (_course_of_study != null) ||
        (_marital_status != null) ||
        (_nick_name != null) ||
        (_no_of_children != null) ||
        (_phone != null) ||
        (_post != null) ||
        (_qualification != null) ||
        (_school != null) ||
        (_sex != null) ||
        (_skills != null) ||
        (_social_media != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void update(BuildContext context) async {
    try {
      if (_address == null &&
          _availability_status == null &&
          _branch == null &&
          _classs == null &&
          _course_of_study == null &&
          _marital_status == null &&
          _nick_name == null &&
          _no_of_children == null &&
          _phone == null &&
          _post == null &&
          _qualification == null &&
          _school == null &&
          _sex == null &&
          _skills == null &&
          _social_media == null) {
        Alerts.responseAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, "Profile update in progress...");
        FocusScope.of(context).unfocus();
        setLoading = true;
        var updateResponse =
            await UpdateProfileAction.updateOtherPersonalInfoAction(
                phone: _phone,
                nick_name: _nick_name,
                branch: _branch,
                school: _school,
                classs: _classs,
                course_of_study: _course_of_study,
                qualification: _qualification,
                no_of_children: _no_of_children,
                social_media: _social_media,
                skills: _skills,
                availability_status: _availability_status,
                marital_status: _marital_status,
                post: _post,
                address: _address,
                sex: _sex);
        Alerts.closeLoadingAlert();
        print("Updating user is $updateResponse");

        print("Muslim Register Response is $updateResponse");
        Alerts.responseAlert(context, 'Update successful', () {
          ForwardNavigation.withNoReturn(context, UserProfile());
        });
      }
    } catch (e) {
      print("Muslim error: $e");
      Alerts.responseAlert(context, 'Some error occurred', () {
        ForwardNavigation.withNoReturn(context, HomeIndex());
      });
      BotToast.closeAllLoading();
      ForwardNavigation.withNoReturn(context, UserProfile());
    }
  }

  EmailUsernamePhoneProvider() {
    checkFormValidity();
  }
}
//Another exception was thrown: LateInitializationError: Field '_password@18021021' has not been initialized.