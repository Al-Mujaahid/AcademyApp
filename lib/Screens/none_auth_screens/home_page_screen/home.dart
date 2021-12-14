import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/home_page_screen/news_screens/news_lists.dart';
import 'package:muslim_app/Screens/none_auth_screens/home_page_screen/notification.dart';
import 'package:muslim_app/utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        color: white,
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(labelColor: green, unselectedLabelColor: ash1, indicatorWeight: 0.01, tabs: [
                  Tab(
                      icon: ImageIcon(
                        AssetImage("assets/images/news.png"),
                      ),
                      text: "News"),
                  Tab(
                      icon: ImageIcon(
                        AssetImage("assets/images/notify.png"),
                      ),
                      text: "Notification")
                ]),
                Expanded(child: TabBarView(children: [News(), Notify()]))
              ],
            )),
      ),
    );
  }
}
