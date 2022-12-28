import 'package:empiregarage_mobile/services/authen_firebase_services/AppAuthentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  static String vietNamCode = "+84";
  var phoneNumber = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                      "Chào mừng",
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Đăng nhập để tiếp tục",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                        fontFamily: 'SFProDisplay',
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Số điện thoại",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: TextFormField(
                            enabled: false,
                            initialValue: vietNamCode,
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(
                              fontSize: 33, color: AppColors.lightTextColor),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.length > 9 || value.length < 9) {
                              return 'Số điện thoại không hợp lệ !';
                            } else if (value.isEmpty) {
                              return 'Số điện thoại không được để trống !';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          decoration: const InputDecoration(
                            hintText: "0123456789",
                          ),
                        )),
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                AppAuthentication()
                                    .getOTP(context, vietNamCode, phoneNumber);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.buttonColor,
                              fixedSize: Size.fromHeight(50.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Nhận OTP',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                              child: Divider(
                            color: AppColors.blackTextColor,
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "hoặc",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Expanded(
                              child: Divider(
                            color: AppColors.blackTextColor,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SFProDisplay')),
                      onPressed: () {
                        AppAuthentication().siginWithGoogle(auth, context);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      label: Text(
                        "Đăng nhập với Google",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProDisplay'),
                      ),
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
