import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? backgroundColor;
  const Loading({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: SpinKitThreeBounce(
        color: AppColors.blueTextColor,
        size: 30,
      )
      ),
    );
  }
}
