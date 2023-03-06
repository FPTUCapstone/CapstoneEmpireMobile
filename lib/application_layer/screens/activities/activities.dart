import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service.dart';
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

  int _length = 1;

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
      _length = listActivity.length;
      _listOnGoing =
          listActivity.where((element) => element!.isOnGoing == true).toList();
      _listOnGoing.sort(((a, b) => a!.daysLeft!.compareTo(b!.daysLeft as num)));
      _listRecent =
          listActivity.where((element) => element!.isOnGoing == false).toList();
      _loading = false;
    });
  }

  Future reload() {
    return _fetchData();
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
              backgroundColor: AppColors.lightGrey,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: AppBar(
                    titleSpacing: 24.w,
                    toolbarHeight: 100.h,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    title: Text('Hoạt động',
                        style: AppStyles.header600(fontsize: 22.sp)),
                    actions: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.refresh, size: 18.sp),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ActivityHistory(),
                              ));
                            },
                            style: ButtonStyle(
                              shadowColor: getColor(
                                  Colors.transparent, Colors.transparent),
                              foregroundColor: getColor(
                                  AppColors.blackTextColor,
                                  AppColors.whiteButtonColor),
                              backgroundColor: getColor(
                                  AppColors.blue100, AppColors.buttonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                ),
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: reload,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: 110.h * _length + 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            _listOnGoing.isEmpty
                                ? Container()
                                : Text(
                                    "Đang hoạt động",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackTextColor,
                                        fontFamily: 'SFProDisplay'),
                                  ),
                            _listOnGoing.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 10.h,
                                  ),
                            _listOnGoing.isEmpty
                                ? Container()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(
                                        parent: NeverScrollableScrollPhysics()),
                                    scrollDirection: Axis.vertical,
                                    itemCount: _listOnGoing.length,
                                    itemBuilder: (context, index) {
                                      var item = _listOnGoing[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
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
                                                      child: item.isBooking
                                                          ? BookingDetail(
                                                              data: item,
                                                            )
                                                          : const OnGoingService()));
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
                            _listOnGoing.isEmpty
                                ? Container()
                                : SizedBox(
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
                                : ListView.builder(
                                    physics: const ScrollPhysics(
                                        parent: NeverScrollableScrollPhysics()),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: _listRecent.length,
                                    itemBuilder: (context, index) {
                                      var item = _listRecent[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
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
                                                      child: item.isBooking
                                                          ? BookingDetail(
                                                              data: item,
                                                            )
                                                          : const OnGoingService()));
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
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
    );
  }
}

class Status {
  final int id;
  final String text;

  Status(this.id, this.text);
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
  List<Status> statuses = [
    Status(0, "Đang chờ"),
    Status(1, "Đang kiểm tra"),
    Status(2, "Đang sửa chữa"),
    Status(3, "Chờ lấy xe"),
    Status(4, "Hoàn thành"),
    Status(-1, "Đã hủy"),
  ];

  _getStatus(int id) {
    return statuses.where((element) => element.id == id).first.text;
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    bool isComplete = item.isArrived == true || item.status == 2;
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: ListTile(
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
                  : _getStatus(item.status as int),
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
                widget.isBooking ? "Đặt lịch cho" : "Dịch vụ cho",
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
              widget.date != "null"
                  ? SizedBox(
                      height: 5.h,
                    )
                  : Container(),
              widget.date != "null"
                  ? Text(
                      widget.date.substring(0, widget.date.length - 13),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightTextColor,
                      ),
                      textAlign: TextAlign.start,
                    )
                  : Container(),
            ],
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}
