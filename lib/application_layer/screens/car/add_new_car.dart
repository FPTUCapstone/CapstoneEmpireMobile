import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:empiregarage_mobile/application_layer/widgets/chose_your_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../services/symptoms_service/symptoms_service.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({super.key});

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {

  var _symptonList = [
    // "Khác"
    // "Xe kêu",
    // "Rỉ xăng",
    // "Đảo bánh trước",
    // "Lên ga rung",
    // "Giật ga"
  ];

  TextEditingController _controller = new TextEditingController();

  bool _loading = false;

  _loadingSymptomsList() async{
    var result = await SymptomsService().fetchListSymptoms();
    if(result != null){
      for(var item in result){
          _symptonList.add(item.name.toString());
      }
      setState(() {
        _selectedValue = _symptonList.first.toString();
        _loading = true;
      });
    }
  }

  @override
  void initState() {
    _loadingSymptomsList();
    super.initState();
  }

  String? _selectedValue; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_loading ? Scaffold(body: const Center(child: CircularProgressIndicator(),)) : Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Stack(
                      alignment: Alignment.centerLeft,
                       children : <Widget>[
                          IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Thêm phương tiện",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                          ),
                        ]
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Biển số xe",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children:  [
                      Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(26)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.loginScreenBackGround),
                                  borderRadius: BorderRadius.circular(26)),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              filled: true,
                              hintText: "Nhập biển số xe của bạn",
                            ),
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Hãng xe",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                   Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(26)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(26)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.lightTextColor,
                          ),
                          value: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value as String;
                            });
                          },
                          items: _symptonList.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Dòng xe",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                   Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(26)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(26)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.lightTextColor,
                          ),
                          value: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value as String;
                            });
                          },
                          items: _symptonList.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
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