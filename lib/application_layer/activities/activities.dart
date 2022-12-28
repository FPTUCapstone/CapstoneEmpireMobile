import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _HomePageState();
}

class _HomePageState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
          "Activities nè"
      ),
    );
  }
}
