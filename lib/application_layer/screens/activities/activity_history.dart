import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service.dart';
import 'package:empiregarage_mobile/application_layer/screens/activities/activities.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/common/style.dart';
import 'package:empiregarage_mobile/services/activity_services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/colors.dart';
import '../../../models/response/activity.dart';
import '../booking/booking_detail.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  bool _loading = true;
  List<ActivityResponseModel?> _listActivity = [];
  List<ActivityResponseModel?> _listFiltered = [];

  _fetchData() async {
    var userId = await getUserId();
    if (userId == null) {
      return;
    }
    var listActivity = await ActivityService().fetchActivity(userId);
    if (!mounted) return;
    setState(() {
      _listActivity = listActivity;
      _listFiltered =
          _listActivity.where((element) => element!.isBooking == true).toList();
      _loading = false;
    });
  }

  _onSelectedFilter(List<String> selectedFilters) {
    // 'Đặt lịch',
    // 'Dịch vụ',
    // 'Đặt hàng',
    // 'Cứu hộ'
    if (selectedFilters.isEmpty) {
      setState(() {
        _listFiltered = _listActivity;
      });
    } else {
      for (var element in selectedFilters) {
        switch (element) {
          case 'Đặt lịch':
            setState(() {
              _listFiltered = _listActivity
                  .where((element) => element!.isBooking == true)
                  .toList();
            });
            break;
          case 'Dịch vụ':
            setState(() {
              _listFiltered = _listActivity
                  .where((element) => element!.isBooking == false)
                  .toList();
            });
            break;
          default:
        }
      }
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future reload() {
    return _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _loading
          ? const Loading()
          : Scaffold(
              backgroundColor: AppColors.lightGrey,
              body: RefreshIndicator(
                onRefresh: reload,
                child: ListView(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Lịch sử hoạt động",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                              ),
                            ]),
                        ListFilter(
                          onSelectedFilter: _onSelectedFilter,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _listFiltered.length,
                          itemBuilder: (context, index) {
                            var item = _listFiltered[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration:
                                          const Duration(milliseconds: 350),
                                      childCurrent: widget,
                                      child: item.isBooking
                                          ? BookingDetail(
                                              data: item,
                                            )
                                          : OnGoingService(
                                              servicesId: item.id,
                                            )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1.h,
                                            blurRadius: 1.2,
                                            offset: Offset(0, 4.h),
                                          )
                                        ],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                  child: ActivityChip(
                                    carInfo:
                                        '${item!.car!.carBrand} ${item.car!.carModel} ${item.car!.carLisenceNo}',
                                    date: item.date.toString(),
                                    daysLeft: item.daysLeft,
                                    isBooking: item.isBooking,
                                    item: item,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}

class ListFilter extends StatefulWidget {
  final Function(List<String>) onSelectedFilter;
  const ListFilter({super.key, required this.onSelectedFilter});

  @override
  State<ListFilter> createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  final List<String> _filterOptions = [
    'Đặt lịch',
    'Dịch vụ',
    'Đặt hàng',
    'Cứu hộ'
  ];

  final List<String> _selectedFilters = ['Đặt lịch'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _filterOptions.map((option) {
        return FilterChip(
          label: Text(
            option,
            style: AppStyles.text400(
                color: _selectedFilters.isNotEmpty &&
                        _selectedFilters.first.compareTo(option) == 0
                    ? Colors.white
                    : AppColors.blueTextColor,
                fontsize: 12.sp),
          ),
          selectedColor: AppColors.blueTextColor,
          showCheckmark: false,
          backgroundColor: AppColors.blue100,
          selected: _selectedFilters.contains(option),
          onSelected: (selected) {
            setState(() {
              _selectedFilters.clear();
              if (selected) {
                _selectedFilters.add(option);
              } else {
                _selectedFilters.remove(option);
              }
            });
            widget.onSelectedFilter(_selectedFilters);
          },
        );
      }).toList(),
    );
  }
}
