import 'package:empiregarage_mobile/application_layer/screens/login/login_screen.dart';
import 'package:empiregarage_mobile/services/authen_firebase_services/AppAuthentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../common/colors.dart';



class OtpConfirmation extends StatefulWidget {
  const OtpConfirmation({Key? key}) : super(key: key);

  @override
  State<OtpConfirmation> createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 68.w,
      height: 64.h,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackTextColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    var otpCode = "";

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Text(
                  "Xác nhận OTP",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Chúng tôi đã gửi mã OTP tới SĐT",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Pinput(
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                  onChanged: (value) {
                    otpCode = value;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => AppAuthentication()
                            .confirmOTP(otpCode, auth, context),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.buttonColor,
                          fixedSize: Size.fromHeight(50.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Xác thực',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        "Sửa số điện thoại ?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    ),
                    const Spacer(),
                    // TextButton(
                    //   onPressed: () {
                    //     AppAuthentication().getOTP(context, vietNamCode, phoneNumber)
                    //   },
                    //   child: Text(
                    //     "Gửi lại mã",
                    //     style: TextStyle(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w700,
                    //       color: AppColors.blackTextColor,
                    //       fontFamily: 'SFProDisplay',
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
