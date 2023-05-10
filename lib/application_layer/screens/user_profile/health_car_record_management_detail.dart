import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/application_layer/widgets/pick_date_booking.dart';
import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/models/response/car.dart';
import 'package:empiregarage_mobile/services/car_service/car_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class HealthCarRecordManagementDetail extends StatefulWidget {
  final int carId;
  const HealthCarRecordManagementDetail({super.key, required this.carId});

  @override
  State<HealthCarRecordManagementDetail> createState() =>
      _HealthCarRecordManagementDetailState();
}

class _HealthCarRecordManagementDetailState
    extends State<HealthCarRecordManagementDetail> {
  CarProfile? _car;
  bool _loading = true;

  @override
  void initState() {
    _getCarProfile(widget.carId);
    super.initState();
  }

  _getCarProfile(int carId) async {
    var car = await CarService().getCarProfle(carId);
    setState(() {
      _car = car;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Loading()
        : DefaultTabController(
            length: _car!.healthCarRecords.length,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 60.sp,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.searchBarColor,
                        width: 1.0,
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.blackTextColor,
                        )),
                  ),
                ),
                leadingWidth: 84.sp,
                centerTitle: true,
                title: Text(_car!.carLicenseNo,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.black,
                    )),
                bottom: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  unselectedLabelColor: AppColors.blueTextColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.blueTextColor),
                  tabs: _car!.healthCarRecords
                      .map((e) => SizedBox(
                            height: 30.sp,
                            width: 50.sp,
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                    '${e.createdAt.day}/${e.createdAt.month}'),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              body: TabBarView(
                children: _car!.healthCarRecords
                    .map(
                      (record) => SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.sp),
                                Text(
                                  "Kết quả chuẩn đoán",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                                Text(
                                  record.symptom,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                                const Divider(),
                                SizedBox(height: 10.sp),
                                Text(
                                  "Vấn đề phát hiện dựa trên kết quả phân tích",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Danh sách sau bao gồm các dịch vụ gợi ý",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                SizedBox(height: 15.sp),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: record.problems.length,
                                    itemBuilder: (context, index) {
                                      var hcrproblem = record.problems[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hcrproblem.problem.name,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                hcrproblem.problem.items.length,
                                            itemBuilder: (context, index) {
                                              var item = hcrproblem
                                                  .problem.items[index];
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.sp,
                                                    vertical: 5.sp),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.name.toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .blackTextColor,
                                                      ),
                                                    ),
                                                    item.isSelected
                                                        ? const Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: AppColors
                                                                .blueTextColor,
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .circle_outlined,
                                                            color: Colors.grey,
                                                          )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(height: 10.sp),
                                        ],
                                      );
                                    }),
                              ]),
                        ),
                      ),
                    )
                    .toList(),
              ),
              bottomNavigationBar: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                        horizontal: BorderSide.merge(
                            BorderSide(color: Colors.grey.shade200, width: 1),
                            BorderSide.none))),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const PickDateBooking());
                    },
                    style: AppStyles.button16(),
                    child: Text(
                      'Đặt lịch sửa chữa',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
