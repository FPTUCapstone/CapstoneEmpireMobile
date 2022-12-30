import 'package:empiregarage_mobile/application_layer/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Chào buổi sáng,';
    }
    if (hour < 17) {
      return 'Chào buổi chiều,';
    }
    return 'Chào buổi tối,';
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children:<Widget> [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                        child: ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.asset("assets/image/app-logo/empirelogo.png"),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Text(
                                  greeting(),
                                  style:TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.lightTextColor,
                                      fontFamily: 'SFProDisplay'),
                                ),

                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 16),
                          child: Text(
                            "Gia Minh",
                            style:TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                                fontFamily: 'SFProDisplay'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SearchBar(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                        'Khuyến mãi',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        //TODO
                      },
                      child: Text(
                        "Xem tất cả",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueTextColor,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 120.h,
                ),
                Row(
                  children: [
                    Text(
                      'Dịch vụ',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      );
  }
}
