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
          height: 230.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: AppColors.whiteTextColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  color: AppColors.unselectedBtn,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.backgroundImage != "null"
                  ? SizedBox(
                      height: 125.h,
                      width: 234.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.backgroundImage,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 125.h,
                      width: 234.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/image/error-image/no-image.png",
                          fit: BoxFit.fitHeight,
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
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                color: Colors.white10,
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
              )
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
