import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/kamila.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/talim.dart';
import 'package:muslim_app/model/azkar_model.dart';
import 'package:muslim_app/utils/style.dart';

class Azkar extends StatefulWidget {
  const Azkar({Key? key}) : super(key: key);

  @override
  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  AzkarData? _azkarData = null;

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
                TabBar(labelColor: green, indicatorWeight: 0.01, unselectedLabelColor: ash1, tabs: [
                  Tab(
                    icon: ImageIcon(
                      AssetImage("assets/images/talim.png"),
                    ),
                    text: "Tahjud"
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage("assets/images/kamila.png"),
                    ),
                    text: "Kaamila"
                  )
                ]),
                Expanded(child: TabBarView(children: [TahjuAdhkarScreen(), KaamilaAdhkarScreen()]))
              ],
            )),
      ),
    );
  }
}
