import 'package:empiregarage_mobile/models/response/activity.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../../../services/order_services/order_services.dart';
import '../../widgets/loading.dart';

class ServiceActivityDetail extends StatefulWidget {
  final ActivityResponseModel data;
  const ServiceActivityDetail({super.key, required this.data});

  @override
  State<ServiceActivityDetail> createState() => _ServiceActivityDetailState();
}

class _ServiceActivityDetailState extends State<ServiceActivityDetail> {
  bool _loading = true;
  OrderServicesResponseModel? _orderServices;

  List<String> serviceNames = [
    'Thay lốp',
    'Thay nhớt',
    'Sửa chữa động cơ',
    'Kiểm tra định kỳ',
    'Thay bình ắc quy'
  ];
  List<String> servicePrices = [
    "8000000",
    "500000",
    "10000000",
    "150000",
    "200000"
  ];

  _fetchData() async {
    var orderServices =
        await OrderServices().getOrderServicesById(widget.data.id);
    if (!mounted) return;
    setState(() {
      _orderServices = orderServices;
      _loading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String arrivedDate = '';
    String checkedOutDate = '';
    String vnTime = '';
    String formattedTimeString = '';
    if (_orderServices != null) {
      String createDate = _orderServices!.order.createdAt.substring(0, 10);
      String checkOut = _orderServices!.order.updatedAt.substring(0, 10);
      String vnTime =
          _orderServices!.order.updatedAt.toString().substring(11, 16);
      DateTime createDateTime = DateTime.parse(createDate);
      DateTime checkOutTime = DateTime.parse(checkOut);
      DateTime originalDateTime = DateTime.utc(1970, 1, 1,
          int.parse(vnTime.substring(0, 2)), int.parse(vnTime.substring(3)));
      DateTime vietnamDateTime =
          originalDateTime.toUtc().add(const Duration(hours: 7));
      formattedTimeString = DateFormat('HH:mm').format(vietnamDateTime);
      arrivedDate =
          '${createDateTime.day.toString().padLeft(2, '0')}/${createDateTime.month.toString().padLeft(2, '0')}/${createDateTime.year.toString()}';
      checkedOutDate =
          '${checkOutTime.day.toString().padLeft(2, '0')}/${checkOutTime.month.toString().padLeft(2, '0')}/${checkOutTime.year.toString()}';
    } else {
      // handle the case where _booking or _booking!.date is null
      const Loading();
    }

    return _loading == true
        ? const Loading()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.white100,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    widget.data.car!.carLisenceNo.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Mã hóa đơn: #${_orderServices?.code.toString()}",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          color: Colors.white,
                          height: 90.h,
                          child: ListTile(
                            leading: Image.asset(
                              "assets/image/icon-logo/homeservice-logo-maintanace.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Sử dụng dịch vụ tại ga-ra",
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
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Ngày đến: $arrivedDate",
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
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Ngày nhận xe: $checkedOutDate',
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
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Tóm tắt đơn hàng",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _orderServices!
                                      .orderServiceDetails?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24, right: 24, bottom: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            "1x",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            _orderServices!
                                                .orderServiceDetails![index]
                                                .item!
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            _orderServices!
                                                .orderServiceDetails![index]
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, bottom: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "1x",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white100,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Phí đặt lịch",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "500.000",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Tổng tạm tính",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "24.000.000",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Phí đặt lịch",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "-500.000",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Tổng cộng",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "23.500.000",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, bottom: 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Thông tin cá nhân",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.lightTextColor,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              //TODO
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/image/icon-logo/bmw-car-icon.png",
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                title: Text(
                                  _orderServices!.car.carBrand.toString(),
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                subtitle: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _orderServices!.car.carLisenceNo
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        _orderServices!.car.carModel,
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.lightTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isThreeLine: true,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
