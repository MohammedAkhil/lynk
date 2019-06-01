import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lynk/screens/Host.dart';
import 'package:lynk/screens/Home.dart';
import 'package:lynk/screens/Login.dart';

void main() {
  debugPaintSizeEnabled = false;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: Host(),
    );
  }
}
