import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';

class OnDoingService extends StatefulWidget {
  const OnDoingService({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                "30.000.000",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                ),
              ),
            ],
          ),
          Row(
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
                "We are a family owned auto repair service center which offers complete automotive repairs on all makes and models of vehicles. Our technicians are ASE Certified and Washington State Emissions Certified. We have",
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
        ],
      ),
    );
  }
}
