import 'dart:convert';
import 'dart:developer';

import '../../common/api_part.dart';
import '../../common/jwt_interceptor.dart';
import '../../models/response/orderservices.dart';
import 'package:http/http.dart' as http;

class OrderServices {
  Future<OrderServicesResponseModel?> getOrderServicesById(
      int servicesId) async {
    String apiUrl = "${APIPath.path}/order-services/$servicesId";
    try {
      var response = await makeHttpRequest(apiUrl);
      if (response.statusCode == 200) {
        dynamic jsonObject = json.decode(response.body);
        OrderServicesResponseModel order =
            OrderServicesResponseModel.fromJson(jsonObject);
        return order;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<http.Response?> confirmOrder(
      int orderServiceId, int orderServiceStatusId) async {
    http.Response? response;
    try {
      response = await makeHttpRequest(
        '${APIPath.path}/order-service-status-logs',
        method: 'POST',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'orderServiceId': orderServiceId,
          'orderServiceStatusId': orderServiceStatusId
        }),
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
