import 'package:empiregarage_mobile/application_layer/screens/orders/orders.dart';
import 'package:empiregarage_mobile/application_layer/screens/user_profile/user_profile_setting.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          height: 80.h,
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //left tab bar icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 60.w,
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
                            Icon(
                              FontAwesomeIcons.compass,
                              size: 24,
                              color: currentTab == 1
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 60.w,
                      height: 60.h,
                      child: MaterialButton(
                        minWidth: 15.w,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Activities();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.fileLines,
                              size: 24,
                              color: currentTab == 2
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Builder(builder: (context) {
                      return SizedBox(
                        height: 60.h,
                        width: 60.w,
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
                              Icon(
                                FontAwesomeIcons.calendarPlus,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      height: 60.h,
                      width: 60.w,
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
                            Icon(
                              Icons.receipt_outlined,
                              size: 30,
                              color: currentTab == 3
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      height: 60.h,
                      width: 60.w,
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
                            Icon(
                              FontAwesomeIcons.user,
                              size: 24,
                              color: currentTab == 4
                                  ? AppColors.buttonColor
                                  : AppColors.grey400,
                            ),
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
