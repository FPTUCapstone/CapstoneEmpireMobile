import 'package:empiregarage_mobile/common/colors.dart';
import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/helper/common_helper.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class OrderServiceDetail extends StatefulWidget {
  int orderId;
  final OrderServicesResponseModel _orderServicesResponseModel;

  @override
  State<OrderServiceDetail> createState() => _OrderServiceDetailState();

  OrderServiceDetail(this.orderId, this._orderServicesResponseModel,
      {super.key});
}

class _OrderServiceDetailState extends State<OrderServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Align(
          alignment: Alignment.topCenter,
          child: Padding(
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
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 300,
        flexibleSpace: widget._orderServicesResponseModel
                    .orderServiceDetails![widget.orderId].images !=
                null
            ? Stack(
              children: [
                ImageSlideshow(
                    width: double.infinity,
                    height: 400,
                    initialPage: 0,
                    indicatorColor: AppColors.blueTextColor,
                    indicatorBackgroundColor: Colors.grey,
                    children: widget._orderServicesResponseModel
                        .orderServiceDetails![widget.orderId].images!
                        .map((url) {
                      return Image.network(
                        url.img,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Hình ảnh chụp từ Empire Garage", style: AppStyles.header600(fontsize: 8.sp, color: Colors.white),),
                    ))
              ],
            )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.sp),
            Row(
              children: [
                Expanded(
                  child: Text(
                      "${widget._orderServicesResponseModel
                          .orderServiceDetails![widget.orderId].item!.name}",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp)),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.green50,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                      formatCurrency(widget._orderServicesResponseModel
                          .orderServiceDetails![widget.orderId].price),
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.greenTextColor,
                      )),
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
                  fontSize: 12,
                  color: AppColors.lightTextColor,
                )),
            SizedBox(height: 10.sp),
            const Divider(),
            SizedBox(height: 10.sp),
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
            SizedBox(height: 10.sp),
            const Divider(),
            SizedBox(height: 10.sp),
            RichText(
              text: TextSpan(
                  text: 'Bảo hành: ',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.blackTextColor,
                  ),
                  children: [
                    TextSpan(
                        text: widget
                                    ._orderServicesResponseModel
                                    .orderServiceDetails![widget.orderId]
                                    .item!
                                    .warranty !=
                                null
                            ? "${widget._orderServicesResponseModel.orderServiceDetails![widget.orderId].item!.warranty} tháng "
                            : "Chưa có thông tin bảo hành",
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.lightTextColor,
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
