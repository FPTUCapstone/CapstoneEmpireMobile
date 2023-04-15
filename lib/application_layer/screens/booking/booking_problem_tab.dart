import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../common/style.dart';
import '../../../models/response/car.dart';
import '../../../services/car_service/car_service.dart';
import '../../widgets/loading.dart';

class BookingProblemTab extends StatefulWidget {
  final int carId;
  const BookingProblemTab({super.key, required this.carId});

  @override
  State<BookingProblemTab> createState() => _BookingProblemTabState();
}

class _BookingProblemTabState extends State<BookingProblemTab> {
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
                                "Vấn đề chưa sửa chữa",
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
                                "Chọn vấn đề bạn muốn sửa chữa",
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
                      itemCount: _carProfile!.healthCarRecords.length,
                      itemBuilder: (context, index) {
                        return Padding(
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
                            child: Column(
                              children: [
                                ListTile(
                                  title: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _carProfile!
                                              .healthCarRecords[index].symptom,
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      SizedBox(height: 15.h),
                                      const Icon(
                                        Icons.radio_button_unchecked,
                                        color: AppColors.buttonColor,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Container(
                                  margin: EdgeInsets.all(10.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xem chi tiết',
                                        style: AppStyles.header600(
                                            fontsize: 14.sp,
                                            color: AppColors.blueTextColor),
                                      ),
                                      const Icon(
                                        Icons.navigate_next_outlined,
                                        color: AppColors.blueTextColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
