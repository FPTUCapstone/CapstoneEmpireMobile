import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../common/api_part.dart';

class BookingService {
  Future<http.Response?> createBooking(String date, int carId, int userId,
      String intendedTime, int intendedMinutes) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse('${APIPath.path}/bookings'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'date': date,
          'carId': carId,
          'userId': userId,
          'intendedTime': intendedTime,
          'intendedMinutes': intendedMinutes,
        }),
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
