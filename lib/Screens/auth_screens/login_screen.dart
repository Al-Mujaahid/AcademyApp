import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/providers/auth_providers/login_provider.dart';
import 'package:muslim_app/Screens/auth_screens/register_page.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

// class LoginRegister extends StatefulWidget {
//   const LoginRegister({Key? key}) : super(key: key);

//   @override
//   _LoginRegisterState createState() => _LoginRegisterState();
// }

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<LoginProvider>(builder: (context, value, child) {
        return (SideSpace(
          15,
          30,
          SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                    child: MuslimAPPIcon(Icons.class__rounded, green, 60),
                    radius: 40,
                    backgroundColor: ash_lite),
                YSpace(20),
                TextOf("Login", 30, FontWeight.w900, ash2),
                YSpace(35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextOf("Email", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setEmail = text,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter email",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: green, width: 1))),
                    )
                  ],
                ),
                YSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextOf("Password", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setPasword = text,
                      //validator: ,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter pasword",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: green, width: 1))),
                    )
                  ],
                ),
                YSpace(10),
                InkWell(
                    onTap: () {
                      print("trying to login");
                      value.login(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          color: green,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                        child: SideSpace(30, 15,
                            TextOf("Login", 20, FontWeight.w800, white)),
                      ),
                    )),
                YSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextOf("Dont have an account?", 15, FontWeight.w300, ash2),
                  ],
                ),
                YSpace(5),
                InkWell(
                    onTap: () {
                      print("trying to register");
                      //value.login(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                          (route) => false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: green, width: 2),
                          color: white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                        child: SideSpace(30, 15,
                            TextOf("Register", 20, FontWeight.w800, green)),
                      ),
                    )),
                YSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextOf("Forgot password?", 15, FontWeight.w300, ash2),
                    XSpace(5),
                    TextOf("recover", 15, FontWeight.w600, green),
                  ],
                ),
              ],
            ),
          ),
        ));
      })),
    );
  }
}
