import 'package:empiregarage_mobile/application_layer/screens/orders/orders.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/pick_date_booking.dart';
import '../activities/activities.dart';
import '../home_page/home_page.dart';
import '../user_profile/profile.dart';

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
    const UserProfile(
      userId: 2,
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calendar_month_outlined),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => const PickDateBooking());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //left tab bar icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 15.w,
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
                          Icons.home,
                          color: currentTab == 1
                              ? AppColors.buttonColor
                              : AppColors.unselectedBtn,
                        ),
                        Text(
                          'Trang chủ',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: currentTab == 1
                                ? AppColors.buttonColor
                                : AppColors.unselectedBtn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
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
                          Icons.description,
                          color: currentTab == 2
                              ? AppColors.buttonColor
                              : AppColors.unselectedBtn,
                        ),
                        Text(
                          'Hoạt động',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: currentTab == 2
                                ? AppColors.buttonColor
                                : AppColors.unselectedBtn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //right tab bar icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 15.w,
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
                          Icons.account_balance_wallet_outlined,
                          color: currentTab == 3
                              ? AppColors.buttonColor
                              : AppColors.unselectedBtn,
                        ),
                        Text(
                          'Đơn hàng',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: currentTab == 3
                                ? AppColors.buttonColor
                                : AppColors.unselectedBtn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 15.w,
                    onPressed: () {
                      setState(() {
                        currentScreen = const UserProfile(
                          userId: 2,
                        );
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.perm_identity,
                          color: currentTab == 4
                              ? AppColors.buttonColor
                              : AppColors.unselectedBtn,
                        ),
                        Text(
                          'Cá nhân',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: currentTab == 4
                                ? AppColors.buttonColor
                                : AppColors.unselectedBtn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
