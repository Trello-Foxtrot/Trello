import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello/screens/login_screen.dart';
import 'package:trello/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => Login(),
      '/home': (BuildContext context) => MainScreen(),
    };
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(fontFamily: 'HelveticaNeue'),
      debugShowCheckedModeBanner: false,
      title: 'Trello',
    );
  }
}
