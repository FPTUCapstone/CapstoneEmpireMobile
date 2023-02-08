import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/application_layer/widgets/move_to_another_app.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:empiregarage_mobile/models/item.dart';
import 'package:empiregarage_mobile/services/item_service/item_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ServiceDetails extends StatefulWidget {
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
          ? const Loading()
          : Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(_item!.photo),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AppBar(
                          backgroundColor: Colors.transparent,
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: AppColors.searchBarColor,
                                    width: 1.0,
                                  )),
                              child: IconButton(
                                  onPressed: () {
                                    //TODO
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_outlined,
                                    color: AppColors.whiteButtonColor,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          child: SafeArea(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: SafeArea(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 100.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 100.h,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              _item!.name,
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.whiteTextColor,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    child: Container(
                                      color: Colors.deepOrange,
                                    ),
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
              bottomSheet: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteTextColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 50,
                          color: AppColors.unselectedBtn,
                        )
                      ]),
                  height: 390.h,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "182 lượt đặt",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                _item!.prices!.first.price1.toString(),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greenTextColor,
                                    fontFamily: 'SFProDisplay'),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Mô tả chi tiết',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.blackTextColor,
                                    fontFamily: 'SFProDisplay'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 343.w,
                            height: 80.h,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ReadMoreText(
                                    _item!.description.toString(),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackTextColor,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                    trimLines: 3,
                                    colorClickableText: AppColors.blueTextColor,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' Read more',
                                    trimExpandedText: ' Show less',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Đánh giá',
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.blackTextColor,
                                    fontFamily: 'SFProDisplay'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 343.w,
                            height: 80.h,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ReadMoreText(
                                    'We are a family owned auto repair service center which offers complete automotive repairs on all makes and models of vehicles. Our technicians are ASE Certified and Washington State Emissions Certified. We have ….read more',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackTextColor,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                    trimLines: 3,
                                    colorClickableText: AppColors.blueTextColor,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' Read more',
                                    trimExpandedText: ' Show less',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const MoveToAnotherApp(),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
