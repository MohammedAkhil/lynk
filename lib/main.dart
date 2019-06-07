import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lynk/screens/Login.dart';
import 'package:lynk/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  debugPaintSizeEnabled = false;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String authStatus = prefs.getString("authStatus");
  String userId = prefs.getString("userId");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp(authStatus: authStatus, userId: userId));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String authStatus;
  final String userId;
  MyApp({Key key, @required this.authStatus, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lynk',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff0d00ff),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
          textTheme: TextTheme(title: TextStyle(color: Colors.black12)),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Color(0xfff0f0f0),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800)))),
      home: authStatus == 'LOGGED_IN' ? Home(userId: userId) : Login(),
    );
  }
}
