import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: 330.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.searchBarColor,
        borderRadius: BorderRadius.all(Radius.circular(26.r)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,5),
            blurRadius: 10,
            color: AppColors.unselectedBtn,
          )
        ]
      ),
      child: TextField(
        //style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle:TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.lightTextColor,
          ),
          hintText: 'Tìm dịch vụ',
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.lightTextColor,
          ),
        ),
      ),
    );
  }
}
