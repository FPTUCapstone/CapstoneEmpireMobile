import 'dart:async';
import 'package:empiregarage_mobile/screens/login/login_screen.dart';
import 'package:empiregarage_mobile/utilities/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),()
    => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen(),
        )
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.welcomeScreenBackGround,
        body: Center(
            child: Container(
              width: 290,
              height: 106,
              child: Image.asset('assets/image/empirelogo.png'),
            )
        ),
      ),

    );
  }

}
