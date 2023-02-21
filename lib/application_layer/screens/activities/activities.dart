import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import 'activity_history.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _HomePageState();
}

class _HomePageState extends State<Activities> {
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hoạt động",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                            fontFamily: 'SFProDisplay'),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => const ActivityHistory(),
                              )
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: getColor(AppColors.buttonColor,
                              AppColors.whiteButtonColor),
                          backgroundColor: getColor(AppColors.whiteButtonColor,
                              AppColors.buttonColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                        ),
                        label: Text(
                          'Lịch sử',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProDisplay',
                              color: AppColors.blackTextColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Đang hoạt động",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 337.w,
                    height: 200.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset:
                                      Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                "assets/image/icon-logo/calendar-history-icon.png",
                                height: 50.h,
                                width: 50.w,
                              ),
                              title: Text(
                                "Còn lại ... ngày",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blueTextColor,
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Đặt lịch cho",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "59D - 123.45",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "22/01/2023",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightTextColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Gần đây",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 337.w,
                    height: 200.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset:
                                  Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                "assets/image/icon-logo/calendar-history-icon.png",
                                height: 50.h,
                                width: 50.w,
                              ),
                              title: Text(
                                "Còn lại ... ngày",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blueTextColor,
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Đặt lịch cho",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "59D - 123.45",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "22/01/2023",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightTextColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      },
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
