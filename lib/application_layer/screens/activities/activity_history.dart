import 'package:empiregarage_mobile/application_layer/screens/activities/activities.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
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
      _listFiltered = _listActivity;
      _loading = false;
    });
  }

  _onSelectedFilter(List<String> selectedFilters) {
    // 'Đặt lịch',
    // 'Dịch vụ',
    // 'Đặt hàng',
    // 'Cứu hộ'
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

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _loading
          ? const Loading()
          : Scaffold(
              backgroundColor: AppColors.loginScreenBackGround,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 52.h,
                    ),
                    Stack(alignment: Alignment.centerLeft, children: <Widget>[
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
                    SizedBox(
                      width: 337.w,
                      height: 540.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _listFiltered.length,
                        itemBuilder: (context, index) {
                          var item = _listFiltered[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  duration: const Duration(milliseconds: 350),
                                  childCurrent: widget,
                                  child: BookingDetail(
                                    data: item,
                                  )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
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
                    ),
                  ],
                ),
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

  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _filterOptions.map((option) {
        return FilterChip(
          label: Text(option),
          selected: _selectedFilters.contains(option),
          onSelected: (selected) {
            setState(() {
              _selectedFilters.clear();
              if (selected) {
                _selectedFilters.add(option);
              } else {
                _selectedFilters.remove(option);
              }
              widget.onSelectedFilter(_selectedFilters);
            });
          },
        );
      }).toList(),
    );
  }
}
