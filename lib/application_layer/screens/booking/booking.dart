import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _HomePageState();
}

class _HomePageState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
          "Booking nè"
      ),
    );
  }
}
