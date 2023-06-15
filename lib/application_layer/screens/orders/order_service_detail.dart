import 'package:empiregarage_mobile/common/colors.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderServiceDetail extends StatefulWidget {
  int orderId;
  OrderServicesResponseModel _orderServicesResponseModel;

  @override
  State<OrderServiceDetail> createState() => _OrderServiceDetailState();

  OrderServiceDetail(this.orderId, this._orderServicesResponseModel);
}

class _OrderServiceDetailState extends State<OrderServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.blackTextColor,
                )),
          ),
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.h,
              child: Stack(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget._orderServicesResponseModel
                        .orderServiceDetails![widget.orderId].images!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 300.h,
                            decoration: BoxDecoration(
                              image: widget
                                          ._orderServicesResponseModel
                                          .orderServiceDetails![widget.orderId]
                                          .images![index]
                                          .img !=
                                      "null"
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(widget
                                          ._orderServicesResponseModel
                                          .orderServiceDetails![widget.orderId]
                                          .images![index]
                                          .img),
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                        "assets/image/error-image/no-image.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Text(
                              widget
                                  ._orderServicesResponseModel
                                  .orderServiceDetails![widget.orderId]
                                  .images![index]
                                  .imgId
                                  .toString(),
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.blackTextColor,
                              )),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                    widget._orderServicesResponseModel
                        .orderServiceDetails![widget.orderId].item!.name
                        .toString()
                        .toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.blackTextColor,
                    )),
                Spacer(),
                Text(
                    NumberFormat.currency(
                        decimalDigits: 0,
                        locale: 'vi_VN',symbol: "đ")
                        .format(widget._orderServicesResponseModel
                        .orderServiceDetails![widget.orderId].price)
                        .toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.greenTextColor,
                    )
                ),
              ],
            ),
            SizedBox(height: 5.sp),
            Text(
                widget._orderServicesResponseModel
                    .orderServiceDetails![widget.orderId].item!.problem!.name
                    .toString()
                    .toString(),
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.lightTextColor,
                )),
            SizedBox(height: 25.sp),
            const Text('Ghi chú từ kỹ thuật viên',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackTextColor,
                )),
            SizedBox(height: 5.sp),
            Text(
                widget._orderServicesResponseModel
                    .orderServiceDetails![widget.orderId].note
                    .toString()
                    .toString(),
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.lightTextColor,
                )),
            SizedBox(height: 15.sp),
            const Text('Bảo hành: ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackTextColor,
                )
            ),
            SizedBox(height: 5.sp),
            Text(
                widget._orderServicesResponseModel
                            .orderServiceDetails![widget.orderId].item!.warranty
                            .toString() == null
                    ? widget._orderServicesResponseModel
                        .orderServiceDetails![widget.orderId].item!.warranty
                        .toString() + " tháng "
                    : "Chưa có thông tin bảo hành",
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.lightTextColor,
                )),
          ],
        ),
      ),
    );
  }
}
