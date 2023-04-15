import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
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
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                centerTitle: true,
                title: Text(_car!.carLicenseNo,
                    style: const TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    )),
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  unselectedLabelColor: AppColors.blue600,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.blue600),
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
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "Kết quả chuẩn đoán",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  record.symptom,
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "Vấn đề dựa trên kết quả phân tích",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Danh sách sau bao gồm các dịch vụ gợi ý",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                SizedBox(height: 20.h),
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
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                hcrproblem.problem.items.length,
                                            itemBuilder: (context, index) {
                                              var item = hcrproblem
                                                  .problem.items[index];
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 15.h),
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        blurRadius: 20,
                                                      ),
                                                    ],
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      //TODO
                                                    },
                                                    child: ListTile(
                                                      title: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 24),
                                                        child: Text(
                                                          item.name,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SFProDisplay',
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackTextColor,
                                                          ),
                                                        ),
                                                      ),
                                                      subtitle: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 24),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Giá : ",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SFProDisplay',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .lightTextColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                item.presentPrice
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SFProDisplay',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .lightTextColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      trailing: item.isSelected
                                                          ? const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    }),
                              ]),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
