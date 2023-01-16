import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class MoveToAnotherApp extends StatelessWidget {
  const MoveToAnotherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                title: Text(
                  'Truy cập ứng dụng Zalo',
                  style:TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                      fontFamily: 'SFProDisplay'),
                ),
                content: Text(
                  'Bạn sẽ được chuyển sang ứng dụng Zalo để trao đổi trực tiếp với Empire Garage (0939 658 345)',
                  style:TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightTextColor,
                      fontFamily: 'SFProDisplay'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      'Cancel',
                      style:TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blueTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var openAppResult = await LaunchApp.openApp(
                        androidPackageName: 'com.zing.zalo',
                        iosUrlScheme: 'pulsesecure://',
                        appStoreLink:
                        'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                        // openStore: false
                      );
                      print(
                          'openAppResult => $openAppResult ${openAppResult.runtimeType}');
                      // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
                      // The second arguments decide wether the app redirects PlayStore or AppStore.
                      // For testing purpose you can enter com.instagram.android
                    },
                    child:Text(
                      'OK',
                      style:TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blueTextColor,
                          fontFamily: 'SFProDisplay'),
                    ),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColors.buttonColor,
              fixedSize: Size.fromHeight(50.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Liên hệ',
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
