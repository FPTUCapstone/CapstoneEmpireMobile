import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

class BookingProblemSeeDetail extends StatefulWidget {
  const BookingProblemSeeDetail({super.key});

  @override
  State<BookingProblemSeeDetail> createState() =>
      _BookingProblemSeeDetailState();
}

class _BookingProblemSeeDetailState extends State<BookingProblemSeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.grey400,
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
        backgroundColor: AppColors.white100,
        centerTitle: true,
        title: const Text("59B-1231",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
      ),
      backgroundColor: AppColors.grey600,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text('Tên vấn đề',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const <Widget>[
                        Text('Tên vấn đề',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text('Ghi chú của kỹ thuật viên',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 310.w,
                          child: const Text('Tên vấn đề',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text('Dịch vụ được gợi ý',
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 310.w,
                          child: const Text('Những dịch  vụ đã  được gợi ý',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.lightTextColor,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: const <Widget>[
                                  Text('Dịch vụ được gợi ý',
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const <Widget>[
                                  Text(
                                      'Giá: Những dịch  vụ đã  được gợi ý',
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors.lightTextColor,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
