import 'dart:convert';
import 'dart:developer';

import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../../common/api_part.dart';

class CarService {
  Future<http.Response?> addNewCar(
      String carLisenceNo, String carBrand, String carModel) async {
    String apiUrl = '${APIPath.path}/cars';
    final response = await makeHttpRequest(apiUrl,
        method: 'POST',
        body: jsonEncode({
          'carLisenceNo': carLisenceNo,
          'carBrand': carBrand,
          'carModel': carModel
        }),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      log('Car data sent successfully');
    } else {
      log('Error sending car data: ${response.statusCode}');
    }
    return null;
  }
}
