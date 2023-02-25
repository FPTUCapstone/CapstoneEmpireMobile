import 'package:empiregarage_mobile/application_layer/screens/activities/activity_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/colors.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    type: PageTransitionType.topToBottomJoined,
                    childCurrent: widget,
                    duration: const Duration(milliseconds: 350),
                    child: const ActivityHistory()));
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Ngày 20 tháng 2, 2023",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTextColor,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Mã đặt lịch : #BK00001",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/image/icon-logo/calendar-history-icon.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Đặt lịch đến ga-ra",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Đã check-in vào lúc 8:30, 20/02/2023",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        "Tổng",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "500.000",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [ 
                      Text(
                        "Ví điện tử",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                      const Icon(Icons.account_balance_wallet_outlined,color: AppColors.blackTextColor,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.lightTextColor,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        "Thông tin cá nhân",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.lightTextColor,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
