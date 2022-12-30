import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchBarColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: TextField(
        //style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle:TextStyle(color: AppColors.lightTextColor) ,
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
