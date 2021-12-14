import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/view_adhkar/adhkar_player_widget.dart';
import 'package:muslim_app/services/index.dart';
import 'package:muslim_app/utils/style.dart';
import 'package:muslim_app/widgets/SideSpace.dart';
import 'package:muslim_app/widgets/XSpace.dart';
import 'package:muslim_app/widgets/YSpace.dart';
import 'package:muslim_app/widgets/text.dart';

import '../azkar_creation_page.dart';

class ViewAdhkarScreen extends StatefulWidget {
  const ViewAdhkarScreen(this.adhkar, {Key? key}) : super(key: key);

  final adhkar;

  @override
  _ViewAdhkarScreenState createState() => _ViewAdhkarScreenState();
}

class _ViewAdhkarScreenState extends State<ViewAdhkarScreen> {

  bool loading = true;
  late Map<String, List<String>> adhkarContent;

  loadAdhkar() async {
    adhkarContent = await adhkarService.getAdhkarDetail('kaamila', widget.adhkar['id']);
    setState(() {
      adhkarContent = adhkarContent;
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadAdhkar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
          ),
          Column(
            children: [
              SideSpace(
                10,
                10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf("${widget.adhkar['name']['en']}", 24, FontWeight.bold, white),
                        TextOf("${widget.adhkar['name']['ar']}", 10, FontWeight.bold, white),
                      ]
                    ),
                    Row(children: [
                      Image.asset("assets/images/notification.png", height: 24, width: 24,),
                      XSpace(10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatePage()));
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: ash1,
                        ),
                      )
                    ])
                  ],
                ),
              ),
              YSpace(10),
              Expanded(
                child: loading ? Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ) : Container(
                  color: Colors.white,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: adhkarContent['arabic']!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: Colors.grey.withOpacity(.09),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("${adhkarContent['arabic']![index]}", style: GoogleFonts.arapey(
                              fontSize: 16
                            ), textAlign: TextAlign.end,),
                            YSpace(5),
                            Text("${adhkarContent['transliteration']![index]}", style: GoogleFonts.mulish(
                                fontSize: 16
                            ), textAlign: TextAlign.justify,),
                            YSpace(5),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              YSpace(30),
            ],
          ),
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: AdhkarPlayerWidget(),
          )
        ]),
      ),
    );
  }
}
