import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class SeeBookingDetailPayment extends StatefulWidget {
  const SeeBookingDetailPayment({super.key});

  @override
  State<SeeBookingDetailPayment> createState() =>
      _SeeBookingDetailPaymentState();
}

class _SeeBookingDetailPaymentState extends State<SeeBookingDetailPayment> {
  String bookingPrice = "5000000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.searchBarColor,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.blackTextColor,
                )),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Chi tiết thanh toán',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
      ),
      body: Column(children: <Widget>[
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 24, bottom: 24),
              child: Text("Thanh toán",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.grey600,
                  )),
            ),
          ],
        ),
        Container(
          width: 375.w,
          height: 98.h,
          color: AppColors.white100,
          child: Column(children: <Widget>[
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 24),
                  child: Text("Phí đặt chỗ",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 24),
                  child: Text("500000",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 24),
                  child: Text("Tổng tiền",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 24),
                  child: Text("500000",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                ),
              ],
            ),
            
          ]),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 24, bottom: 24),
              child: Text("Phương thức thanh toán",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.grey600,
                  )),
            ),
          ],
        ),
        Container(
          width: 375.w,
          height: 98.h,
          color: AppColors.white100,
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding:  const EdgeInsets.only(left: 24, bottom: 24),
                  child: Row(
                    children:  const [
                      Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColors.blackTextColor,
                            ),
                      Text("Ví điện tử",
                          style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 24),
                  child: Text("500000",
                      style:TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackTextColor,
                      )),
                ),
              ],
            ),
            
          ]),
        ),
      ]),
    );
  }
}
