import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/get_all_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/rate_mentor_mentee.dart';
import 'package:muslim_app/utils/muslim_navigation.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'mentor_mentee_screen/mentor.dart';
import 'mentor_mentee_screen/schedule/create_schedule.dart';

class RateMentorMenteePage extends StatefulWidget {
  RateMentorMenteePage({Key? key}) : super(key: key);
  @override
  _RateMentorMenteePageState createState() => _RateMentorMenteePageState();
}

class _RateMentorMenteePageState extends State<RateMentorMenteePage> {
  double slider = 50;
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<RateMentorMenteeProvider>(builder: (context, value, child){
        return Column(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: white),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PreviousPageIcon(black, 20),
                    XSpace(7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf('Details of', 15, FontWeight.w500, ash2),
                        TextOf(MentorDetail.objective!, 20, FontWeight.w900, ash2),
                      ],
                    )
                  ],),
                Row(
                  children: [
                    // IconButton(onPressed: (){ForwardNavigation.withReturn(context, CreateScheduleScreen());}, icon: Icon(Icons.video_camera_back_outlined, color: black,),),
                    //IconButton(onPressed: (){ForwardNavigation.withReturn(context, RateMentorMenteePage());}, icon: Icon(Icons.star, color: Colors.amber,),),

                  ],
                )
              ],
            ),),
          YSpace(20),
          SideSpace(10, 10, Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextOf("Your review", 20, FontWeight.w500, ash2),
                  TextFormField(
                    maxLines: 6,
                    onChanged: (String text) => value.set_comments = text,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter review",
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: green, width: 1))),
                  ),
                  YSpace(20),
                  Column(children: [
                    // Row(mainAxisAlignment: MainAxisAlignment.start, children: [TextOf('Rating', 20, FontWeight.w500, ash2)],)
                    //
                  ],),
                  // Slider(value: slider,
                  //     min: 0, max: 100,
                  //     activeColor: green,
                  //     divisions: 5,
                  //     inactiveColor: ash1,
                  //     label: slider.round().toString(),
                  //     onChanged: (sliders) => setState(() => slider = sliders)
                  // ),
                  Column(
                    children: [ TextOf('Rating: $rating', 25, FontWeight.w900, black),
                      YSpace(10),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [RatingBar.builder(
                              itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
                              minRating: 1,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2),
                              itemSize: 48,
                              updateOnDrag: true,
                              onRatingUpdate: (rating)=> setState(() {this.rating = rating; value.setratings = rating;}))
                          ]),
                    ],
                  )
                ],
              ),
              YSpace(20),
              InkWell(
                  onTap: () {
                    value.rate(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: white, width: 2),
                        color: green,
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                      child: SideSpace(30, 15,
                          TextOf("Complete Rating", 20, FontWeight.w800, white)),
                    ),
                  )),
            ],
          ),
          )
        ],);
      })),
    );
  }
}
