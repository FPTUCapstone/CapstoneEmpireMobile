import 'package:empiregarage_mobile/common/colors.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        title: Text('Chi tiết sửa chữa từ kỹ thuật viên',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Row(
              children: [
                Text(widget._orderServicesResponseModel
                    .orderServiceDetails![widget.orderId].item!.name.toString()
                    .toString(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.blackTextColor,
                    )
                ),
                Spacer(),
                Text(widget._orderServicesResponseModel
                    .orderServiceDetails![widget.orderId].price.toString()
                    .toString(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.blueTextColor,
                    )
                ),
              ],
            ),
            SizedBox(height: 5.sp),
            Text(widget._orderServicesResponseModel
                .orderServiceDetails![widget.orderId].item!.problem!.name.toString()
                .toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.lightTextColor,
                )
            ),
            SizedBox(height: 15.sp),
            Text('Ghi chú từ kỹ thuật viên',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackTextColor,
                )
            ),
            SizedBox(height: 10.sp),
            Text(widget._orderServicesResponseModel
                .orderServiceDetails![widget.orderId].note.toString()
                .toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.lightTextColor,
                )
            ),
            SizedBox(height: 15.sp),
            Text('Thời gian bảo hành: ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackTextColor,
                )
            ),
          ],
        ),
      ),
    );
  }
}
