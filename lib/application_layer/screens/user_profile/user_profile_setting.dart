import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/colors.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({super.key});

  @override
  State<UserProfileSettings> createState() => _UserProfileSettingsState();
}

class _UserProfileSettingsState extends State<UserProfileSettings> {
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
        body: Column(
          children: [
            Padding(
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
                          backgroundImage:
                              AssetImage("assets/image/user-pic/user.png"),
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
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 57.h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Hồng Phúc",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProDisplay',
                            color: AppColors.blackTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "0123456789",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProDisplay',
                            color: AppColors.blackTextColor),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 24),
              height: 76.h,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      //TODO
                    },
                    child: Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(FontAwesomeIcons.user,size: 24,),
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SFProDisplay',
                              color: AppColors.blackTextColor),
                        ),
                        const Spacer(),
                        const Icon(Icons.navigate_next,size: 20,color: Colors.black,)
                  
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      //TODO
                    },
                    child: Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(Icons.logout,size: 24,color: Colors.red,),
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SFProDisplay',
                              color: Colors.red),
                        ),
                        const Spacer(),
                        const Icon(Icons.navigate_next,size: 20,color: Colors.red,)
                  
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
