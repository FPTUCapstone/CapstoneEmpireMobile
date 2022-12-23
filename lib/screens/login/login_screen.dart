import 'package:empiregarage_mobile/screens/login/otp_confirmation.dart';
import 'package:empiregarage_mobile/utilities/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countrycode = TextEditingController();
  String vietNamCode = "+84";
  var phoneNumber = "";

  @override
  void initState() {
    countrycode.text = vietNamCode;
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
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: TextField(
                            enabled: false,
                            controller: countrycode,
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
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value){
                                phoneNumber = value;
                              },
                          decoration: InputDecoration(
                            hintText: "0123456789",
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async{
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '${countrycode.text + phoneNumber}',
                              timeout: const Duration(seconds: 60),
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                if (e.code == 'invalid-phone-number') {
                                  print('The provided phone number is not valid.');
                                }
                              },
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const OtpConfirmation()),
                                );
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const OtpConfirmation()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.signInBtn,
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
                      //TODO
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Đăng nhập với Google",
                      style: TextStyle(
                        color: Colors.black,
                      ),
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
