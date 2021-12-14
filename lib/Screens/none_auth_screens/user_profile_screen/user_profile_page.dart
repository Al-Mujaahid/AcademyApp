import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentee.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/Screens/update_profile_screen.dart';
import 'package:muslim_app/helper/edit_profile_alert.dart';
import 'package:muslim_app/model/user_profile_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/user_profile_provider.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  static int? one_user_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(child: Consumer<UserProfileProvider>(
            builder: (context, value, child) {
              //one_user_id = value.userData as int?;
              value.setBuildContext = context;
              //UserProfileModel userD = value.userData['];
              if (!value.loading) {
                UserProfileModel userD = value.userData;
                UpdateUserProfile.init_nikcname = userD.nick_name;
                UpdateUserProfile.init_phone = userD.phone_number;
                UpdateUserProfile.init_branch = userD.branch;
                UpdateUserProfile.init_school = userD.school;
                UpdateUserProfile.init_classs = userD.classs;
                UpdateUserProfile.init_branch = userD.course_of_stydy;
                UpdateUserProfile.init_qualification = userD.qualification;
                UpdateUserProfile.init_course_of_stydy = userD.course_of_stydy;
                UpdateUserProfile.init_no_of_children = userD.no_of_children;
                UpdateUserProfile.init_social_media = userD.social_media;
                UpdateUserProfile.init_skills = userD.skills;
                UpdateUserProfile.init_availability_status = userD.availability_status;
                UpdateUserProfile.init_marital_status = userD.marital_status;
                UpdateUserProfile.init_post = userD.post;
                UpdateUserProfile.init_address = userD.address;
                UpdateUserProfile.init_sex = userD.sex;

                one_user_id = userD.user_id;
                return SideSpace(10, 5, Column(
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     TextOf('Profile', 30, FontWeight.w900, black),
                     IconButton(onPressed: (){}, icon: Icon(Icons.settings_outlined, size: 30,))
                   ],),
                    YSpace(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userD.image_url!,),
                          radius: 40,
                        ),]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextOf(userD.first_name!, 23, FontWeight.w900, black),
                              XSpace(5),
                              TextOf(userD.last_name!, 23, FontWeight.w900, black)
                            ],
                          ),
                          TextOf(userD.social_media!, 17, FontWeight.w400, ash2),
                          TextOf(userD.email!, 17, FontWeight.w400, ash2)
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          EditProfileAlert.editProfilrAlert(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: black, width: 1),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: SideSpace(5,5, TextOf('Edit Profile', 15, FontWeight.bold, black)),
                        ),
                      )
                    ],),
                    YSpace(10),
                    Container(
                      decoration: BoxDecoration(
                        color: ash1,
                          border: Border.all(color: ash1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: SideSpace(30, 10, Column(
                        children: [
                          TextOf('You have...', 18, FontWeight.w600, black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [TextOf(MentorListPage.number_of_mentors.toString(), 20, FontWeight.bold, black),
                                  TextOf('Mentors', 20, FontWeight.w400, black)],),
                                Column(children: [TextOf(Mentee.number_of_mentees.toString(), 20, FontWeight.bold, black),
                                  TextOf('Mentees', 20, FontWeight.w400, black)],),
                              ],
                            ),
                        ],
                      ),
                      ),
                    ),
                    Divider(color: ash1, thickness: 2,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              TextOf('Nickname', 20, FontWeight.w400, black),
                            ],),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              border: Border.all(color: ash2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SideSpace(10, 10,TextOf(userD.nick_name!, 19, FontWeight.w500, black)),
                          ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Phone', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.phone_number!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('School', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.school!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Home Address', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.address!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Gender', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.sex!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Class', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.classs!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Course of study', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.course_of_stydy!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Qualification', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.qualification!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Number of children', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.no_of_children.toString()!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Skills', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.skills!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Availability status', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.availability_status!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Marital status', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.marital_status!, 19, FontWeight.w500, black)),
                            ),
                            YSpace(7),
                            Row(children: [
                              TextOf('Post', 20, FontWeight.w400, black),
                            ],),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: ash2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SideSpace(10, 10,TextOf(userD.post!, 19, FontWeight.w500, black)),
                            ),
                          ],),
                        ),
                    ),

                    ]));
              }
              return Container(
                child: Center(
                  child: TextOf("Please wait...", 15, FontWeight.bold, black),
                ),
              );
            },
          )
          )
      ),
    );
}
  }
  //