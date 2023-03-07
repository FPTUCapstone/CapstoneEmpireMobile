import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';

class RemoveRecommendService extends StatefulWidget {
  const RemoveRecommendService({super.key});

  @override
  State<RemoveRecommendService> createState() => _RemoveRecommendServiceState();
}

class _RemoveRecommendServiceState extends State<RemoveRecommendService> {
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
    return Column(
      children: <Widget>[
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
        Container(
          margin: const EdgeInsets.only(left: 30),
          width: 375.w,
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
        Container(
          margin: const EdgeInsets.only(left: 30, top: 10),
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
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //TODO
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16, right: 56, left: 56),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  title: Text(
                    serviceNames[index],
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  subtitle: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          servicePrices[index],
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
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: AppColors.buttonColor,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          width: 375.w,
          child: Text(
            "Đã bỏ chọn",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //TODO
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16, right: 56, left: 56),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  title: Text(
                    serviceNames[index],
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  subtitle: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          servicePrices[index],
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
                      const Icon(
                        Icons.radio_button_unchecked,
                        color: AppColors.buttonColor,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          width: 375.w,
          child: Row(
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
                "23.000.000",
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
          height: 25.h,
        ),
        SizedBox(
          width: 335.w,
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
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
