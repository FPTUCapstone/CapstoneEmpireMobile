import 'dart:developer';

import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:empiregarage_mobile/models/request/update_user_request_model.dart';
import 'package:empiregarage_mobile/models/response/user.dart';
import 'package:empiregarage_mobile/services/user_service/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../../../services/firebase_storage_services/storage_services.dart';

class UserProfile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final userId;
  const UserProfile({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

enum SingingCharacter { male, female }

class _UserProfileState extends State<UserProfile> {
  UserResponseModel? _user;
  UpdateUserRequestModel? model;

  bool _loading = false;

  final SingingCharacter _character = SingingCharacter.male;
  TextEditingController dateinput = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    _getUserById();
    super.initState();
  }

  _getUserById() async {
    _user = await UserService().getUserById(widget.userId);
    if (!mounted) return;
    setState(() {
      if (_user!.gender == null) _user!.gender = true;
      _loading = true;
    });
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
    final Storage storage = Storage();
    var value = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_loading
          ? const Scaffold(
              body: Center(
              child: CircularProgressIndicator(),
            ))
          : Scaffold(
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
                          height: 20.h,
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
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                        "assets/image/user-pic/user.png"),
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
                                      onPressed: () async {
                                        //TODO
                                        // final results =
                                        //     await FilePicker.platform.pickFiles(
                                        //   allowMultiple: false,
                                        //   type: FileType.custom,
                                        //   allowedExtensions: [
                                        //     'png',
                                        //     'jpg',
                                        //     'jpeg'
                                        //   ],
                                        // );
                                        // if (results == null) {
                                        //   // ignore: use_build_context_synchronously
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     const SnackBar(
                                        //       content: Text('No file selected'),
                                        //     ),
                                        //   );
                                        //   return;
                                        // }
                                        // final path = results.files.single.path!;
                                        // final fileName =
                                        //     results.files.single.name;

                                        // storage
                                        //     .uploadFile(fileName, path)
                                        //     .then((value) {
                                        //   setState(() {
                                        //     _user!.img = value!;
                                        //     log("Ko vui Trung da cang");
                                        //   });
                                        // });
                                      },
                                      icon: const Icon(
                                        Icons.edit_rounded,
                                        color: AppColors.whiteButtonColor,
                                      ),
                                    ),
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
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _user!.fullname = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        
                                        color: AppColors.grey200
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: AppColors.buttonColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText:
                                      _user != null ? _user!.fullname : "",
                                  hintStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Ngày sinh",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 12.sp,
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
                                  height: 80,
                                  child: Center(
                                      child: TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(12.0),
                                            constraints: const BoxConstraints(
                                              maxHeight: 20.0,
                                              maxWidth: 20.0,
                                            ),
                                            child: const Image(
                                              image: AssetImage(
                                                'assets/image/icon-logo/calendar.png',
                                              ),
                                            ),
                                          )),
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        
                                        color: AppColors.grey200
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3,
                                              color: AppColors.buttonColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: "Nhập ngày sinh",
                                      hintStyle: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightTextColor,
                                    ),
                                    controller:
                                        dateinput, //editing controller of this TextField
                                    readOnly: true,
                                    validator: (value) {
                                      if (calculateAge(DateTime.parse(value!)) <
                                              18 ||
                                          value.isEmpty) {
                                        return 'Tuổi phải lớn hơn 18';
                                      }
                                      return null;
                                    },
                                    //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(
                                                  1900), //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime.now().add(
                                                  const Duration(days: 0)));
                                      if (calculateAge(pickedDate!) < 18) {
                                        if (kDebugMode) {
                                          print('Tuổi phải lớn hơn 18');
                                        }
                                      } else {
                                        if (kDebugMode) {
                                          print(pickedDate);
                                        } //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                        if (kDebugMode) {
                                          print(formattedDate);
                                        } //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement
                                        setState(() {
                                          dateinput.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      }
                                    },
                                  ))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Số điện thoại",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                
                                controller: _phoneNumber,
                                keyboardType: TextInputType.phone,
                                 decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        
                                        color: AppColors.grey200
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: AppColors.buttonColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText:
                                    _user!.phone,
                                  hintStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Giới tính",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: DropdownButtonFormField(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.lightTextColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Chọn giới tính",
                                  labelStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        
                                        color: AppColors.grey200
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: AppColors.buttonColor),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                items: [
                                  DropdownMenuItem(
                                      value: 0,
                                      child: Text(
                                        "Nam",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      )),
                                  DropdownMenuItem(
                                      value: 1,
                                      child: Text(
                                        "Nữ",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackTextColor,
                                        ),
                                      )),
                                ],
                                onChanged: (value) {},
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _user!.email = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        constraints: const BoxConstraints(
                                          maxHeight: 20.0,
                                          maxWidth: 20.0,
                                        ),
                                        child: const Image(
                                          image: AssetImage(
                                            'assets/image/icon-logo/mail.png',
                                          ),
                                        ),
                                      )),
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        
                                        color: AppColors.grey200
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: AppColors.buttonColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: _user!.email ?? "",
                                ),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  UpdateUserRequestModel model =
                                      UpdateUserRequestModel(
                                          id: _user!.id,
                                          fullname: _user!.fullname,
                                          email: _user!.email,
                                          phone: _user!.phone.toString(),
                                          roleId: _user!.roleId.toString(),
                                          gender: _user!.gender as bool);
                                  var response =
                                      await UserService().updateUser(model);
                                  if (response == null ||
                                      response.statusCode != 204) {
                                    log("error when update user");
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage(),
                                        ),
                                        (route) => false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  fixedSize: Size.fromHeight(50.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Cập nhật thông tin',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14.sp,
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
