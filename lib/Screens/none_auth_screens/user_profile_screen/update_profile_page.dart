import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/update_provider.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/icon.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          Consumer<UpdateProfileProvider>(builder: (context, value, child) {
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
                TextOf("Update profile", 30, FontWeight.w900, ash2),
                YSpace(35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextOf("Nickname", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setnick_name = text,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Enter nickname",
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
                    TextOf("Gender", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setsex = text,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Enter Male or Female",
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
                    TextOf("School", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setschool = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Enter school name",
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
                    TextOf("Home Address", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setAddress = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Enter home address",
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
                    TextOf("Branch", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setBranch = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Branch name",
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
                    TextOf("Phone number", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setPhone = text,
                      //validator: ,
                      keyboardType: TextInputType.phone,

                      decoration: InputDecoration(
                          hintText: "Enter phone number",
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
                    TextOf("Course of study", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) =>
                          value.setcourse_of_study = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Course of study",
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
                    TextOf("Class", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setclasss = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Class",
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
                    TextOf("Qualification", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setqualification = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Qualification",
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
                    TextOf("Number of children", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) =>
                          value.setno_of_children = text,
                      //validator: ,
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                          hintText: "Number of children",
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
                    TextOf("Skill", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setskills = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Your skill",
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
                    TextOf("Marital status", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) =>
                          value.setmarital_status = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Marital satus",
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
                    TextOf("Post", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setpost = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Your post",
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
                    TextOf("Social Handle", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setsocial_media = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Your social handle",
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
                    print("trying to register someone");
                    value.update(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: white, width: 2),
                        color: green,
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                      child: SideSpace(
                          30, 15, TextOf("Save", 20, FontWeight.w800, white)),
                    ),
                  ),
                ),
                YSpace(5),
              ],
            ),
          ),
        ));
      })),
    );
  }
}
