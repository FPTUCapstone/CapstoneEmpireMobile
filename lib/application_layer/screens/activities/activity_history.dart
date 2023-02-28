import 'package:empiregarage_mobile/application_layer/widgets/activity_filter.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/services/activity_services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/colors.dart';
import '../../../models/response/activity.dart';
import '../booking/booking_detail.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  bool _loading = true;
  List<ActivityResponseModel?> _listActivity = [];

  _fetchData() async {
    var userId = await getUserId();
    if (userId == null) {
      return;
    }
    var listActivity = await ActivityService().fetchActivity(userId);
    if (!mounted) return;
    setState(() {
      _listActivity = listActivity;
      _loading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _loading
          ? const Loading()
          : Scaffold(
              backgroundColor: AppColors.loginScreenBackGround,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
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
                        width: 337.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageTransition(
                                    type: PageTransitionType.bottomToTopJoined,
                                    duration: const Duration(milliseconds: 350),
                                    childCurrent: widget,
                                    child: const BookingDetail()));
                              },
                              child: Padding(
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
    );
  }
}
