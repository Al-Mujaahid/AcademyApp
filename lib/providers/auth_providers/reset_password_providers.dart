import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/services/auth_apis/AuthAPI_Basics.dart';
import 'package:muslim_app/src/base_provider.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

class ResetPassoword extends BaseProvider {
  String? _email;
  String? _code;

  String get email => _email ?? "";
  String get code => _code ?? "";

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setCode(String code) {
    _code = code;
    notifyListeners();
  }

  void resetPassoword(BuildContext context) async {
    try {
      if (_email!.length == 0) {
        Alerts.responseAlert(context, "Email field cant be empty", (){Navigator.pop(context);});
      } else if (_code!.length != 6) {
        Alerts.responseAlert(context, "enter a valid code", (){Navigator.pop(context);});
      } else {
        Alerts.loadingAlert(context, "Processing email verification....");
        FocusScope.of(context).unfocus();
        var emailVerificationResponse =
            await AuthBasics.resetPassword(email: _email, code: _code);
        Alerts.closeLoadingAlert();
        print("muslim email verification is $emailVerificationResponse");
        Alerts.successAlert(context, 'Email verification successful', ForwardNavigation.withNoReturn(context, HomeIndex()));
      }
    } catch (e) {
      print("ERROR $e OCCURED");
      Alerts.responseAlert(context, 'Email verification failed', (){Navigator.pop(context);});
    }
  }

  ResetPassoword() {
    resetPassoword(context);
  }
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<ResetPassoword>(builder: (context, value, child) {
        return Container(
          child: SideSpace(
              15,
              30,
              SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                        child: MuslimAPPIcon(Icons.mail_rounded, green, 60),
                        radius: 40,
                        backgroundColor: ash_lite),
                    YSpace(20),
                    TextOf("Reset password", 30, FontWeight.w900, ash2),
                    YSpace(35),
                    Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextOf("Email address", 20, FontWeight.w500, ash2),
                          TextFormField(
                            onChanged: (String text) => value.setEmail = text,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "Enter email address",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: green, width: 1))),
                          )
                        ],
                      ),
                      YSpace(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextOf(
                              "Verification code", 20, FontWeight.w500, ash2),
                          TextFormField(
                            onChanged: (String text) => value.setCode = text,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "Enter 6 digit code",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: green, width: 1))),
                          )
                        ],
                      ),
                      YSpace(20),
                      InkWell(
                        onTap: () {
                          print("trying to register someone");
                          value.resetPassoword(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: white, width: 2),
                              color: green,
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                            child: SideSpace(
                                30,
                                15,
                                TextOf("Complete verification", 20,
                                    FontWeight.w800, white)),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              )),
        );
      }),
    ));
  }
}
