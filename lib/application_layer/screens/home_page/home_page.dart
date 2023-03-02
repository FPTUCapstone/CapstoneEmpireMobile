import 'package:empiregarage_mobile/application_layer/screens/notification/notification.dart';
import 'package:empiregarage_mobile/application_layer/screens/search/search.dart';
import 'package:empiregarage_mobile/application_layer/screens/services/service_details.dart';
import 'package:empiregarage_mobile/application_layer/widgets/homepage_famous_service.dart';
import 'package:empiregarage_mobile/application_layer/widgets/homepage_service_iconbutton.dart';
import 'package:empiregarage_mobile/services/item_service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../../../models/response/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemResponseModel>? _listItem;
  List<ItemResponseModel>? _filteredItem;
  bool _loading = false;

  _fetchData() async {
    _listItem = await ItemService().fetchListItem();
    _filteredItem = _listItem;
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

  @override
  Widget build(BuildContext context) {
    return !_loading
        ? const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : Material(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 260.h,
                    decoration: BoxDecoration(
                        color: AppColors.welcomeScreenBackGround,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.r),
                          bottomRight: Radius.circular(0.r),
                        )),
                    child: Stack(
                      children: <Widget>[
                        SafeArea(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
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
                                                blurRadius: 1,
                                                color: AppColors.blue600,
                                              )
                                            ]),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const NotificationPage()),
                                              );
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.bell,
                                              size: 20,
                                              color: AppColors.whiteButtonColor,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
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
                        Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: 335.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                  color: AppColors.searchBarColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(26.r)),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 5,
                                      color: AppColors.unselectedBtn,
                                    )
                                  ]),
                              child: SizedBox(
                                width: 104.w,
                                height: 24.h,
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
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      size: 20,
                                      color: AppColors.grey400,
                                    ),
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
                      child: const HomePageServiceIconButton()),
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
                        const Spacer(),
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
                    height: 250.h,
                    width: 340.w,
                    child: ListView.separated(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _filteredItem!.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 15.w,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceDetails(
                                      itemId: _filteredItem![index].id)),
                            );
                          },
                          child: HomepageFamousService(
                            backgroundImage: _filteredItem![index].photo,
                            title: _filteredItem![index].name,
                            price: _filteredItem![index].prices!.isNotEmpty
                                ? NumberFormat.currency(
                                        decimalDigits: 0, locale: 'vi_VN')
                                    .format(_filteredItem![index]
                                        .prices!
                                        .first
                                        .price)
                                    .toString()
                                : "Liên hệ",
                            usageCount: '182',
                            rating: '4.4',
                            tag: _filteredItem![index].category != null
                                ? _filteredItem![index].category!.name
                                : "Dịch vụ",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
