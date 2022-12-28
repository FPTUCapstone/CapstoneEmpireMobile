import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

enum SingingCharacter { male, female }

class _UserProfileState extends State<UserProfile> {

  SingingCharacter? _character = SingingCharacter.male;
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Text(
                    "Thông tin\nngười dùng",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Hãy điền thông tin của bạn",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Tên",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Nguyễn Văn A",
                            ),
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title:Text(
                              'Nam',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title:Text(
                              'Nữ',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Ngày sinh",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              height:50,
                              child:Center(
                                  child:TextField(
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackTextColor,
                                    ),
                                    controller: dateinput, //editing controller of this TextField
                                    readOnly: true,  //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context, initialDate: DateTime.now(),
                                          firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2023)
                                      );
                                      if(pickedDate != null ){
                                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
                                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement
                                        setState(() {
                                          dateinput.text = formattedDate; //set output date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                  )
                              )
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "abc@gmail.com",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Số điện thoại",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Nguyễn Văn A",
                          ),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            //TODO
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cập nhật thông tin',
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
