import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:empiregarage_mobile/services/brand_service/brand_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class OnGoingServiceBody extends StatefulWidget {
  final OrderServicesResponseModel order;
  final Expert? expert;
  const OnGoingServiceBody({super.key, required this.order, this.expert});

  @override
  State<OnGoingServiceBody> createState() => _OnGoingServiceBodyState();
}

class _OnGoingServiceBodyState extends State<OnGoingServiceBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: const Divider(thickness: 1),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Text(
          "Kỹ thuật viên đang kiểm tra",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTextColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: Text(
            "Bạn sẽ có thể xem được các chuẩn đoán sau khi kỹ thuật viên hoàn tất việc kiểm tra",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: const Divider(thickness: 1),
        ),
        ListTile(
          leading: Image.asset(
            "assets/image/service-picture/mechanicPic.png",
            height: 40.sp,
            width: 50.sp,
          ),
          title: Text(
            widget.expert == null
                ? "Chưa có kỹ thuật viên"
                : widget.expert!.fullname,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
          ),
          subtitle: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kỹ thuật viên",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: const Divider(thickness: 1),
        ),
        ListTile(
          leading: FutureBuilder(
              future: BrandService().getPhoto(widget.order.car.carBrand),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(
                    snapshot.data.toString(),
                    height: 40.sp,
                    width: 50.sp,
                  );
                } else if (snapshot.hasError) {
                  return Image.asset(
                    "assets/image/icon-logo/bmw-car-icon.png",
                    height: 40.sp,
                    width: 50.sp,
                  );
                } else {
                  return Image.asset(
                    "assets/image/icon-logo/bmw-car-icon.png",
                    height: 40.sp,
                    width: 50.sp,
                  );
                }
              }),
          title: Text(
            widget.order.car.carBrand,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightTextColor,
            ),
          ),
          subtitle: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.order.car.carLisenceNo,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.order.car.carModel,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
