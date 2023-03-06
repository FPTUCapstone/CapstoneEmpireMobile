import 'package:easy_stepper/easy_stepper.dart';
import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/colors.dart';

class OnGoingService extends StatefulWidget {
  const OnGoingService({super.key});

  @override
  State<OnGoingService> createState() => _OnGoingServiceState();
}

List<Step> stepList() => [
      const Step(title: Text("123123123"), content: Text("ABXC1")),
      const Step(title: Text("123123123"), content: Text("ABXC2")),
    ];

class _OnGoingServiceState extends State<OnGoingService> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.chevronDown,
            color: AppColors.grey600,
          ),
        ),
        title: Text(
          "Đang kiểm tra",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "BMW - 320 Sportline",
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
                  "59D - 123.45 ",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "Hồng Phúc",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                ),
              ],
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
                activeStep: activeStep,
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
                steps: const [
                  EasyStep(
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
                    finishIcon: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.green,
                      size: 10,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.two,
                      size: 10,
                    ),
                    title: 'Đang phân tích',
                  ),
                  EasyStep(
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
                    finishIcon: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.green,
                      size: 10,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.four,
                      size: 10,
                    ),
                    title: 'Đang thực hiện',
                  ),
                  EasyStep(
                    finishIcon: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.green,
                      size: 10,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.five,
                      size: 10,
                    ),
                    title: 'Hoàn thành',
                  ),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
            ),
            const OnGoingServiceBody(),
          ],
        ),
      ),
    );
  }
}
