import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/color_constant.dart';
import 'package:flutter_challenge/screens/home_screen.dart';

import 'constants/string_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appNameText,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: whiteColor
      ),
      home: HomeScreen(),
    );
  }
}