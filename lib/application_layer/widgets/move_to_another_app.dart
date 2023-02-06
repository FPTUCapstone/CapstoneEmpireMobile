import 'package:empiregarage_mobile/application_layer/widgets/zalo_bottomsheet.dart';
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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const ZaloBottomSheet()
              );
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.buttonColor,
              fixedSize: Size.fromHeight(50.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
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
