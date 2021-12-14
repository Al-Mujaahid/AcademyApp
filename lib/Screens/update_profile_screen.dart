import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/update_provider.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

class UpdateUserProfile extends StatelessWidget {
  static String? init_phone;

  static String? init_branch;

  static String? init_school;

  static String? init_classs;

  static String? init_course_of_stydy;
  static int? init_no_of_children;
  static String? init_social_media;
  static String? init_skills;
  static String? init_availability_status;
  static String? init_marital_status;
  static String? init_post;
  static String? init_address;
  static String? init_sex;
  static String? init_qualification;
  const UpdateUserProfile({Key? key}) : super(key: key);
  static String? init_nikcname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<UpdateProfileProvider>(builder: (context, value, child){
          return SideSpace(10, 10, Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextOf('Edit Profile', 30, FontWeight.w900, black),
                  InkWell(
                    onTap: (){value.update(context);},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SideSpace(5,5,TextOf('Save changes', 15, FontWeight.w600, green)),
                    )
                  )
                ],),

              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    YSpace(10),
                    Row(children: [
                      TextOf('Nickname', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setnick_name = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_nikcname,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Phone number', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text){
                          value.setPhone = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_phone,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('School', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setschool = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_school,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Class', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setclasss = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_classs,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Course of study', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setcourse_of_study = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_course_of_stydy,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Qualification', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setqualification = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_qualification,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Branch name', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setBranch = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_branch,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Number of children', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          value.setno_of_children = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_no_of_children.toString(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Social media', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setsocial_media = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_social_media,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Skills', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setskills = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_skills,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Availability status', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setAvailabilityStatus = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_availability_status,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Marital status', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setmarital_status = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_marital_status,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Post', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setpost = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_post,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Home address', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setAddress = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_address,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                    YSpace(10),
                    Row(children: [
                      TextOf('Gender', 20, FontWeight.w400, black),
                    ],),
                    Container(
                      width: double.infinity,
                      child: SideSpace(10, 10,TextFormField(
                        onChanged: (text){
                          value.setsex = text;
                        },
                        decoration: InputDecoration(
                            hintText: UpdateUserProfile.init_sex,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ash2
                                )
                            )
                        ),
                      )),
                    ),
                  ],
                ),
              ))
            ],
          ));
        },),
      ),
    );
  }
}
