import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/azkar_page_screen/view_adhkar/view_adhkar_screen.dart';
import 'package:muslim_app/providers/adhkar_screen_provider.dart';
import 'package:provider/provider.dart';

class TahjuAdhkarScreen extends StatefulWidget {
  TahjuAdhkarScreen({Key? key}) : super(key: key);

  @override
  _TahjuAdhkarScreenState createState() => _TahjuAdhkarScreenState();
}

class _TahjuAdhkarScreenState extends State<TahjuAdhkarScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<AdhkarScreenProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.tahjud.length,
              itemBuilder: (BuildContext context, int index) {
                var azkar = value.tahjud[index];
                return ListTile(
                  title: Text('${azkar['name']['en']}'),
                  subtitle: Text('${azkar['name']['ar']}'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAdhkarScreen(azkar),)),
                );
              }
            );
          },
        ),
      ),
    );
  }
}
