import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/string_constant.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(registerText),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
