import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class UserProfileSettings extends StatelessWidget {
  const UserProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: 40.h,
              width: 108.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MainPage()));
                },
                child: Image.asset(
                  "assets/image/app-logo/homepage-icon.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 160.w,
              height: 160.h,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/image/user-pic/user.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      width: 33.w,
                      height: 33.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.buttonColor,
                        shape: BoxShape.rectangle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_rounded,
                          color: AppColors.whiteButtonColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
