import 'package:empiregarage_mobile/application_layer/screens/home_page/home_page.dart';
import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
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

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (birthDate.month > currentDate.month) {
      age--;
    } else if (currentDate.month == birthDate.month) {
      if (birthDate.day > currentDate.day) {
        age--;
      }
    }
    return age;
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
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cập nhật thông tin",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 160.w,
                      height: 160.h,
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: 160.w,
                            height: 160.h,
                            child: const CircleAvatar(
                              child: Text('Avatar'),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 5,
                            child: Container(
                              width: 33.w,
                              height: 33.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.buttonColor,
                                shape: BoxShape.rectangle,
                              ),
                              child: IconButton(
                                onPressed: ()
                                {
                                  //TODO
                                },
                                icon: Icon(Icons.edit_rounded,color: AppColors.whiteButtonColor,),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Họ và tên",
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
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.loginScreenBackGround),
                                  borderRadius: BorderRadius.circular(12)),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              filled: true,
                              hintText: "Nhập họ và tên",
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
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
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
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
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
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
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
                          child: SizedBox(
                              height:50,
                              child:Center(
                                  child:TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.loginScreenBackGround),
                                          borderRadius: BorderRadius.circular(12)),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      filled: true,
                                      hintText: "Nhập ngày sinh",
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightTextColor,
                                    ),
                                    controller: dateinput, //editing controller of this TextField
                                    readOnly: true,
                                    validator: (value) {
                                      if (calculateAge(DateTime.parse(value!)) < 18 || value.isEmpty) {
                                        return 'Tuổi phải lớn hơn 18';
                                      }
                                      return null;
                                    },
                                    //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime.now().add(new Duration(days: 0))
                                      );
                                      if(calculateAge(pickedDate!) < 18){
                                        print('Tuổi phải lớn hơn 18');
                                      }
                                      else{
                                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement
                                        setState(() {
                                          dateinput.text = formattedDate; //set output date to TextField value.
                                        });
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
                    style:  TextStyle(
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
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(12)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                            hintText: "Nhập Email",
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
                    "Số điện thoại",
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
                          keyboardType: TextInputType.phone,
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(12)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                            hintText: "Nhập SĐT",
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
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
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
