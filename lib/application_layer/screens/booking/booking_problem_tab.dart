import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../common/style.dart';

class BookingProblemTab extends StatefulWidget {
  const BookingProblemTab({super.key});

  @override
  State<BookingProblemTab> createState() => _BookingProblemTabState();
}

class _BookingProblemTabState extends State<BookingProblemTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                      backgroundColor: AppColors.white100,
                      body: Padding(
                        padding:
                            EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
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
                                        "Vấn đề chưa sửa chữa",
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
                                        "Chọn vấn đề bạn muốn sửa chữa",
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
                              itemCount:2,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:  EdgeInsets.only(top:20.h),
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tên vấn đề",
                                                  style: TextStyle(
                                                    fontFamily: 'SFProDisplay',
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.blackTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          trailing: Column(
                                            children: [
                                              SizedBox(height: 15.h),
                                              const Icon(
                                                Icons.radio_button_unchecked,
                                                color: AppColors.buttonColor,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        Container(
                                          margin: EdgeInsets.all(10.sp),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Xem chi tiết',
                                                style: AppStyles.header600(
                                                    fontsize: 14.sp,
                                                    color:
                                                        AppColors.blueTextColor),
                                              ),
                                              const Icon(
                                                Icons.navigate_next_outlined,
                                                color: AppColors.blueTextColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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