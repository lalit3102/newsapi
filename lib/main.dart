import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squareboatlalit/ui/home/home.dart';
import 'package:get/get.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();
  runApp(
    GetMaterialApp(
      navigatorKey: navigatorKey,
      home: Home(),
      theme: ThemeData(
        fontFamily: "Georgia",
        primaryColor: Color(0xff0C54BE),
        scaffoldBackgroundColor: Color(0xffF5F9FD),
      ),
    ),
  );
}
