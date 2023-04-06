import 'package:empiregarage_mobile/application_layer/widgets/chose_your_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../common/jwt_interceptor.dart';

import '../../../models/response/booking.dart';
import '../../../services/car_service/car_service.dart';

class CarManagement extends StatefulWidget {
  final int selectedCar;
  final Function(int) onSelected;
  const CarManagement(
      {super.key, required this.selectedCar, required this.onSelected});

  @override
  State<CarManagement> createState() => _CarManagementState();
}

class _CarManagementState extends State<CarManagement> {
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
        title: const Text('Quản lý phương tiện',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
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
                    CarChip(
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
