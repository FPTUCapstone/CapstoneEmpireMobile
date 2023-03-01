import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class HomepageFamousService extends StatefulWidget {
  final String backgroundImage;
  final String title;
  final String price;
  final String usageCount;
  final String rating;
  final String tag;

  const HomepageFamousService({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.price,
    required this.usageCount,
    required this.rating,
    required this.tag,
  });

  @override
  State<HomepageFamousService> createState() => _HomepageFamousServiceState();
}

class _HomepageFamousServiceState extends State<HomepageFamousService> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 300.h,
          width: 246.w,
          decoration: BoxDecoration(
              color: AppColors.whiteTextColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  color: AppColors.unselectedBtn,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.backgroundImage != "null"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 160.h,
                        width: 234.w,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Transform.scale(
                            scale: 1.2,
                            child: Image.network(
                              widget.backgroundImage,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 160.h,
                        width: 234.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/image/error-image/no-image.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                    const Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 20,
                                color: Colors.green,
                              )
                            ]),
                        child: Text(
                          widget.price,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greenTextColor,
                              fontFamily: 'SFProDisplay'),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 0.1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.grey400, // set the border color to grey
                      width: 1, // set the border width to 1 pixel
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.usageCount,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                    SizedBox(width: 3.w,),
                    Text(
                      "lượt sử dụng",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                    const Spacer(),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          size: 19,
                          color: Colors.yellow,
                        ),
                        Text(
                          widget.rating,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightTextColor,
                              fontFamily: 'SFProDisplay'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }
}
