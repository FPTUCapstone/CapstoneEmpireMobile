import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class BookingHistoryTab extends StatefulWidget {
  const BookingHistoryTab({super.key});

  @override
  State<BookingHistoryTab> createState() => _BookingHistoryTabState();
}

class _BookingHistoryTabState extends State<BookingHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 335.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Lịch sử sửa chửa",
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
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Lịch sử sửa chữa của phương tiện",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1.h,
                            blurRadius: 1.2,
                            offset: Offset(0, 4.h),
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    height: 90.h,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/image/icon-logo/homeservice-logo-maintanace.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sử dụng dịch vụ tại ga-ra",
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
                                "Ngày đến: 123123",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
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
                                'Ngày nhận xe: 123123123',
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
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
