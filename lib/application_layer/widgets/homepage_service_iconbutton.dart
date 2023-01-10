import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class HomePageServiceIconButton extends StatelessWidget {
  const HomePageServiceIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: AppColors.homepageServiceBtn,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.settingIcon,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Bảo dưỡng',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                ]
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: AppColors.homepageServiceBtn,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.handyman,
                        color: AppColors.handymanIcon,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Sửa chữa',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                ]
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: AppColors.homepageServiceBtn,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.no_crash,
                        color: AppColors.nocrashIcon,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Tân trang',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                ]
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: AppColors.homepageServiceBtn,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.error_outline,
                        color: AppColors.errorIcon,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Cứu hộ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
