import 'package:empiregarage_mobile/application_layer/screens/booking/booking_info.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class PickDateBooking extends StatelessWidget {
  const PickDateBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575), //background color
      child: Container(
        height: 330.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0)
          ),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2), // changes position of shadow
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
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 140.h,
                      width: 140.h,
                      child: Image.asset("assets/image/icon-logo/zaloicon.png",fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    "Truy cập Zalo",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Center(
                    child: Text(
                      "Chuyển đến ứng dụng Zalo để được trao đổi",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "trực tiếp với Empire Garage",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const BookingInfo(),
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
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
