import 'package:empiregarage_mobile/application_layer/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Chào buổi sáng,';
    }
    if (hour < 17) {
      return 'Chào buổi chiều,';
    }
    return 'Chào buổi tối,';
  }

  MaterialStateProperty<Color> getColor (Color color, Color colorPressed){
    final getColor = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return colorPressed;
      }
      else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children:<Widget> [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                          child: ClipRRect(
                            borderRadius:BorderRadius.circular(50),
                            child: Image.asset("assets/image/app-logo/empirelogo.png"),
                          ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    greeting(),
                                    style:TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.lightTextColor,
                                        fontFamily: 'SFProDisplay'),
                                  ),

                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 16),
                            child: Text(
                              "Gia Minh",
                              style:TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                  fontFamily: 'SFProDisplay'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //Search Bar
                  SearchBar(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                          'Khuyến mãi',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                            fontFamily: 'SFProDisplay'),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          //TODO
                        },
                        child: Text(
                          "Xem tất cả",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blueTextColor,
                            fontFamily: 'SFProDisplay',
                          ),
                        ),
                      )
                    ],
                  ),
                  //This space is for PROMOTION
                  SizedBox(
                    height: 120.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Dịch vụ',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                            fontFamily: 'SFProDisplay'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 93.h,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                         child: Column(
                             children: [
                               Text("Put your Text Here!!!!"),
                               Container(
                                 width: 10,
                                 height: 15,
                                 color: Colors.blue,
                                 child: Align(
                                   alignment: Alignment.center,
                                   child: Text(
                                     'Car or sport car',
                                     maxLines: 3,
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       fontSize: 15,
                                     ),
                                   ),
                                 ),
                               ),]
                         ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 67.w,

                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 67.w,

                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 67.w,

                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Row(
                    children: [
                      Text(
                        'Dịch vụ phổ biến',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                            fontFamily: 'SFProDisplay'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 30.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //TODO
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: getColor(AppColors.buttonColor, AppColors.whiteButtonColor),
                                      backgroundColor: getColor(AppColors.whiteButtonColor, AppColors.buttonColor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          side: BorderSide(width: 1.w, color: AppColors.buttonColor),
                                        )
                                      ),
                                    ),
                                    child: Text(
                                        'Bảo dưỡng',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SFProDisplay'),
                                    ),
                                  )
                                ),
                              ),]
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 30.h,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //TODO
                                      },
                                      style: ButtonStyle(
                                        foregroundColor: getColor(AppColors.buttonColor, AppColors.whiteButtonColor),
                                        backgroundColor: getColor(AppColors.whiteButtonColor, AppColors.buttonColor),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(width: 1.w, color: AppColors.buttonColor),
                                            )
                                        ),
                                      ),
                                      child: Text(
                                        'Sửa chữa',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'SFProDisplay'),
                                      ),
                                    )
                                ),
                              ),]
                        ),
                        Column(
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 30.h,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //TODO
                                      },
                                      style: ButtonStyle(
                                        foregroundColor: getColor(AppColors.buttonColor, AppColors.whiteButtonColor),
                                        backgroundColor: getColor(AppColors.whiteButtonColor, AppColors.buttonColor),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(width: 1.w, color: AppColors.buttonColor),
                                            )
                                        ),
                                      ),
                                      child: Text(
                                        'Tân trang',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'SFProDisplay'),
                                      ),
                                    )
                                ),
                              ),]
                        ),

                        Column(
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 30.h,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //TODO
                                      },
                                      style: ButtonStyle(
                                        foregroundColor: getColor(AppColors.buttonColor, AppColors.whiteButtonColor),
                                        backgroundColor: getColor(AppColors.whiteButtonColor, AppColors.buttonColor),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(width: 1.w, color: AppColors.buttonColor),
                                            )
                                        ),
                                      ),
                                      child: Text(
                                        'Cứu hộ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'SFProDisplay'),
                                      ),
                                    )
                                ),
                              ),]
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      );
  }
}
