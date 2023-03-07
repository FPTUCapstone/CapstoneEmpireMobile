import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../common/colors.dart';

class RecommendChoseService extends StatefulWidget {
  final Function onRecommendChoseServicecallBack;
  const RecommendChoseService({super.key, required this.onRecommendChoseServicecallBack});

  @override
  State<RecommendChoseService> createState() => _RecommendChoseServiceState();
}

class _RecommendChoseServiceState extends State<RecommendChoseService> {
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

  _onContinue() {
    widget.onRecommendChoseServicecallBack();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  //TODO
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 20,
                        ),
                      ],
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
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            width: 335.w,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                _onContinue();
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
