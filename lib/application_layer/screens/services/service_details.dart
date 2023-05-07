import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/application_layer/widgets/move_to_another_app.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:empiregarage_mobile/models/response/item.dart';
import 'package:empiregarage_mobile/services/item_service/item_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class ServiceDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final itemId;
  const ServiceDetails({Key? key, required this.itemId}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  ItemResponseModel? _item;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    _item = await ItemService().fetchItems(widget.itemId);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _loading
          ? Loading(
              backgroundColor: Colors.grey[200],
            )
          : Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 600.h,
                    child: Stack(
                      children: [
                        Container(
                          height: 354.h,
                          decoration: BoxDecoration(
                            image: _item!.photo != "null"
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(_item!.photo),
                                  )
                                : const DecorationImage(
                                    image: AssetImage(
                                      "assets/image/error-image/no-image.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: AppBar(
                                  backgroundColor: Colors.transparent,
                                  leading: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: AppColors.searchBarColor,
                                          width: 1.0,
                                        )),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_outlined,
                                          size: 24,
                                          color: AppColors.whiteButtonColor,
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 80.h,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 20.h,
                                  width: 70.w,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        _item!.category!.name,
                                        style: const TextStyle(
                                          color: AppColors.white100,
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    _item!.name,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.whiteTextColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star,
                                      size: 19,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      "4.4 (146 lượt đánh giá)",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteTextColor,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 300.h,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: 375.w,
                            height: 500.h,
                            decoration: BoxDecoration(
                              color: AppColors.white100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "182 lượt đặt",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: AppColors.green50,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        height: 20,
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            _item!.prices!.isNotEmpty
                                                ? NumberFormat.currency(
                                                        decimalDigits: 0,
                                                        locale: 'vi_VN')
                                                    .format(_item!
                                                        .prices!.first.price)
                                                    .toString()
                                                : "Liên hệ",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.greenTextColor,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.grey400,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Mô tả chi tiết',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackTextColor,
                                            fontFamily: 'Roboto'),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ReadMoreText(
                                    _item!.description.toString(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackTextColor,
                                      fontFamily: 'Roboto',
                                    ),
                                    trimLines: 5,
                                    colorClickableText: AppColors.blueTextColor,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' Read more',
                                    trimExpandedText: ' Show less',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: MoveToAnotherApp(),
              ),
            ),
    );
  }
}
