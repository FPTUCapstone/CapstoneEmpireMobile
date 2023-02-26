import 'dart:convert';
import 'dart:developer';

import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/response/qrcode.dart';
import 'package:http/http.dart' as http;

import '../../common/api_part.dart';

class BookingService {
  Future<http.Response?> createBooking(
      String date, int carId, int userId, int intendedMinutes) async {
    http.Response? response;
    try {
      response = await makeHttpRequest(
        '${APIPath.path}/bookings',
        method: 'POST',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'date': date,
          'carId': carId,
          'userId': userId,
          'intendedMinutes': intendedMinutes,
        }),
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }

  Future<String?> getQrCode(int bookingId) async {
    String apiUrl = "${APIPath.path}/booking-qrcode/$bookingId";
    try {
      var response = await makeHttpRequest(apiUrl);
      if (response.statusCode == 200) {
        //Generate QR-Code
        var data = {'bookingId': bookingId};
        var qrCodeResponse =
            QrCodeResponseModel.fromJson(jsonDecode(response.body));
        if (qrCodeResponse.isGenerating == null) {
          var response = await makeHttpRequest("$apiUrl/generate-qrcode",
              method: 'PUT', body: data);
          if (response.statusCode == 200) {
            var qrCodeResponse =
                QrCodeResponseModel.fromJson(jsonDecode(response.body));
            return qrCodeResponse.qrCode;
          }
        } else if (qrCodeResponse.isGenerating == true) {
          return qrCodeResponse.qrCode;
        } else {
          return null;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
