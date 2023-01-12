import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget> [
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  LimitedBox(
                    maxHeight: 132.h,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/image/service-picture/service-picture1.png",
                                    width: 140.w,
                                    height: 90.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 130.w,
                                  height: 80.h,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Fixing Car',
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '250k',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blueTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              //TODO
              print("abc");
            },
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  LimitedBox(
                    maxHeight: 132.h,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/image/service-picture/service-picture1.png",
                                    width: 140.w,
                                    height: 90.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 130.w,
                                  height: 80.h,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Fixing Car',
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '250k',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blueTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              //TODO
              print("abc");
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  LimitedBox(
                    maxHeight: 132.h,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/image/service-picture/service-picture1.png",
                                    width: 140.w,
                                    height: 90.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 130.w,
                                  height: 80.h,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Fixing Car',
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '250k',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blueTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              //TODO
              print("abc");
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  LimitedBox(
                    maxHeight: 132.h,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/image/service-picture/service-picture1.png",
                                    width: 140.w,
                                    height: 90.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 130.w,
                                  height: 80.h,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Fixing Car',
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '250k',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blueTextColor,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              //TODO
              print("abc");
            },
          ),
        ],
      ),

    );
  }
}
