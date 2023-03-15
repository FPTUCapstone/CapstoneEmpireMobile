import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:empiregarage_mobile/services/order_services/order_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';

class OnDoingService extends StatefulWidget {
  final int servicesId;
  const OnDoingService({super.key, required this.servicesId});

  @override
  State<OnDoingService> createState() => _OnDoingServiceState();
}

class _OnDoingServiceState extends State<OnDoingService> {
  int count = 1;
  bool isSelected = true;
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

  int sum = 0;
  int sumAfter = 0;
  int prepaid = 500000;
  List<OrderServiceDetails> _listOrderServiceDetails = [];
  OrderServicesResponseModel? _orderServicesResponseModel;
  bool _loading = true;

  _getOrderServices() async {
    var listOrderServiceDetails =
        await OrderServices().getOrderServicesById(widget.servicesId);
    List<OrderServiceDetails>? list =
        listOrderServiceDetails!.orderServiceDetails;
    try {
      if (list != null) {
        setState(() {
          _listOrderServiceDetails =
              list.where((element) => element.isConfirmed == true).toList();
          _orderServicesResponseModel = listOrderServiceDetails;
          for (var item in _listOrderServiceDetails) {
            sum += int.parse(item.price.toString());
          }
          sumAfter = sum - prepaid;
          _loading = false;
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  @override
  void initState() {
    _getOrderServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Kỹ thuật viên đang thực hiện",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    " Bạn sẽ nhận được thông báo sau khi sữa chữa hoàn tất",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.searchBarColor,
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tóm tắt đơn hàng",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            count.toString(),
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          Text(
                            "x",
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
                            _listOrderServiceDetails[index]
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
                            _listOrderServiceDetails[index].price.toString(),
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
                  itemCount: _listOrderServiceDetails.length,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.searchBarColor,
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      "Tổng tạm tính",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      sum.toString(),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Phí đặt lịch",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        prepaid.toString(),
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Tổng cộng",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        sumAfter.toString(),
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ExpansionTile(
                  trailing: const SizedBox(),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      const Icon(
                        Icons.add_circle_outline_sharp,
                        size: 16,
                        color: AppColors.blueTextColor,
                      ),
                      Text(
                        "  Xem thêm chi tiết",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Text(
                      "Kết quả chuẩn đoán",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ReadMoreText(
                      _orderServicesResponseModel!.healthCarRecord!.symptom
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackTextColor,
                      ),
                      trimLines: 10,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read more',
                      trimExpandedText: ' Show less',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.searchBarColor,
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/image/service-picture/mechanicPic.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      title: Text(
                        _orderServicesResponseModel!.expert!.fullname,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kỹ thuật viên",
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
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.searchBarColor,
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/image/icon-logo/bmw-car-icon.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      title: Text(
                        _orderServicesResponseModel!.car.carBrand,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              _orderServicesResponseModel!.car.carLisenceNo,
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
                              _orderServicesResponseModel!.car.carModel,
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
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
