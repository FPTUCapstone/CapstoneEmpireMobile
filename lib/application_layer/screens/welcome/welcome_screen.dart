import 'dart:async';
import 'package:empiregarage_mobile/application_layer/screens/login/login_screen.dart';
import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:flutter/material.dart';

import '../../../common/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var _route;
  @override
  void initState() {
    _getToken();
    super.initState();
  }

  _getToken() async {
    var token = await getJwtToken();
    if (!mounted) return;
    if (token != null) {
      _route = Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const MainPage(),
      ));
    } else {
      _route = Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => _route);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.welcomeScreenBackGround,
        body: Center(
            child: SizedBox(
          width: 290,
          height: 106,
          child: Image.asset('assets/image/app-logo/empirelogo.png'),
        )),
      ),
    );
  }
}
