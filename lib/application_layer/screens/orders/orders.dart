import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _HomePageState();
}

class _HomePageState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
          "Orders nè"
      ),
    );
  }
}
