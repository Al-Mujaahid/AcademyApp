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

class ForgotPassword extends BaseProvider {
  String? _email;

  String get email => _email ?? "";

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void forgotPassword(BuildContext context) async {
    try {
      if (_email!.length == 0) {
        Alerts.errorAlert(context, "Email field cant be empty", (){}, (){
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, "Processing password recovery....");
        FocusScope.of(context).unfocus();
        var forgotPasswordResponse =
            await AuthBasics.forgotPassword(email: _email);
        print("muslim email verification is $forgotPasswordResponse");
        Alerts.closeLoadingAlert();
        Alerts.successAlert(
            context, "Recovery code successfully sent to your mail", (){
              Navigator.pop(context);
        },);

      }
    } catch (e) {
      print("ERROR $e OCCURED");
      Alerts.errorAlert(context, "Some errors occurred", (){}, (){});
    }
  }

  ForgotPassword() {
    forgotPassword(context);
  }
}

class ForgotPasswordRecoveryPage extends StatelessWidget {
  const ForgotPasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<ForgotPassword>(builder: (context, value, child) {
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
                    TextOf("Forgor Passowrd", 30, FontWeight.w900, ash2),
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
                      YSpace(20),
                      InkWell(
                        onTap: () {
                          print("processing forgot password...");
                          value.forgotPassword(context);
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
                                TextOf("Generate recovery code", 20,
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
