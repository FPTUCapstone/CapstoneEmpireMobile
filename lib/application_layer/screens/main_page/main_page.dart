import 'package:empiregarage_mobile/application_layer/screens/orders/orders.dart';
import 'package:empiregarage_mobile/application_layer/screens/user_profile/user_profile_setting.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/pick_date_booking.dart';
import '../activities/activities.dart';
import '../home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const Activities(),
    const Orders(),
    const UserProfileSettings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  int currentTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 65.h,
          width: 375.w,
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //left tab bar icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 60.h,
                      child: MaterialButton(
                        minWidth: 60.w,
                        height: 60.h,
                        onPressed: () {
                          setState(() {
                            currentScreen = const HomePage();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                  "assets/image/icon-logo/mainpage-home.png"),
                              size: 24,
                              color: currentTab == 1
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Trang chủ",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w700,
                                  color: currentTab == 1
                                      ? AppColors.buttonColor
                                      : AppColors.grey400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                      height: 60.h,
                      child: MaterialButton(
                        minWidth: 60.w,
                        height: 60.h,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Activities();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                  "assets/image/icon-logo/mainpage-activity.png"),
                              size: 24,
                              color: currentTab == 2
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Hoạt động",
                                 style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w700,
                                  color: currentTab == 2
                                      ? AppColors.buttonColor
                                      : AppColors.grey400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: MaterialButton(
                          minWidth: 60.w,
                          height: 60.h,
                          shape: const CircleBorder(),
                          color: AppColors.buttonColor,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => const PickDateBooking());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              ImageIcon(
                                  AssetImage(
                                      "assets/image/icon-logo/mainpage-booking.png"),
                                  size: 30,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 60.h,
                      width: 80.w,
                      child: MaterialButton(
                        minWidth: 60.w,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Orders();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                  "assets/image/icon-logo/mainpage-diagnose.png"),
                              size: 24,
                              color: currentTab == 3
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Chẩn đoán",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w700,
                                  color: currentTab == 3
                                      ? AppColors.buttonColor
                                      : AppColors.grey400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                      width: 70.w,
                      child: MaterialButton(
                        minWidth: 60.w,
                        onPressed: () async {
                          setState(() {
                            currentScreen = const UserProfileSettings();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                  "assets/image/icon-logo/mainpage-profile.png"),
                              size: 24,
                              color: currentTab == 4
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Cá nhân",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w700,
                                  color: currentTab == 4
                                      ? AppColors.buttonColor
                                      : AppColors.grey400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
