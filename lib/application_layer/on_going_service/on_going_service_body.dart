import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class OnGoingServiceBody extends StatefulWidget {
  const OnGoingServiceBody({super.key});

  @override
  State<OnGoingServiceBody> createState() => _OnGoingServiceBodyState();
}

class _OnGoingServiceBodyState extends State<OnGoingServiceBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Kỹ thuật viên đang kiểm tra",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Bạn sẽ nhận được thông báo và gợi ý những dịch vụ sau khi kiểm tra hoàn tất.",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h,),
                ListTile(
                  leading: Image.asset(
                    "assets/image/service-picture/mechanicPic.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                  title: Text(
                    "Tran Van A",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ky thuat vien",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/image/icon-logo/bmw-car-icon.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                  title: Text(
                    "Name",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Model",
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
                          "Brand",
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
                ),
                SizedBox(height: 40.h,),
              ],
            );
  }
}