import 'package:flutter/material.dart';
import 'package:muslim_app/model/azkar_model.dart';
import 'package:muslim_app/model/news_model.dart';
import 'package:muslim_app/providers/none_auth_provoders/news_providers/get_news_provider.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
        body: SideSpace(
      20,
      10,
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.31,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_children.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
            YSpace(2),
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_audio.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
            YSpace(2),
            Container(
              height: MediaQuery.of(context).size.height*0.18,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_post.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.31,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_children.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
            YSpace(2),
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_audio.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
            YSpace(2),
            Container(
              height: MediaQuery.of(context).size.height*0.18,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(('assets/images/group_post.png'),)),
              ),
              //child: Image.asset("assets/images/group_children.png"),
            ),
          ],
        ),
      )
      // Container(
      //   child: Consumer<GetNewsProvider>(builder: (context, value, child) {
      //   value.setBuildContext = context;
      //   return ListView.builder(
      //       itemCount: value.newsLists.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         NewsModel news = value.newsLists[index];
      //         return Column(
      //           children: [
      //             TextOf(news.title, 30, FontWeight.bold, black),
      //             TextOf(news.description, 30, FontWeight.bold, black),
      //             TextOf(news.targeted_users, 30, FontWeight.bold, black),
      //           ],
      //         );
      //       });
      // })),
    ));
  }
}
