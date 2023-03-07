import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';
import '../widgets/chose_payment_method.dart';

class OnGoingPaymentService extends StatefulWidget {
  final Function onGoingPaymentCallBack;
  const OnGoingPaymentService({super.key, required this.onGoingPaymentCallBack});

  @override
  State<OnGoingPaymentService> createState() => _OnGoingPaymentServiceState();
}

class _OnGoingPaymentServiceState extends State<OnGoingPaymentService> {
  int count = 1;

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

  int sum = 30000;

  int sumAfter = 25000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          width: 310.w,
          child: Text(
            "Dịch vụ gợi ý trên kết quả phân tích",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 30.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                //TODO
              },
              child: Text(
                "Thay đổi",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueTextColor,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          width: 375.w,
          child: Text(
            "Bạn có thể thay đổi theo mong muốn ",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightTextColor,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 18),
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
                    serviceNames[index],
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    servicePrices[index],
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
          itemCount: 3,
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            children: [
              Text(
                "Tổng tạm tính",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackTextColor,
                ),
              ),
              const Spacer(),
              Text(
                sum.toString(),
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
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
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              const Spacer(),
              Text(
                sum.toString(),
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
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Ví điện tử",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackTextColor,
                ),
              ),
              const Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.blackTextColor,
              ),
            ],
          ),
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
                        fontFamily: 'SFProDisplay',
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
              margin: const EdgeInsets.only(left: 30),
              width: 375.w,
              child: Text(
                "Kết quả chuẩn đoán",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              width: 335.w,
              height: 247.h,
              child: ReadMoreText(
                "We are a family owned auto repair service center which offers complete automotive repairs on all makes and models of vehicles. Our technicians are ASE Certified and Washington State Emissions Certified. We have",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackTextColor,
                ),
                trimLines: 2,
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
                "Tran Van A",
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
                      "Ky thuat vien",
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
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: Image.asset(
                "assets/image/icon-logo/bmw-car-icon.png",
                height: 50.h,
                width: 50.w,
              ),
              title: Text(
                "Name",
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
                      "Model",
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
                      "Brand",
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
        Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          width: 310.w,
          child: Text(
            "Phương thức thanh toán",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 30.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const ChosePaymentMethod());
              },
              child: Text(
                "Thay đổi",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueTextColor,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, bottom: 30),
          width: 375.w,
          child: Text(
            "Phương thức được chọn",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightTextColor,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: ListTile(
            leading: Image.asset(
              "assets/image/icon-logo/paypal-icon.png",
              height: 50.h,
              width: 50.w,
            ),
            title: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    "Paypal",
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
                      fontFamily: 'SFProDisplay',
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
                  onPressed: () {
                    //TODO
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
