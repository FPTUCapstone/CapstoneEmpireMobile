import 'package:empiregarage_mobile/application_layer/screens/activities/qrcode.dart';
import 'package:empiregarage_mobile/application_layer/screens/booking/see_booking_detail_payment.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/models/response/activity.dart';
import 'package:empiregarage_mobile/models/response/booking.dart';
import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class BookingDetail extends StatefulWidget {
  final ActivityResponseModel data;
  const BookingDetail({super.key, required this.data});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  double _bookingPrice = 0;

  BookingResponseModel? _booking;
  bool _loading = true;

  _fetchData() async {
    var booking = await BookingService().getBookingById(widget.data.id);
    if (!mounted) return;
    setState(() {
      _booking = booking;
      _loading = false;
    });
  }

  _getBookingPrice() async {
    var response = await BookingService().getBookingPrice();
    setState(() {
      _bookingPrice = response;
    });
    return _bookingPrice;
  }

  @override
  void initState() {
    _getBookingPrice();
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _loading
          ? const Loading()
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Ngày ${widget.data.date!.day} tháng ${widget.data.date!.month}, ${widget.data.date!.year}",
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
                body: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Mã đặt lịch : #${widget.data.code}",
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
                        InkWell(
                          onTap: () {
                            widget.data.daysLeft == 0
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        QRCodePage(
                                          bookingId: _booking!.id,
                                        )))
                                : null;
                          },
                          child: ListTile(
                            leading: Image.asset(
                              "assets/image/icon-logo/calendar-history-icon.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  _booking!.isArrived
                                      ? 'Đã check-in vào lúc ${_booking!.arrivedDateTime!.replaceAll('T', " ").substring(0, 19)}'
                                      : _booking!.date.substring(0, 10),
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              ],
                            ),
                            trailing: widget.data.daysLeft == 0
                                ? Icon(Icons.qr_code_scanner,
                                    color: AppColors.blueTextColor, size: 30.w)
                                : null,
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
                                _bookingPrice.toString(),
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
                            children: [
                              Text(
                                "Ví điện tử",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              const Icon(
                                Icons.account_balance_wallet_outlined,
                                color: AppColors.blackTextColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SeeBookingDetailPayment(),
                              ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Xem chi tiết thanh toán",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blueTextColor,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.lightTextColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/image/icon-logo/bmw-car-icon.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            title: Text(
                              widget.data.car!.carBrand.toString(),
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
                                    widget.data.car!.carLisenceNo.toString(),
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
                                    widget.data.car!.carModel.toString(),
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
