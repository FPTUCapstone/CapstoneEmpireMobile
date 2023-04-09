import 'package:empiregarage_mobile/application_layer/screens/car/add_new_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../common/jwt_interceptor.dart';

import '../../../models/response/booking.dart';
import '../../../services/car_service/car_service.dart';
import 'health_car_record_management_detail.dart';

class HealthCarRecordManagement extends StatefulWidget {
  final int selectedCar;
  final Function(int) onSelected;
  const HealthCarRecordManagement(
      {super.key, required this.selectedCar, required this.onSelected});

  @override
  State<HealthCarRecordManagement> createState() => _HealthCarRecordManagementState();
}

class _HealthCarRecordManagementState extends State<HealthCarRecordManagement> {
  List<CarResponseModel> _listCar = [];
  late int _selectedCar;
  bool _loading = true;

  @override
  void initState() {
    _selectedCar = widget.selectedCar;
    _getUserCar();
    super.initState();
  }

  _getUserCar() async {
    var userId = await getUserId();
    var listCar = await CarService().fetchUserCars(userId as int);
    if (listCar == null) return;
    if (!mounted) return;
    setState(() {
      _listCar = listCar;
      _loading = false;
    });
  }

  void _onCarSelected(int selectedCar) {
    setState(() {
      _selectedCar = selectedCar;
      widget.onSelected(selectedCar);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                )),
          ),
        ),
        centerTitle: true,
        title: const Text('Kết quả chẩn đoán',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddNewCar(onAddCar: (int ) {  },),
                              ));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Scaffold(
        backgroundColor: AppColors.green50,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _listCar.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    CarChipManagement(
                      car: _listCar[index],
                      selectedCar: _selectedCar,
                      onSelected: _onCarSelected,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarChipManagement extends StatefulWidget {
  final CarResponseModel car;
  final int selectedCar;
  final Function(int) onSelected;
  const CarChipManagement(
      {super.key,
      required this.car,
      required this.selectedCar,
      required this.onSelected});

  @override
  State<CarChipManagement> createState() => _CarChipManagementState();
}

class _CarChipManagementState extends State<CarChipManagement> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.car.id == widget.selectedCar;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HealthCarRecordManagementDetail(),
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
            widget.car.carBrand,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.car.carLisenceNo,
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
                  widget.car.carModel,
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
          trailing: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HealthCarRecordManagementDetail(),
                                ));
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
