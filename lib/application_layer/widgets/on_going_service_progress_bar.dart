import 'package:easy_stepper/easy_stepper.dart';
import 'package:empiregarage_mobile/models/response/orderservices.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/colors.dart';

class OnGoingServiceProgressBar extends StatefulWidget {
  final int activeStep;
  final OrderServicesResponseModel order;
  final Function(int) callBack;

  const OnGoingServiceProgressBar(
      {super.key,
      required this.activeStep,
      required this.order,
      required this.callBack});

  @override
  State<OnGoingServiceProgressBar> createState() =>
      _OnGoingServiceProgressBarState();
}

class _OnGoingServiceProgressBarState extends State<OnGoingServiceProgressBar> {
  int _activeStep = 0;

  @override
  void initState() {
    setState(() {
      _activeStep = widget.activeStep;
    });
    super.initState();
  }

  _onSelectTab(selectedTab) {
    if (widget.activeStep < selectedTab) return;
    widget.callBack(selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(35.w),
          child: Container(
            height: 250.h,
            width: 300.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/image/service-picture/ongoingservicepic.png"),
                    fit: BoxFit.fill)),
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.order.car.carBrand} ${widget.order.car.carModel} ',
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightTextColor,
                ),
              ),
              Text(
                '${widget.order.car.carLisenceNo} ',
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightTextColor,
                ),
              ),
              Text(
                "\u2022 ${widget.order.order.user.fullname}",
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
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Phụ trách bởi :",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightTextColor,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "Nguyễn Văn A",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTextColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 21),
          width: 375.w,
          height: 80.h,
          child: EasyStepper(
            activeStep: _activeStep,
            lineType: LineType.normal,
            lineColor: AppColors.blue100,
            stepShape: StepShape.circle,
            stepRadius: 20,
            finishedStepBorderColor: Colors.green,
            finishedStepTextColor: Colors.green,
            finishedStepBackgroundColor: Colors.green,
            unreachedStepBackgroundColor: AppColors.blue100,
            activeStepIconColor: AppColors.blue600,
            activeStepTextColor: AppColors.blue600,
            activeStepBackgroundColor: AppColors.blue600,
            steps: [
              const EasyStep(
                finishIcon: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                  size: 10,
                ),
                icon: Icon(
                  FontAwesomeIcons.one,
                  size: 10,
                ),
                title: 'Đã Check-in',
              ),
              EasyStep(
                finishIcon: const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                  size: 10,
                ),
                icon: const Icon(
                  FontAwesomeIcons.two,
                  size: 10,
                ),
                title: _activeStep > 1 ? 'Đã phân tích' : 'Đang phân tích',
              ),
              const EasyStep(
                finishIcon: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                  size: 10,
                ),
                icon: Icon(
                  FontAwesomeIcons.three,
                  size: 10,
                ),
                title: 'Xác nhận thanh toán',
              ),
              EasyStep(
                finishIcon: const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                  size: 10,
                ),
                icon: const Icon(
                  FontAwesomeIcons.four,
                  size: 10,
                ),
                title: _activeStep > 3 ? 'Đã hoàn tất' : 'Đang thực hiện',
              ),
              EasyStep(
                finishIcon: const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                  size: 10,
                ),
                icon: const Icon(
                  FontAwesomeIcons.five,
                  size: 10,
                ),
                title: _activeStep > 4 ? 'Đã lấy xe' : 'Đợi lấy xe',
              ),
            ],
            onStepReached: (index) => _onSelectTab(index),
          ),
        ),
      ],
    );
  }
}