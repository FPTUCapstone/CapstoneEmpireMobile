import 'package:empiregarage_mobile/application_layer/screens/main_page/main_page.dart';
import 'package:empiregarage_mobile/application_layer/widgets/chose_payment_method.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/request/booking_request_model.dart';
import 'package:empiregarage_mobile/models/response/booking.dart';
import 'package:empiregarage_mobile/models/response/symptoms.dart';
import 'package:empiregarage_mobile/services/car_service/car_service.dart';
import 'package:empiregarage_mobile/services/symptoms_service/symptoms_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/colors.dart';
import '../../../models/notification.dart';
import '../../../models/request/payment_request_model.dart';
import '../../../services/booking_service/booking_service.dart';
import '../../../services/notification/notification_service.dart';
import '../../../services/payment_services/payment_services.dart';
import '../../widgets/autocomplete_search.dart';
import '../../widgets/booking_fail.dart';
import '../../widgets/booking_successfull.dart';
import '../../widgets/chose_your_car.dart';
import '../../widgets/deposit_bottomsheet.dart';
import '../car/add_new_car.dart';
import 'booking_payment.dart';

class BookingInfo extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selectedDate;

  const BookingInfo({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  late BookingRequestModel requestModel;

  int index = 0;

  // ignore: prefer_final_fields
  // TextEditingController _symptonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  List<SymptonResponseModel> options = [];

  final List<SymptonResponseModel> _listSuggestService = [];

  List<SymptonResponseModel> _symptonList = [
    // "Khác"
    // "Xe kêu",
    // "Rỉ xăng",
    // "Đảo bánh trước",
    // "Lên ga rung",
    // "Giật ga"
  ];

  int _bookingPrice = 0;

  PaymentRequestModel model = PaymentRequestModel(
      orderType: '', amount: 0, orderDescription: '', name: '');

  _payBookingFee(PaymentRequestModel model) async {
    var response = await PaymentServices().createNewPaymentForBooking(model);
    if (response!.statusCode == 500) {
      throw Exception("Can not pay booking fee");
    }
    return response.body;
  }

  _getBookingPrice()async{
    var response = await BookingService().getBookingPrice();
    setState(() {
      _bookingPrice = response;
    });
    return _bookingPrice;
  }



  // List<String> _getSuggestions(String query) {
  //   List<String> matches = [];
  //   matches.addAll(_symptonList
  //       .where((s) =>
  //           s.name.toString().toLowerCase().contains(query.toLowerCase()))
  //       .map((s) => s.name.toString()));
  //   return matches;
  // }

  // void _onSuggestionSelected(String suggestion) {
  //   setState(() {
  //     _symptonController.text = suggestion;
  //   });
  // }

  final List<SymptomModel> _listSymptom = [];
  bool _loading = false;
  late int _selectedCar;
  List<CarResponseModel> _listCar = [];

  _loadingSymptomsList() async {
    var result = await SymptomsService().fetchListSymptoms();
    if (result != null) {
      _symptonList = result;
      setState(() {
        // _selectedIndex = _symptonList.first.id;
        _listSymptom.add(SymptomModel(id: _symptonList.first.id));
      });
    }
  }

  _loadOptions() async {
    var result = await SymptomsService().fetchListSymptoms();
    if (result != null) {
      setState(() {
        options = result;
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

  void _onCallBackSymptoms(int int) {
    setState(() {
      _listSuggestService
          .add(options.where((element) => element.id == int).first);
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

  // int? _selectedIndex;

  @override
  void initState() {
    _dateController.text = widget.selectedDate.toString().substring(0, 10);
    _getBookingPrice();
    _loadOptions();
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

  _onCallBackFromPayment() async {
    setState(() {
      _loading = false;
    });
    String date = _dateController.text;
    int userId = await getUserId() as int;
    int carId =
        _listCar.where((element) => element.id == _selectedCar).first.id;
    int intendedMinutes = 30;
    var response = await BookingService()
        .createBooking(date, carId, userId, intendedMinutes, _listSymptom);

    if (response!.statusCode == 201) {
      var notificationModel = NotificationModel(
          isAndroiodDevice: true,
          title: "Empire Garage",
          body: "Your booking has been created successful");
      await NotificationService().sendNotification(notificationModel);
      setState(() {
        _loading = true;
      });
      // ignore: use_build_context_synchronously
      showModalBottomSheet(
          context: context, builder: (context) => const BookingSuccessfull());
    } else {
      setState(() {
        _loading = true;
      });
      // ignore: use_build_context_synchronously
      showModalBottomSheet(
          context: context,
          builder: (context) => const BookingFailed(
                message: 'Đặt lịch thất bại, vui lòng thử lại',
              ));
    }
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
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.topToBottomPop,
                        duration: const Duration(milliseconds: 350),
                        childCurrent: widget,
                        child: const MainPage()));
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 32,
                    color: AppColors.lightTextColor,
                  ),
                ),
                title: Text(
                  "Đặt lịch",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: refresh,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGrey),
                                      borderRadius: BorderRadius.circular(12)),
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SearchableDropdown(
                                options: options,
                                onSelectedItem: _onCallBackSymptoms),
                          ),
                        ],
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
                      Text(
                        "Phương tiện được chọn",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightTextColor,
                        ),
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
                      Text(
                        "Phương thức được chọn",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const ChosePaymentMethod());
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
                              "assets/image/icon-logo/vnpay.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            title: Text(
                              "VNPAY",
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
                            _bookingPrice.toString(),
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
                            _bookingPrice.toString(),
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
                        height: 36.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                PaymentRequestModel paymentRequestModel =
                                    PaymentRequestModel(
                                        amount: _bookingPrice,
                                        name: 'Trung',
                                        orderDescription: 'ABC',
                                        orderType: 'VNpay');
                                var responsePayment =
                                    await _payBookingFee(paymentRequestModel);
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BookingPayment(
                                    url: responsePayment,
                                    callback: _onCallBackFromPayment,
                                  ),
                                ));

                                // }
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
                        height: 36.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
