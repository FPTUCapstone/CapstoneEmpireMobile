import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../models/response/car.dart';
import '../../../services/car_service/car_service.dart';
import '../../widgets/loading.dart';

class BookingHistoryTab extends StatefulWidget {
  final int carId;
  const BookingHistoryTab({super.key, required this.carId});

  @override
  State<BookingHistoryTab> createState() => _BookingHistoryTabState();
}

class _BookingHistoryTabState extends State<BookingHistoryTab> {
  bool _loading = true;
  CarProfile? _carProfile;

  _getCarProfile() async {
    var carProfile = await CarService().getCarProfle(widget.carId);
    if (carProfile == null) {
      setState(() {
        _loading = true;
      });
    } else {
      setState(() {
        _carProfile = carProfile;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    _getCarProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading == true
        ? const Loading()
        : Scaffold(
            backgroundColor: AppColors.white100,
            body: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 335.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Lịch sử sửa chửa",
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
                          Row(
                            children: [
                              Text(
                                "Lịch sử sửa chữa của phương tiện",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _carProfile!.orderServices.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //TODO
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1.h,
                                      blurRadius: 1.2,
                                      offset: Offset(0, 4.h),
                                    )
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              height: 90.h,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/image/icon-logo/homeservice-logo-maintanace.png",
                                  height: 45.h,
                                  width: 45.w,
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _carProfile!.carLicenseNo.toString(),
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
                                    Row(
                                      children: [
                                        Text(
                                          "Hoàn thành: ${_carProfile!.orderServices[index].order!.createdAt.substring(0,10)}",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.lightTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "1.000.000",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
