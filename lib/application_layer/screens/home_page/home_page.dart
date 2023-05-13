import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service.dart';
import 'package:empiregarage_mobile/application_layer/screens/activities/activities.dart';
import 'package:empiregarage_mobile/application_layer/screens/booking/booking_detail_v2.dart';
import 'package:empiregarage_mobile/application_layer/screens/search/search.dart';
import 'package:empiregarage_mobile/application_layer/screens/services/service_details.dart';
import 'package:empiregarage_mobile/application_layer/widgets/homepage_famous_service.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/helper/notification_helper.dart';
import 'package:empiregarage_mobile/models/response/activity.dart';
import 'package:empiregarage_mobile/services/activity_services/activity_service.dart';
import 'package:empiregarage_mobile/services/item_service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../../../common/colors.dart';
import '../../../models/response/item.dart';
import '../notification/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemResponseModel>? _listItem;
  List<ItemResponseModel>? _filteredItem;

  late List<ActivityResponseModel?> _listOngoingActivity;
  bool _loading = false;

  bool isService = true;

  int _notificationCount = 0;

  _fetchData() async {
    _listItem = await ItemService().fetchListItem(true);
    var userId = await getUserId();
    if (userId == null) throw Exception("NOT_FOUND_USER");
    var listActivity = await ActivityService().fetchOnGoingActivity(userId);
    _listOngoingActivity = listActivity
        .where((element) => element != null && element.isOnGoing == true)
        .where((element) => element!.status == null || element.status != 5) 
        .toList();
    _filteredItem = _listItem;

    //count notification
    _notificationCount = await countNotification();
    if (!mounted) return;
    setState(() {
      _loading = true;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future refresh() {
    return _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return !_loading
        ? const Loading()
        : Scaffold(
            backgroundColor: AppColors.lightGrey,
            body: RefreshIndicator(
              onRefresh: refresh,
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 160.h,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/image/app-logo/homepage-background.png"),
                            fit: BoxFit.cover,
                          ),
                          color: AppColors.welcomeScreenBackGround,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.r),
                            bottomRight: Radius.circular(0.r),
                          )),
                      child: Column(
                        children: <Widget>[
                          SafeArea(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40.h,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/image/app-logo/homepage-icon.png",
                                        width: 135.w,
                                        height: 50.h,
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
                                                  blurRadius: 0.5,
                                                  color: AppColors.blue600,
                                                )
                                              ]),
                                          child: IconButton(
                                              onPressed: () async {
                                                var userId = await getUserId();
                                                if (userId == null) {
                                                  throw Exception(
                                                      "Not found user");
                                                }
                                                // ignore: use_build_context_synchronously
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NotificationPage(
                                                            userId: userId,
                                                          )),
                                                );
                                              },
                                              icon: Badge(
                                                  backgroundColor:
                                                      _notificationCount == 0
                                                          ? Colors.transparent
                                                          : AppColors.errorIcon,
                                                  label: _notificationCount > 0
                                                      ? Text(
                                                          _notificationCount
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        )
                                                      : null,
                                                  child: const ImageIcon(
                                                    AssetImage(
                                                        "assets/image/icon-logo/homepage-notification.png"),
                                                    size: 20,
                                                    color: AppColors
                                                        .whiteButtonColor,
                                                  ))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 140.h,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 335.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.r)),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                color: AppColors.unselectedBtn,
                              )
                            ]),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 311.w,
                            height: 26.h,
                            child: TextField(
                              keyboardType: TextInputType.text,
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
                                  fontFamily: 'Roboto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
                                ),
                                hintText: 'Tìm kiếm...',
                                prefixIcon: const Icon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  size: 20,
                                  color: AppColors.grey400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180.h,
                          ),
                          // Container(
                          //     margin: const EdgeInsets.symmetric(horizontal: 24),
                          //     child: const HomePageServiceIconButton()),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          if (_listOngoingActivity.isNotEmpty)
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Đang hoạt động",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'Roboto'),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _listOngoingActivity.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var item = _listOngoingActivity[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 16.h),
                                        child: InkWell(
                                          onTap: () async {
                                            Navigator.of(context).push(
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .bottomToTop,
                                                    duration: const Duration(
                                                        milliseconds: 350),
                                                    childCurrent: widget,
                                                    child: item.isBooking
                                                        ? BookingDetailv2(
                                                            bookingId: item.id,
                                                          )
                                                        : OnGoingService(
                                                            servicesId: item.id,
                                                          )));
                                          },
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 1.h,
                                                    blurRadius: 1.2,
                                                    offset: Offset(0, 4.h),
                                                  )
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(16))),
                                            child: SizedBox(
                                              height: 70.h,
                                              child: ActivityChip(
                                                carInfo:
                                                    '${item!.car!.carBrand} ${item.car!.carModel} ${item.car!.carLisenceNo}',
                                                date: item.date.toString(),
                                                daysLeft: item.daysLeft,
                                                isBooking: item.isBooking,
                                                item: item,
                                                code: item.code != null
                                                    ? item.code.toString()
                                                    : "#########",
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Dịch vụ phổ biến",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackTextColor,
                                      fontFamily: 'Roboto'),
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Xem tất cả",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white100,
                                          fontFamily: 'Roboto'),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 260.h,
                            width: 300.w,
                            child: ListView.builder(
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _filteredItem!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ServiceDetails(
                                                    itemId:
                                                        _filteredItem![index]
                                                            .id)),
                                      );
                                    },
                                    child: HomepageFamousService(
                                      backgroundImage:
                                          _filteredItem![index].photo,
                                      title: _filteredItem![index].name,
                                      price: _filteredItem![index]
                                              .prices!
                                              .isNotEmpty
                                          ? NumberFormat.currency(
                                                  decimalDigits: 0,
                                                  locale: 'vi_VN',symbol: "đ")
                                              .format(_filteredItem![index]
                                                  .prices!
                                                  .first
                                                  .price)
                                              .toString()
                                          : "Liên hệ",
                                      usageCount: '182',
                                      rating: '4.4',
                                      tag: _filteredItem![index].category !=
                                              null
                                          ? _filteredItem![index].category!.name
                                          : "Dịch vụ",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
