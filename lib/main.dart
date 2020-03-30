import 'package:flutter/material.dart';
import 'package:healthynepal/config.dart';
import 'package:healthynepal/ui/firstpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        fontFamily: 'Utsaah',
        primarySwatch: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white70,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: FirstPage(),
    );
  }
}
