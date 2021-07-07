import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String fullName;
  DetailsScreen({@required this.fullName});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fullName),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
