import 'package:empiregarage_mobile/application_layer/widgets/activity_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
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
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Stack(alignment: Alignment.centerLeft, children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lịch sử hoạt động",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ActivityFilterList(),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 337.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
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
