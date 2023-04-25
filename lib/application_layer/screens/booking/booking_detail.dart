import 'package:empiregarage_mobile/application_layer/screens/activities/qrcode.dart';
import 'package:empiregarage_mobile/application_layer/screens/booking/see_booking_detail_payment.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/models/response/activity.dart';
import 'package:empiregarage_mobile/models/response/booking.dart';
import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:empiregarage_mobile/services/brand_service/brand_service.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../main_page/main_page.dart';

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
    String formattedDate = '';
    if (_booking != null) {
      String date = _booking!.date.substring(0, 10);
      DateTime dateTime = DateTime.parse(date);
      formattedDate =
          '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year.toString()}';
    } else {
      // handle the case where _booking or _booking!.date is null
      const Loading();
    }

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
                  actions: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: InkWell(
                          onTap: () {},
                          child: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.more_horiz,
                              color: AppColors.blackTextColor,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'cancel',
                                child: Text('Hủy',
                                    style: AppStyles.text400(
                                        fontsize: 14.sp,
                                        color: AppColors.errorIcon)),
                              ),
                            ],
                            onSelected: (String selectedItem) {
                              switch (selectedItem) {
                                case 'cancel':
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40.0),
                                                    topRight:
                                                        Radius.circular(40.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                    0.5), //color of shadow
                                                spreadRadius: 5, //spread radius
                                                blurRadius: 7, // blur radius
                                                offset: const Offset(0,
                                                    2), // changes position of shadow
                                                //first paramerter of offset is left-right
                                                //second parameter is top to down
                                              ),
                                              //you can set more BoxShadow() here
                                            ],
                                          ),
                                          height: 300.h,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(Icons.warning_rounded,
                                                    size: 100.sp,
                                                    color: AppColors.errorIcon),
                                                Text(
                                                  'Xác nhận hủy đặt lịch',
                                                  style: AppStyles.header600(),
                                                ),
                                                Text(
                                                    'Bạn chắc chắn muốn hủy đặt lịch? Bạn sẽ mất tiền trước đó đã thanh toán.',
                                                    textAlign: TextAlign.center,
                                                    style: AppStyles.text400(
                                                        fontsize: 14.sp,
                                                        color: AppColors
                                                            .lightTextColor)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors.blue600,
                                                        fixedSize:
                                                            Size.fromHeight(
                                                                50.w),
                                                        maximumSize:
                                                            Size.fromWidth(
                                                                130.w),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(36),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Hủy',
                                                        style: TextStyle(
                                                          fontFamily: AppStyles
                                                              .fontFamily,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .white100,
                                                        ),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors.errorIcon,
                                                        fixedSize:
                                                            Size.fromHeight(
                                                                50.w),
                                                        maximumSize:
                                                            Size.fromWidth(
                                                                130.w),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(36),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        var response =
                                                            await BookingService()
                                                                .cancelBooking(
                                                                    widget.data
                                                                        .id);
                                                        if (response
                                                                .statusCode ==
                                                            204) {
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
                                                          // ignore: use_build_context_synchronously
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const MainPage(),
                                                                  ),
                                                                  (route) =>
                                                                      false);
                                                        } else {
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Text(
                                                        'Xác nhận',
                                                        style: TextStyle(
                                                          fontFamily: AppStyles
                                                              .fontFamily,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        );
                                      });
                                  break;
                                default:
                              }
                            },
                          )),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
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
                          height: 15.h,
                        ),
                        Container(
                          color: Colors.white,
                          height: 80.h,
                          child: InkWell(
                            onTap: () {
                              widget.data.daysLeft == 0
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
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
                                    height: 20.h,
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
                                        ? 'Đã check-in vào ${_booking!.arrivedDateTime!.replaceAll('T', " ").substring(0, 19)}'
                                        : formattedDate,
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: widget.data.daysLeft == 0 &&
                                      _booking!.isArrived == false
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Icon(Icons.qr_code_scanner,
                                          color: AppColors.blueTextColor,
                                          size: 30.w),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 24, left: 24, right: 24),
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
                                      NumberFormat.currency(decimalDigits: 0, locale: 'vi_VN')
                          .format(_bookingPrice)
                          .toString(),
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
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SeeBookingDetailPayment(),
                                    ));
                                  },
                                  child: SizedBox(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Phương tiện',
                                      style: AppStyles.header600()),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Phương tiện bạn đã chọn',
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightTextColor,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: FutureBuilder(
                                    future: BrandService().getPhoto(
                                        widget.data.car!.carBrand.toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Image.network(
                                          snapshot.data.toString(),
                                          height: 50.h,
                                          width: 50.w,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Image.asset(
                                          "assets/image/icon-logo/bmw-car-icon.png",
                                          height: 50.h,
                                          width: 50.w,
                                        );
                                      } else {
                                        return Image.asset(
                                          "assets/image/icon-logo/bmw-car-icon.png",
                                          height: 50.h,
                                          width: 50.w,
                                        );
                                      }
                                    }),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.data.car!.carLisenceNo
                                            .toString(),
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
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 22.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text('Tình trạng xe',
                                        style: AppStyles.header600()),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Tình trạng bạn đã chọn',
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: _booking!.symptoms.length,
                                      itemBuilder: (context, index) {
                                        var item = _booking!.symptoms[index];
                                        return Container(
                                            padding: EdgeInsets.all(5.sp),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5.sp),
                                            // decoration:
                                            //     BoxDecoration(color: Colors.grey[300]),
                                            child: Text(
                                              item.name.toString(),
                                              style: AppStyles.text400(
                                                  fontsize: 14.sp),
                                            ));
                                      },
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text('Vấn đề tái sửa chữa',
                                        style: AppStyles.header600()),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Vấn đề bạn đã chọn',
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          _booking!.unresolvedProblems.length,
                                      itemBuilder: (context, index) {
                                        var item =
                                            _booking!.unresolvedProblems[index];
                                        return Container(
                                            padding: EdgeInsets.all(5.sp),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5.sp),
                                            // decoration:
                                            //     BoxDecoration(color: Colors.grey[300]),
                                            child: Text(
                                              item.name.toString(),
                                              style: AppStyles.text400(
                                                  fontsize: 14.sp),
                                            ));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
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
