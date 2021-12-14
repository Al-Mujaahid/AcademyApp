import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/providers/none_auth_provoders/azkar_providers/azkar_creation_providers.dart';
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
          Consumer<CreateAzkarProvider>(builder: (context, value, child) {
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
                TextOf("Azkar creattion", 30, FontWeight.w900, ash2),
                YSpace(35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextOf("Title", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.settitle = text,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Azkar title",
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
                    TextOf("Text", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setazkar_text = text,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Azkar text",
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
                    TextOf("Translation", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.settranslation = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Azkar translation",
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
                    TextOf("Transliteration", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) =>
                          value.settransliteration = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Azkar transliteration",
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
                    TextOf("time", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.settime = text,
                      //validator: ,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                          hintText: "Azkar time",
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
                    TextOf("Duration", 20, FontWeight.w500, ash2),
                    TextFormField(
                      onChanged: (String text) => value.setduration = text,
                      //validator: ,
                      keyboardType: TextInputType.phone,

                      decoration: InputDecoration(
                          hintText: "Azkar duration",
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
                    value.azkar(context);
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
