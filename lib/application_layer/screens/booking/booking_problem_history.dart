import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import 'booking_history_tab.dart';
import 'booking_problem_tab.dart';

class BookingProblemHistory extends StatefulWidget {
  const BookingProblemHistory({super.key});

  @override
  State<BookingProblemHistory> createState() => _BookingProblemHistoryState();
}

class _BookingProblemHistoryState extends State<BookingProblemHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.grey400,
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.blackTextColor,
                    )),
              ),
            ),
            backgroundColor: AppColors.white100,
            centerTitle: true,
            title: const Text('59B-12345',
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                )),
          ),
          body: Scaffold(
            body: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        toolbarHeight: 20.h,
                        shadowColor: Colors.transparent,
                        bottom: TabBar(
                            labelColor: AppColors.blue600,
                            unselectedLabelColor: AppColors.lightTextColor,
                            indicatorColor: AppColors.blue600,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Vấn đề",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Lịch sử",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  body: const TabBarView(children: <Widget>[
                    //Tab Bar View 1
                    BookingProblemTab(),
                    //TODO
                    //Tab View 2
                    BookingHistoryTab(),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
