import 'package:empiregarage_mobile/models/notification.dart';
import 'package:empiregarage_mobile/models/request/booking_request_model.dart';
import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:empiregarage_mobile/services/notification/notification_service.dart';
import 'package:empiregarage_mobile/services/symptoms_service/symptoms_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../widgets/booking_successfull.dart';
import '../../widgets/chose_payment_method.dart';
import '../../widgets/chose_your_car.dart';
import '../../widgets/deposit_bottomsheet.dart';

class BookingInfo extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selectedDate;

  const BookingInfo({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  late BookingRequestModel requestModel;

  final _symptonList = [
    // "Khác"
    // "Xe kêu",
    // "Rỉ xăng",
    // "Đảo bánh trước",
    // "Lên ga rung",
    // "Giật ga"
  ];

  final TextEditingController _dateController = TextEditingController();

  bool _loading = false;

  _loadingSymptomsList() async {
    var result = await SymptomsService().fetchListSymptoms();
    if (result != null) {
      for (var item in result) {
        _symptonList.add(item.name.toString());
      }
      setState(() {
        _selectedValue = _symptonList.first.toString();
        _loading = true;
      });
    }
  }

  String? _selectedValue;

  @override
  void initState() {
    _dateController.text = widget.selectedDate.toString().substring(0, 10);
    _loadingSymptomsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_loading
          ? const Scaffold(
              body: Center(
              child: CircularProgressIndicator(),
            ))
          : Scaffold(
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
                        Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
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
                                  "Đặt lịch",
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
                        Text(
                          "Ngày đặt",
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
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                enabled: false,
                                controller: _dateController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              AppColors.loginScreenBackGround),
                                      borderRadius: BorderRadius.circular(12)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  filled: true,
                                ),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Triệu chứng",
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
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(26)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              AppColors.loginScreenBackGround),
                                      borderRadius: BorderRadius.circular(26)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  filled: true,
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_right,
                                  color: AppColors.lightTextColor,
                                ),
                                value: _selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value as String;
                                  });
                                },
                                items: _symptonList.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phương tiện",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => const ChoseYourCar());
                              },
                              child: Text(
                                "Chọn",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blueTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
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
                              "assets/image/icon-logo/bmw-car-icon.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            title: Text(
                              "BMW",
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
                                children: [
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
                                    "320i Sportline",
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
                            trailing: Column(
                              children: [
                                SizedBox(height: 15.h),
                                const Icon(
                                  Icons.radio_button_checked,
                                  color: AppColors.buttonColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phương thức thanh toán",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const ChosePaymentMethod());
                              },
                              child: Text(
                                "Chọn",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blueTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
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
                              "assets/image/icon-logo/paypal-icon.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            title: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Text(
                                    "Paypal",
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
                                ],
                              ),
                            ),
                            subtitle: Text(
                              "1.000.000",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            trailing: Column(
                              children: [
                                SizedBox(height: 15.h),
                                const Icon(
                                  Icons.radio_button_checked,
                                  color: AppColors.buttonColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Thanh toán",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phí đặt chỗ",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "500.000",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Tổng cộng",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "500.000",
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
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "**Phí đặt chỗ sẽ được khấu trừ vào hóa đơn**",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            const DepositBottomSheet());
                                  },
                                  child: Text(
                                    "Tại sao tôi phải trả phí đặt chỗ ?",
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackTextColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  String date = _dateController.text;
                                  int carId = 1;
                                  int userId = 2;
                                  String intendedTime = date;
                                  int intendedMinutes = 30;

                                  var booking = await BookingService()
                                      .createBooking(date, carId, userId,
                                          intendedTime, intendedMinutes);

                                  if (booking != null) {
                                    var notificationModel = NotificationModel(
                                        isAndroiodDevice: true,
                                        title: "Empire Garage",
                                        body:
                                            "Your booking has been created successful");
                                    await NotificationService()
                                        .sendNotification(notificationModel);
                                    // ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            const BookingSuccessfull());
                                  } else {
                                    AlertDialog(
                                      title: Text(
                                        "Failed To Booking, please try again",
                                        style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  fixedSize: Size.fromHeight(50.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Text(
                                  'Đặt lịch',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                ),
              ),
            ),
    );
  }
}
