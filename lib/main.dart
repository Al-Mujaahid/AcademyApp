import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/none_auth_screens/all_tabs_index.dart';
import 'package:muslim_app/providers/adhkar_screen_provider.dart';
import 'package:muslim_app/providers/auth_providers/forgot_password.dart';
import 'package:muslim_app/providers/auth_providers/login_provider.dart';
import 'package:muslim_app/providers/auth_providers/verify_email_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/acceptOrDeclineRequest/acceptOrDeclineRequest.dart';
import 'package:muslim_app/providers/none_auth_provoders/azkar_providers/azkar_creation_providers.dart';
import 'package:muslim_app/providers/none_auth_provoders/azkar_providers/azkar_getting_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentee_provider/get_mentee_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/mentor_provider/get_mentors_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/news_providers/get_news_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/rate_mentor_mentee.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/create_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/schedule_provider/get_schedule.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/update_provider.dart';
import 'package:muslim_app/providers/none_auth_provoders/user_profile_provider/user_profile_provider.dart';
import 'package:muslim_app/unauthorised_users/unauthorised_tabs_index.dart';
import 'package:muslim_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:muslim_app/providers/auth_providers/register_provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox(TOKEN_BOX);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => RegisterProvider()),
    ChangeNotifierProvider(create: (context) => UserProfileProvider()),
    ChangeNotifierProvider(create: (context) => CreateAzkarProvider()),
    ChangeNotifierProvider(create: (context) => VerifyEmail()),
    ChangeNotifierProvider(create: (context) => GetNewsProvider()),
    ChangeNotifierProvider(create: (context) => GetAzkar()),
    ChangeNotifierProvider(create: (context) => ForgotPassword()),
    ChangeNotifierProvider(create: (context) => GetMentorProvider()),
    ChangeNotifierProvider(create: (context) => GetMenteeProvider()),
    ChangeNotifierProvider(create: (context) => GetMentorProvider()),
    ChangeNotifierProvider(create: (context) => AcceptOrDeclineRequestProvider()),
    ChangeNotifierProvider(create: (context) => AdhkarScreenProvider()),
    ChangeNotifierProvider(create: (context) => CreateScheduleProvider()),
    ChangeNotifierProvider(create: (context) => GetScheduleProvider()),
    ChangeNotifierProvider(create: (context) => UpdateProfileProvider()),
    ChangeNotifierProvider(create: (context) => RateMentorMenteeProvider()),
    ChangeNotifierProvider(create: (context) => GetPendingRequestsProvider()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final botToastBuilder = BotToastInit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuslimAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnauthorisedHomeIndex(),
      builder: (context, child) {
        return botToastBuilder(context, child);
      },
      navigatorObservers: [BotToastNavigatorObserver(),],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
