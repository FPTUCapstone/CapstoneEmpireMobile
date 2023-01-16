import 'package:empiregarage_mobile/application_layer/widgets/move_to_another_app.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: 375.w,
          height: 352.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/service-picture/service-picture2.png'),
            )
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                          color: AppColors.whiteButtonColor,
                          )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomSheet: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
                height: 390.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Description',
                            style:TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.blackTextColor,
                                fontFamily: 'SFProDisplay'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 343.w,
                        height: 100.h,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: ReadMoreText(
                                'We are a family owned auto repair service center which offers complete automotive repairs on all makes and models of vehicles. Our technicians are ASE Certified and Washington State Emissions Certified. We have ….read more',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                  fontFamily: 'SFProDisplay',
                                ),
                                trimLines: 3,
                                colorClickableText: AppColors.blueTextColor,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: 'Show less',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Reviews',
                            style:TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.blackTextColor,
                                fontFamily: 'SFProDisplay'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 343.w,
                        height: 100.h,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: ReadMoreText(
                                'We are a family owned auto repair service center which offers complete automotive repairs on all makes and models of vehicles. Our technicians are ASE Certified and Washington State Emissions Certified. We have ….read more',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                  fontFamily: 'SFProDisplay',
                                ),
                                trimLines: 3,
                                colorClickableText: AppColors.blueTextColor,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: 'Show less',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      MoveToAnotherApp(),
                    ],

                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
