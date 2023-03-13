import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';
import '../../models/response/groupservices.dart';
import '../../services/group_services/group_services.dart';

class HomePageServiceIconButton extends StatefulWidget {
  const HomePageServiceIconButton({Key? key}) : super(key: key);

  @override
  State<HomePageServiceIconButton> createState() =>
      _HomePageServiceIconButtonState();
}

class _HomePageServiceIconButtonState extends State<HomePageServiceIconButton> {
  bool isService = true;

  List<GroupServicesResponseModel>? _listGroupServices;
  List<GroupServicesResponseModel>? _filterGroupServices;

  _getListGroupServices() async {
    _listGroupServices = await GroupServices().fetchGroupServices(isService);
  }

  @override
  void initState() {
    // TODO: implement initState
    _getListGroupServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: GestureDetector(
                  onTap: () {
                    _filterGroupServices = _listGroupServices
                        ?.where((item) => item.name!.contains('Cứu hộ'))
                        .toList();
                  },
                  child: Image.asset(
                    "assets/image/icon-logo/homeservice-logo-rescue.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Cứu hộ',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                    fontFamily: 'SFProDisplay'),
              ),
            ]),
          ),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  _filterGroupServices = _listGroupServices
                      ?.where((item) => item.name!.contains('Chăm sóc'))
                      .toList();
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-care.png",
                  height: 50.h,
                  width: 50.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Chăm sóc',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {},
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-fixing.png",
                  height: 50.h,
                  width: 50.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Sửa chữa',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  _filterGroupServices = _listGroupServices
                      ?.where((item) => item.name!.contains('Bảo dưỡng'))
                      .toList();
                  if(_filterGroupServices != null){
                    print("Trung debug");
                  }
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-maintanace.png",
                  height: 50.h,
                  width: 50.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Bảo dưỡng',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  _filterGroupServices = _listGroupServices
                      ?.where((item) => item.name!.contains('Phụ tùng'))
                      .toList();
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-accessary.png",
                  height: 50.h,
                  width: 50.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Phụ tùng',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
        ],
      ),
    );
  }
}
