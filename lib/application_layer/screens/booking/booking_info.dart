import 'package:empiregarage_mobile/models/symptoms.dart';
import 'package:empiregarage_mobile/services/symptoms_service/symptoms_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../widgets/booking_successfull.dart';
import '../../widgets/chose_payment_method.dart';
import '../../widgets/chose_your_car.dart';
import '../../widgets/deposit_bottomsheet.dart';
import '../../widgets/zalo_bottomsheet.dart';

class BookingInfo extends StatefulWidget {
  const BookingInfo({Key? key}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  // final _symptonList = [
  //   "Xe kêu",
  //   "Rỉ xăng",
  //   "Đảo bánh trước",
  //   "Lên ga rung",
  //   "Giật ga"
  // ];

  List<SymptonResponseModel>? _listSymptoms;
  String? _selectedValue = "";
  bool _loading = false;

  _getListSymptoms() async{
    _listSymptoms = await SymptomsService().fetchListSymptoms();
    setState(() {
      _loading = true;
    });
    print(_listSymptoms);
  }

  @override
  void initState() {
    _getListSymptoms();
    super.initState();
  }

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
                  Stack(
                      alignment: Alignment.centerLeft,
                       children : <Widget>[
                          IconButton(
                            onPressed: (){
                               Navigator.pop(context, false);
                            },
                            icon: Icon(
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
                        ]
                  ),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(12)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                            hintText: "Get ngày From Date Picker Timeline",
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
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: DropdownButtonFormField(
                  //         style: TextStyle(
                  //           fontFamily: 'SFProDisplay',
                  //           fontSize: 14.sp,
                  //           fontWeight: FontWeight.w400,
                  //           color: AppColors.lightTextColor,
                  //         ),
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //               borderSide: BorderSide.none,
                  //               borderRadius: BorderRadius.circular(12)),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: AppColors.loginScreenBackGround),
                  //               borderRadius: BorderRadius.circular(12)),
                  //           floatingLabelBehavior: FloatingLabelBehavior.always,
                  //           filled: true,
                  //         ),
                  //         icon: Icon(
                  //           Icons.keyboard_arrow_right,
                  //           color: AppColors.lightTextColor,
                  //         ),
                  //         value: _selectedValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _selectedValue = value as String;
                  //           });
                  //         },
                  //         items: _listSymptoms!.map((e) {
                  //           return DropdownMenuItem(
                  //             child: Text("abc"),
                  //             value: e,
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const ChoseYourCar()
                          );
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
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
                          Icon(
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
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const ChosePaymentMethod()
                          );
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
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
                          Icon(
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
                      Spacer(),
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
                      Spacer(),
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
                            onPressed: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const DepositBottomSheet()
                              );
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
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => const BookingSuccessfull()
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
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
