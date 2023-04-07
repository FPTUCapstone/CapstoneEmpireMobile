import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:empiregarage_mobile/services/order_services/order_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';

class RecommendChoseService extends StatefulWidget {
  final int servicesId;
  final Function onRecommendChoseServicecallBack;
  const RecommendChoseService(
      {super.key,
      required this.onRecommendChoseServicecallBack,
      required this.servicesId});

  @override
  State<RecommendChoseService> createState() => _RecommendChoseServiceState();
}

class _RecommendChoseServiceState extends State<RecommendChoseService> {
  bool isSelected = true;

  List<OrderServiceDetails> _listOrderServiceDetails = [];
  OrderServicesResponseModel? _orderServicesResponseModel;
  int _sum = 0;
  bool _loading = true;
  String? _error;

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

  _getOrderServices() async {
    var listOrderServiceDetails =
        await OrderServices().getOrderServicesById(widget.servicesId);
    List<OrderServiceDetails>? list =
        listOrderServiceDetails!.orderServiceDetails;
    try {
      if (list != null) {
        setState(() {
          _listOrderServiceDetails = list;
          _orderServicesResponseModel = listOrderServiceDetails;
          for (var item in list) {
            _sum += int.parse(item.price.toString());
          }
          _loading = false;
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  _confirmService(OrderServiceDetails item) {
    setState(() {
      _error = null;
      _listOrderServiceDetails
          .where((element) => element.id == item.id)
          .first
          .isConfirmed = !(item.isConfirmed as bool);

      _sum = item.isConfirmed == false
          ? _sum - int.parse(item.price.toString())
          : _sum + int.parse(item.price.toString());
    });
  }

  _onContinue() {
    if (_listOrderServiceDetails
        .where((element) => element.isConfirmed == true)
        .isEmpty) {
      setState(() {
        _error = "Cần phải chọn ít nhất 1 dịch vụ";
      });
      return;
    }
    widget.onRecommendChoseServicecallBack();
  }

  @override
  void initState() {
    super.initState();
    _getOrderServices();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 15.h),
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
                SizedBox(height: 15.h),
                const Divider(
                  thickness: 1,
                  color: AppColors.searchBarColor,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Dịch vụ gợi ý trên kết quả phân tích",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Bạn có thể thay đổi theo mong muốn ",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                ),
                SizedBox(height: 10.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listOrderServiceDetails.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () => _confirmService(
                                _listOrderServiceDetails[index]),
                            child: ListTile(
                              title: Text(
                                _listOrderServiceDetails[index]
                                    .item!
                                    .name
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Giá : ",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                    Text(
                                      servicePrices[index]
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  SizedBox(height: 15.h),
                                  Icon(
                                    _listOrderServiceDetails[index]
                                                .isConfirmed ==
                                            true
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    color: AppColors.buttonColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                      _sum.toString(),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                if (_error != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(_error.toString(),
                        style: AppStyles.text400(
                            fontsize: 12.sp, color: Colors.red)),
                  ),
                SizedBox(
                  width: 335.w,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      var response = await OrderServices().putConfirmOrder(
                          _orderServicesResponseModel!.id,
                          _listOrderServiceDetails);
                      if (response != null && response.statusCode == 204) {
                        _onContinue();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      fixedSize: Size.fromHeight(50.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    child: Text(
                      'Tiếp tục',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          );
  }
}
