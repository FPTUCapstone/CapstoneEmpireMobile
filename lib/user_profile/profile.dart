import 'package:empiregarage_mobile/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Text(
                    "Thông tin\nngười dùng",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Hãy điền thông tin của bạn",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Tên",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Nguyễn Văn A",
                            ),
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Nguyễn Văn A",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Nguyễn Văn A",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Nguyễn Văn A",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Nguyễn Văn A",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.signInBtn,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cập nhật thông tin',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
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
