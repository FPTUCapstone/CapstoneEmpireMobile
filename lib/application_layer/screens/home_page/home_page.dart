import 'package:empiregarage_mobile/application_layer/screens/search/search.dart';
import 'package:empiregarage_mobile/application_layer/widgets/homepage_famous_service.dart';
import 'package:empiregarage_mobile/application_layer/widgets/homepage_service_iconbutton.dart';
import 'package:empiregarage_mobile/application_layer/widgets/search_bar.dart';
import 'package:empiregarage_mobile/application_layer/widgets/service_filter_list.dart';
import 'package:empiregarage_mobile/application_layer/widgets/service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            Container(
              height: 240.h,
              decoration: BoxDecoration(
                  color: AppColors.welcomeScreenBackGround,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60.r),
                    bottomRight: Radius.circular(60.r),
                  )),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Image.asset(
                                  "assets/image/app-logo/homepage-icon.png",
                                  height: 100.h,
                                  width: 90.w,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        shape: BoxShape.rectangle,
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 20,
                                            color: AppColors.unselectedBtn,
                                          )
                                        ]),
                                    child: IconButton(
                                        onPressed: () {
                                          //TODO
                                        },
                                        icon: const Icon(
                                          Icons.notifications_none_sharp,
                                          color: AppColors.whiteButtonColor,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              "Khám phá và đặt dịch vụ mà bạn mong muốn",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteTextColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: 330.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: AppColors.searchBarColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(26.r)),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 10,
                                color: AppColors.unselectedBtn,
                              )
                            ]),
                        child: TextField(
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage(
                                          searchString: value,
                                        )),
                              );
                            }
                          },
                          //style: searchTextStyle,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                            hintText: 'Tìm dịch vụ',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.sp,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: HomePageServiceIconButton()),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Text(
                    "Dịch vụ phổ biến",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                        fontFamily: 'SFProDisplay'),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Xem tất cả",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blueTextColor,
                            fontFamily: 'SFProDisplay'),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            HomepageFamousService(),
          ],
        ),
      ),
    );
  }
}
