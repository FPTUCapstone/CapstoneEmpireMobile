import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service.dart';
import 'package:empiregarage_mobile/models/request/order_service_detail_request_model.dart';
import 'package:empiregarage_mobile/services/brand_service/brand_service.dart';
import 'package:empiregarage_mobile/services/payment_services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';
import '../../models/request/payment_request_model.dart';
import '../../models/response/orderservices.dart';
import '../../services/booking_service/booking_service.dart';
import '../../services/order_services/order_services.dart';
import 'order_payment.dart';

class OnGoingPaymentService extends StatefulWidget {
  final int servicesId;
  final Function onGoingPaymentCallBack;
  final List<OrderServiceDetailRequestModel> listOrderServiceDetail;
  const OnGoingPaymentService({
    super.key,
    required this.onGoingPaymentCallBack,
    required this.servicesId,
    required this.listOrderServiceDetail,
  });

  @override
  State<OnGoingPaymentService> createState() => _OnGoingPaymentServiceState();
}

class _OnGoingPaymentServiceState extends State<OnGoingPaymentService> {
  int count = 1;
  double sum = 0;
  double sumAfter = 0;
  double prepaid = 0;
  List<OrderServiceDetailRequestModel> _listOrderServiceDetails = [];
  OrderServicesResponseModel? _orderServicesResponseModel;
  bool _loading = true;

  _getBookingPrice() async {
    var response = await BookingService().getBookingPrice();
    setState(() {
      prepaid = response;
    });
    return prepaid;
  }

  _getOrderServices() async {
    var listOrderServiceDetails =
        await OrderServices().getOrderServicesById(widget.servicesId);
    List<OrderServiceDetails>? list =
        listOrderServiceDetails!.orderServiceDetails;
    try {
      if (list != null) {
        setState(() {
          _listOrderServiceDetails = widget.listOrderServiceDetail;
          _orderServicesResponseModel = listOrderServiceDetails;
          for (var item in _listOrderServiceDetails) {
            sum += item.price;
          }
          sum += prepaid;
          sumAfter = sum - prepaid;
          _loading = false;
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  _payOrderFee(PaymentRequestModel model) async {
    var response = await PaymentServices().createNewPaymentForOrder(model);
    if (response!.statusCode == 500) {
      throw Exception("Can not pay order fee");
    }
    return response.body;
  }

  _pay() async {
    if (sumAfter == 0) {
      _onCallBack();
    } else {
      PaymentRequestModel paymentRequestModel = PaymentRequestModel(
          amount: sumAfter,
          name: 'OrderService Payment',
          orderDescription:
              'OrderService Payment for #${_orderServicesResponseModel!.code}',
          orderType: 'VNpay');
      var responsePayment = await _payOrderFee(paymentRequestModel);
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OrderPayment(
          url: responsePayment,
          callback: _onCallBack,
        ),
      ));
    }
  }

  _onCallBack() async {
    var result = await OrderServices().insertOrderDetail(
        _orderServicesResponseModel!.id, 2, _listOrderServiceDetails);
    if (result == null || result.statusCode != 204) {
      throw Exception("Insert order detail fail");
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnGoingService(
              servicesId: _orderServicesResponseModel!.id,
            ),
          ));
    }
  }

  String _getNameOfItem(int itemId) {
    for (var element in _orderServicesResponseModel!
        .healthCarRecord!.healthCarRecordProblems!) {
      for (var e in element.problem.items!) {
        if (e.id == itemId) return e.name;
      }
    }
    return "";
  }

  @override
  void initState() {
    _getBookingPrice();
    _getOrderServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
                width: 310.w,
                child: Text(
                  "Dịch vụ đã chọn",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              count.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            Text(
                              "x",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              _getNameOfItem(
                                  _listOrderServiceDetails[index].itemId),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              NumberFormat.currency(
                                      decimalDigits: 0, locale: 'vi_VN')
                                  .format(_listOrderServiceDetails[index].price)
                                  .toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _listOrderServiceDetails.length,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
                child: Row(
                  children: [
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "x",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Phí kiểm tra",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(decimalDigits: 0, locale: 'vi_VN')
                          .format(prepaid)
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
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
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Text(
                      "Tổng tạm tính",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                       NumberFormat.currency(decimalDigits: 0, locale: 'vi_VN')
                          .format(sum)
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Phí đặt lịch",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(decimalDigits: 0, locale: 'vi_VN')
                          .format(-prepaid)
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Tổng cộng",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(decimalDigits: 0, locale: 'vi_VN')
                          .format(sumAfter)
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ExpansionTile(
                trailing: const Icon(
                  Icons.abc_sharp,
                  color: AppColors.whiteTextColor,
                ),
                title: Center(
                  child: SizedBox(
                    width: 180.w,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add_circle_outline_sharp,
                            size: 16,
                            color: AppColors.blueTextColor,
                          ),
                          Text(
                            "Xem thêm chi tiết",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blueTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    width: 375.w,
                    child: Text(
                      "Kết quả chuẩn đoán",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: ReadMoreText(
                      _orderServicesResponseModel!.healthCarRecord!.symptom
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackTextColor,
                      ),
                      trimLines: 10,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read more',
                      trimExpandedText: ' Show less',
                    ),
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
                        fontFamily: 'Roboto',
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
                              fontFamily: 'Roboto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    leading: FutureBuilder(
                        future: BrandService().getPhoto(
                            _orderServicesResponseModel!.car.carBrand),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(
                              snapshot.data.toString(),
                              height: 50.h,
                              width: 50.w,
                            );
                          } else if (snapshot.hasError) {
                            return Image.asset(
                              "assets/image/icon-logo/bmw-car-icon.png",
                              height: 50.h,
                              width: 50.w,
                            );
                          } else {
                            return Image.asset(
                              "assets/image/icon-logo/bmw-car-icon.png",
                              height: 50.h,
                              width: 50.w,
                            );
                          }
                        }),
                    title: Text(
                      _orderServicesResponseModel!.car.carBrand,
                      style: TextStyle(
                        fontFamily: 'Roboto',
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
                              fontFamily: 'Roboto',
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
                              fontFamily: 'Roboto',
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
                    height: 20.h,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                width: 310.w,
                child: Text(
                  "Phương thức thanh toán",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: ListTile(
                  leading: Image.asset(
                    "assets/image/icon-logo/vnpay.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "VNPay",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      SizedBox(height: 15.h),
                      const Icon(
                        Icons.radio_button_checked,
                        color: AppColors.buttonColor,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 130.w,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onGoingPaymentCallBack();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.grey600,
                          fixedSize: Size.fromHeight(50.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                        child: Text(
                          'Quay lại',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 130.w,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _pay();
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
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          );
  }
}
