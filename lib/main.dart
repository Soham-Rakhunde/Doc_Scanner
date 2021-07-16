import 'package:chmod_hackathon/Screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  Future.delayed(Duration(milliseconds: 1)).then(
          (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // isHomeOpen
        //     ? backgroundColor
        //     : drawerColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFF1F2F6),
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Color(0xFFF1F2F6),
      )));
  Future.delayed(Duration(milliseconds: 1))
      .then((value) => SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final mainColor = MaterialColor(0xFF880E4F, {
  50:Color.fromRGBO(12,245,227, 1),
  100:Color.fromRGBO(12,245,227, 1),
  200:Color.fromRGBO(12,245,227, 1),
  300:Color.fromRGBO(12,245,227, 1),
  400:Color.fromRGBO(12,245,227, 1),
  500:Color.fromRGBO(12,245,227, 1),
  600:Color.fromRGBO(12,245,227, 1),
  700:Color.fromRGBO(12,245,227, 1),
  800:Color.fromRGBO(12,245,227, 1),
  900:Color.fromRGBO(12,245,227, 1),
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}