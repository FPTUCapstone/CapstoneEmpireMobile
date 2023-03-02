import 'package:empiregarage_mobile/application_layer/screens/booking/booking_detail.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/models/response/activity.dart';
import 'package:empiregarage_mobile/services/activity_services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/colors.dart';
import 'activity_history.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _HomePageState();
}

class _HomePageState extends State<Activities> {
  bool _loading = true;
  List<ActivityResponseModel?> _listOnGoing = [];
  List<ActivityResponseModel?> _listRecent = [];

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  _fetchData() async {
    var userId = await getUserId();
    if (userId == null) {
      return;
    }
    // var listOnGoingBooking = await BookingService().getOnGoingBooking(userId);
    // var listBookingByUser = await BookingService().getBookingByUser(userId);
    var listActivity = await ActivityService().fetchActivity(userId);
    if (!mounted) return;
    setState(() {
      _listOnGoing =
          listActivity.where((element) => element!.isOnGoing == true).toList();
      _listOnGoing.sort(((a, b) => a!.daysLeft!.compareTo(b!.daysLeft as num)));
      _listRecent =
          listActivity.where((element) => element!.isOnGoing == false).toList();
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
              appBar: AppBar(
                titleSpacing: 24.w,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: Text('Hoạt động',
                    style: AppStyles.header600(fontsize: 22.sp)),
                actions: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ActivityHistory(),
                          ));
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
                      ),
                    ),
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
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
                      _listOnGoing.isEmpty
                          ? Text(
                              'Chưa có hoạt động nào',
                              style: AppStyles.text400(fontsize: 15.sp),
                            )
                          : SizedBox(
                              width: 337.w,
                              height: 200.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: _listOnGoing.length,
                                itemBuilder: (context, index) {
                                  var item = _listOnGoing[index];
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
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  duration: const Duration(
                                                      milliseconds: 350),
                                                  childCurrent: widget,
                                                  child: BookingDetail(
                                                    data: item,
                                                  )));
                                        },
                                        child: ActivityChip(
                                          carInfo:
                                              '${item!.car!.carBrand} ${item.car!.carModel} ${item.car!.carLisenceNo}',
                                          date: item.date.toString(),
                                          daysLeft: item.daysLeft,
                                          isBooking: item.isBooking,
                                          item: item,
                                        ),
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
                      _listRecent.isEmpty
                          ? Text(
                              'Chưa có hoạt động nào',
                              style: AppStyles.text400(fontsize: 15.sp),
                            )
                          : Expanded(
                              // width: 337.w,
                              // height: 200.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: _listRecent.length,
                                itemBuilder: (context, index) {
                                  var item = _listRecent[index];
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
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  duration: const Duration(
                                                      milliseconds: 350),
                                                  childCurrent: widget,
                                                  child: BookingDetail(
                                                    data: item,
                                                  )));
                                        },
                                        child: ActivityChip(
                                          carInfo:
                                              '${item!.car!.carBrand} ${item.car!.carModel} ${item.car!.carLisenceNo}',
                                          date: item.date.toString(),
                                          daysLeft: item.daysLeft,
                                          isBooking: item.isBooking,
                                          item: item,
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

class ActivityChip extends StatefulWidget {
  final String carInfo;
  final String date;
  final int? daysLeft;
  final bool isBooking;
  final ActivityResponseModel item;
  const ActivityChip({
    super.key,
    required this.carInfo,
    required this.date,
    required this.daysLeft,
    required this.isBooking,
    required this.item,
  });

  @override
  State<ActivityChip> createState() => _ActivityChipState();
}

class _ActivityChipState extends State<ActivityChip> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    bool isComplete = item.isArrived == true || item.status == 2;
    return ListTile(
      leading: Image.asset(
        widget.isBooking
            ? "assets/image/icon-logo/calendar-history-icon.png"
            : "assets/image/icon-logo/homeservice-logo-maintanace.png",
        height: 50.h,
        width: 50.w,
      ),
      title: Text(
        isComplete
            ? "Hoàn Thành"
            : item.isBooking
                ? item.isActive == false
                    ? "Đã hủy"
                    : item.daysLeft == 0
                        ? "Hôm nay"
                        : "Còn lại ${widget.daysLeft} ngày"
                : item.status.toString(),
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          color: isComplete
              ? AppColors.greenTextColor
              : item.isActive == false
                  ? AppColors.errorIcon
                  : AppColors.blueTextColor,
        ),
      ),
      subtitle: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              widget.carInfo,
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
              widget.date != "null"
                  ? widget.date.substring(0, widget.date.length - 13)
                  : widget.date,
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
    );
  }
}
