import 'package:empiregarage_mobile/application_layer/screens/activities/activity_detail.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/response/booking.dart';
import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import 'activity_history.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _HomePageState();
}

class _HomePageState extends State<Activities> {
  bool _loading = true;
  List<BookingResponseModel> _listOnGoing = [];
  List<BookingResponseModel> _listRecent = [];

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
    var listOnGoingBooking = await BookingService().getOnGoingBooking(userId);
    var listBookingByUser = await BookingService().getBookingByUser(userId);
    if (!mounted) return;
    setState(() {
      _listOnGoing = listOnGoingBooking;
      _listRecent = listBookingByUser;
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
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 52.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Hoạt động",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                  fontFamily: 'SFProDisplay'),
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.refresh),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ActivityHistory(),
                                ));
                              },
                              style: ButtonStyle(
                                foregroundColor: getColor(AppColors.buttonColor,
                                    AppColors.whiteButtonColor),
                                backgroundColor: getColor(
                                    AppColors.whiteButtonColor,
                                    AppColors.buttonColor),
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
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
                        SizedBox(
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
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ActivityChip(
                                    carLisenceNo: item.car.carLisenceNo,
                                    date: item.date,
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
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 337.w,
                          height: 200.h,
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
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ActivityChip(
                                    carLisenceNo: item.car.carLisenceNo,
                                    date: item.date,
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

class ActivityChip extends StatefulWidget {
  final String carLisenceNo;
  final String date;
  const ActivityChip({
    super.key,
    required this.carLisenceNo,
    required this.date,
  });

  @override
  State<ActivityChip> createState() => _ActivityChipState();
}

class _ActivityChipState extends State<ActivityChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const ActivityDetailPage(
                  bookingId: 42,
                )));
      },
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
                widget.carLisenceNo,
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
                widget.date.substring(0, widget.date.length - 9),
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
    );
  }
}
