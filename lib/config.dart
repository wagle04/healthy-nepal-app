import 'package:flutter/material.dart';

String appName = "Healthy Nepal";

AppBar appBar = AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset("assets/images/logo.png"),
  ),
  title: Center(
    child: Text(appName),
  ),
);

const String spreadSheetURL = 'your google spredsheet url here';
