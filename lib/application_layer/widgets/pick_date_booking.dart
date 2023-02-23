import 'package:empiregarage_mobile/application_layer/screens/booking/booking_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../../common/colors.dart';

class PickDateBooking extends StatefulWidget {
  const PickDateBooking({Key? key}) : super(key: key);

  @override
  State<PickDateBooking> createState() => _PickDateBookingState();
}

class _PickDateBookingState extends State<PickDateBooking> {
  final DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575), //background color
      child: Container(
        height: 330.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: const Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Đặt lịch mới",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.left,
                      "Vui lòng chọn lịch có sẵn, chỉ đặt được lịch trong tuần này",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "Chọn ngày",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 80,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    daysCount: 7,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => BookingInfo(
                                selectedDate: _selectedValue,
                              ),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
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
