import 'package:empiregarage_mobile/application_layer/screens/car/add_new_car.dart';
import 'package:empiregarage_mobile/application_layer/widgets/booking_fail.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/notification.dart';
import 'package:empiregarage_mobile/models/request/booking_request_model.dart';
import 'package:empiregarage_mobile/models/response/booking.dart';
import 'package:empiregarage_mobile/models/response/symptoms.dart';
import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:empiregarage_mobile/services/car_service/car_service.dart';
import 'package:empiregarage_mobile/services/notification/notification_service.dart';
import 'package:empiregarage_mobile/services/symptoms_service/symptoms_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../widgets/booking_successfull.dart';
import '../../widgets/chose_payment_method.dart';
import '../../widgets/chose_your_car.dart';
import '../../widgets/deposit_bottomsheet.dart';

class BookingInfo extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selectedDate;

  const BookingInfo({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  late BookingRequestModel requestModel;

  List<SymptonResponseModel> _symptonList = [
    // "Khác"
    // "Xe kêu",
    // "Rỉ xăng",
    // "Đảo bánh trước",
    // "Lên ga rung",
    // "Giật ga"
  ];

  final TextEditingController _dateController = TextEditingController();
  final List<SymptomModel> _listSymptom = [];
  bool _loading = false;
  late int _selectedCar;
  List<CarResponseModel> _listCar = [];

  _loadingSymptomsList() async {
    var result = await SymptomsService().fetchListSymptoms();
    if (result != null) {
      _symptonList = result;
      setState(() {
        _selectedIndex = _symptonList.first.id;
        _listSymptom.add(SymptomModel(id: _symptonList.first.id));
      });
    }
  }

  _getUserCar() async {
    var userId = await getUserId();
    var listCar = await CarService().fetchUserCars(userId as int);
    if (!mounted) return;
    if (listCar == null || listCar.isEmpty) {
      setState(() {
        _loading = true;
      });
      return;
    }
    setState(() {
      _listCar = listCar;
      _selectedCar = _listCar.first.id;
      _loading = true;
    });
  }

  void _onCarSelected(int selectedCar) {
    setState(() {
      _selectedCar = selectedCar;
    });
  }

  void _onCallBack(int selectedCar) async {
    setState(() {
      _loading = false;
    });
    _dateController.text = widget.selectedDate.toString().substring(0, 10);
    await _loadingSymptomsList();
    await _getUserCar();
    setState(() {
      _loading = true;
      _selectedCar = selectedCar;
    });
  }

  int? _selectedIndex;

  @override
  void initState() {
    _dateController.text = widget.selectedDate.toString().substring(0, 10);
    _loadingSymptomsList();
    _getUserCar();
    super.initState();
  }

  _loadData() async {
    _dateController.text = widget.selectedDate.toString().substring(0, 10);
    await _loadingSymptomsList();
    await _getUserCar();
  }

  Future refresh() {
    return _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_loading
          ? const Scaffold(
              body: Center(
              child: CircularProgressIndicator(),
            ))
          : Scaffold(
              backgroundColor: AppColors.lightGrey,
              body: RefreshIndicator(
                onRefresh: refresh,
                child: SingleChildScrollView(
                  reverse: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Đặt lịch",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Ngày đặt",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 55.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  enabled: false,
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.lightGrey),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    filled: true,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Triệu chứng",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 55.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightTextColor,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors
                                                .loginScreenBackGround),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    filled: true,
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.lightTextColor,
                                  ),
                                  value: _selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedIndex = value as int;
                                      _listSymptom.add(SymptomModel(
                                          id: _selectedIndex as int));
                                    });
                                  },
                                  items: _symptonList.map((e) {
                                    return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phương tiện",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            _listCar.isNotEmpty
                                ? TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => ChoseYourCar(
                                                selectedCar: _selectedCar,
                                                onSelected: _onCarSelected,
                                                onCallBack: _onCallBack,
                                              ));
                                    },
                                    child: Text(
                                      "Chọn",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blueTextColor,
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                        _listCar.isEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        isDismissible: false,
                                        context: context,
                                        builder: (context) => AddNewCar(
                                              // ignore: avoid_types_as_parameter_names
                                              onAddCar: (int) {
                                                _loadData();
                                              },
                                            ));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: SizedBox(
                                      height: 55.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add_circle_outline,
                                            color: AppColors.blueTextColor,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "Thêm phương tiện",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blueTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => ChoseYourCar(
                                            selectedCar: _selectedCar,
                                            onSelected: _onCarSelected,
                                            onCallBack: _onCallBack,
                                          ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/image/icon-logo/bmw-car-icon.png",
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    title: Text(
                                      _listCar
                                          .where((element) =>
                                              element.id == _selectedCar)
                                          .first
                                          .carBrand,
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                    subtitle: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _listCar
                                                .where((element) =>
                                                    element.id == _selectedCar)
                                                .first
                                                .carLisenceNo,
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackTextColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            _listCar
                                                .where((element) =>
                                                    element.id == _selectedCar)
                                                .first
                                                .carModel,
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.lightTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isThreeLine: true,
                                    trailing: Column(
                                      children: [
                                        SizedBox(height: 15.h),
                                        const Icon(
                                          Icons.radio_button_checked,
                                          color: AppColors.buttonColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phương thức thanh toán",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const ChosePaymentMethod());
                              },
                              child: Text(
                                "Chọn",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blueTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const ChosePaymentMethod());
                          },
                          child: Container(
                            height: 55.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                "assets/image/icon-logo/paypal-icon.png",
                                height: 50.h,
                                width: 50.w,
                              ),
                              title: Text(
                                "Paypal",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  SizedBox(height: 15.h),
                                  const Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.buttonColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Thanh toán",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phí đặt chỗ",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "500.000",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                          child: const Divider(
                            thickness: 1,
                            color: AppColors.searchBarColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Tổng cộng",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "500.000",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Text(
                                "**Phí đặt chỗ sẽ được khấu trừ vào hóa đơn**",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          const DepositBottomSheet());
                                },
                                child: Text(
                                  "Tại sao tôi phải trả phí đặt chỗ ?",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackTextColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ))
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
                                  String date = _dateController.text;
                                  int userId = await getUserId() as int;
                                  int carId = _listCar
                                      .where((element) =>
                                          element.id == _selectedCar)
                                      .first
                                      .id;
                                  int intendedMinutes = 30;

                                  var response = await BookingService()
                                      .createBooking(date, carId, userId,
                                          intendedMinutes, _listSymptom);

                                  if (response!.statusCode == 201) {
                                    var notificationModel = NotificationModel(
                                        isAndroiodDevice: true,
                                        title: "Empire Garage",
                                        body:
                                            "Your booking has been created successful");
                                    await NotificationService()
                                        .sendNotification(notificationModel);
                                    // ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            const BookingSuccessfull());
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            const BookingFailed());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  fixedSize: Size.fromHeight(50.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Text(
                                  'Đặt lịch',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
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
