import 'package:empiregarage_mobile/screens/login/otp_confirmation.dart';
import 'package:empiregarage_mobile/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController countrycode = TextEditingController();
  String vietNameCode = "+84";

  @override
  void initState(){
    countrycode.text = vietNameCode;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Text(
                    "Welcome\nback",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),

                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(
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
                        child:
                        TextField(
                          enabled: false,
                          controller: countrycode,
                        ),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: AppColors.lightTextColor),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "0123456789",
                            ),

                          )
                      ),
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
                      child: ElevatedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OtpConfirmation()),
                        );
                      },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.signInBtn,
                          fixedSize: Size.fromHeight(50.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                            'Sign in'
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
                       "or",
                        style: TextStyle(
                          fontSize: 14.sp,
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
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  onPressed: () {

                  },
                  icon: Icon(Icons.add_circle, color: Colors.red,),
                  label: Text("Continue with Google", style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
