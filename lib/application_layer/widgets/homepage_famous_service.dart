import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class HomepageFamousService extends StatelessWidget {
  const HomepageFamousService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Container(
              height: 230.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 5,
                      color: AppColors.unselectedBtn,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/service-picture/service-picture1.png",
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Đại tu hộp số",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Colors.white10,
                                  )
                                ]
                            ),
                            child: Text(
                              "20.000",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greenTextColor,
                                  fontFamily: 'SFProDisplay'),
                            )
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              height: 230.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 5,
                      color: AppColors.unselectedBtn,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/service-picture/service-picture1.png",
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Đại tu hộp số",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Colors.white10,
                                  )
                                ]
                            ),
                            child: Text(
                              "20.000",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greenTextColor,
                                  fontFamily: 'SFProDisplay'),
                            )
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              height: 230.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 5,
                      color: AppColors.unselectedBtn,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/service-picture/service-picture1.png",
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Đại tu hộp số",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Colors.white10,
                                  )
                                ]
                            ),
                            child: Text(
                              "20.000",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greenTextColor,
                                  fontFamily: 'SFProDisplay'),
                            )
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              height: 230.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 5,
                      color: AppColors.unselectedBtn,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/service-picture/service-picture1.png",
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Đại tu hộp số",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Colors.white10,
                                  )
                                ]
                            ),
                            child: Text(
                              "20.000",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greenTextColor,
                                  fontFamily: 'SFProDisplay'),
                            )
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              height: 230.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 5,
                      color: AppColors.unselectedBtn,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/service-picture/service-picture1.png",
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Đại tu hộp số",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Colors.white10,
                                  )
                                ]
                            ),
                            child: Text(
                              "20.000",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greenTextColor,
                                  fontFamily: 'SFProDisplay'),
                            )
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
