import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousPageIcon(black, 20),
              TextOf('More', 15, FontWeight.w700, black),
              Icon(
                Icons.arrow_back,
                color: white,
              )
            ],
          ),
        ),
        YSpace(1),
        Divider(
          color: ash1,
        ),
        SideSpace(
            0,
            2,
            Column(
              children: [
                InkWell(
                  onTap: () {
                    ForwardNavigation.withReturn(context, UserProfile());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: white),
                    ),
                    child: SideSpace(
                        10,
                        10,
                        Row(
                          children: [
                            MuslimAPPIcon(Icons.person_outline_rounded,
                                Colors.green.shade500, 20),
                            XSpace(20),
                            TextOf('Profile', 15, FontWeight.w500, ash2),
                            Expanded(
                              child: XSpace(10),
                            ),
                            MuslimAPPIcon(
                                Icons.arrow_forward_ios_rounded, black, 10),
                          ],
                        )),
                  ),
                ),
                YSpace(5),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: white),
                    ),
                    child: SideSpace(
                        10,
                        10,
                        Row(
                          children: [
                            MuslimAPPIcon(Icons.insights_rounded,
                                Colors.pink.shade500, 20),
                            XSpace(20),
                            TextOf('Branches', 15, FontWeight.w500, ash2),
                            Expanded(
                              child: XSpace(10),
                            ),
                            MuslimAPPIcon(
                                Icons.arrow_forward_ios_rounded, black, 10)
                          ],
                        )),
                  ),
                ),
                YSpace(5),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: white),
                    ),
                    child: SideSpace(
                        10,
                        10,
                        Row(
                          children: [
                            MuslimAPPIcon(Icons.construction_rounded,
                                Colors.blue.shade500, 20),
                            XSpace(20),
                            TextOf('Reset password', 15, FontWeight.w500, ash2),
                            Expanded(
                              child: XSpace(10),
                            ),
                            MuslimAPPIcon(
                                Icons.arrow_forward_ios_rounded, black, 10),
                          ],
                        )),
                  ),
                ),
              ],
            ))
      ],
    )));
  }
}
