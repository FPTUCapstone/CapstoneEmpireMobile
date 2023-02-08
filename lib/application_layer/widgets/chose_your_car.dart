import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class ChoseYourCar extends StatelessWidget {
  const ChoseYourCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575), //background color
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0)
          ),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Text(
                        "Phương tiện",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          //TDO
                        },
                        child: Text(
                          "Thêm mới",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blueTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/image/icon-logo/bmw-car-icon.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      title: Text(
                        "BMW",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
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
                              "320i Sportline",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        children: [
                          SizedBox(height: 15.h),
                          Icon(
                            Icons.radio_button_checked,
                            color: AppColors.buttonColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/image/icon-logo/bmw-car-icon.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      title: Text(
                        "BMW",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
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
                              "320i Sportline",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        children: [
                          SizedBox(height: 15.h),
                          Icon(
                            Icons.radio_button_checked,
                            color: AppColors.buttonColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/image/icon-logo/bmw-car-icon.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      title: Text(
                        "BMW",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
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
                              "320i Sportline",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        children: [
                          SizedBox(height: 15.h),
                          Icon(
                            Icons.radio_button_checked,
                            color: AppColors.buttonColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'Xác nhận'),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
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
