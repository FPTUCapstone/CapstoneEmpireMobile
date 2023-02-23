import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class ActivityFilterList extends StatelessWidget {
  const ActivityFilterList({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(children: [
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(
                          AppColors.buttonColor, AppColors.whiteButtonColor),
                      backgroundColor: getColor(
                          AppColors.whiteButtonColor, AppColors.buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                    ),
                    child: Text(
                      'Đặt lịch',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFProDisplay'),
                    ),
                  )),
            ),
          ]),
          Column(children: [
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(
                          AppColors.buttonColor, AppColors.whiteButtonColor),
                      backgroundColor: getColor(
                          AppColors.whiteButtonColor, AppColors.buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                    ),
                    child: Text(
                      'Dịch vụ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFProDisplay'),
                    ),
                  )),
            ),
          ]),
          Column(children: [
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(
                          AppColors.buttonColor, AppColors.whiteButtonColor),
                      backgroundColor: getColor(
                          AppColors.whiteButtonColor, AppColors.buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                    ),
                    child: Text(
                      'Đặt hàng',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFProDisplay'),
                    ),
                  )),
            ),
          ]),
          Column(children: [
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(
                          AppColors.buttonColor, AppColors.whiteButtonColor),
                      backgroundColor: getColor(
                          AppColors.whiteButtonColor, AppColors.buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                    ),
                    child: Text(
                      'Cứu hộ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFProDisplay'),
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
