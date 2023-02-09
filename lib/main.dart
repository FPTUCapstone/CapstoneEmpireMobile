import 'package:empiregarage_mobile/application_layer/screens/home_page/home_page.dart';
import 'package:empiregarage_mobile/application_layer/screens/login/login_screen.dart';
import 'package:empiregarage_mobile/application_layer/screens/notification/notification.dart';
import 'package:empiregarage_mobile/application_layer/screens/search/search.dart';
import 'package:empiregarage_mobile/application_layer/screens/services/service_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_layer/screens/main_page/main_page.dart';
import 'application_layer/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SearchPage(),
    );
  }
}
