import 'dart:convert';
import 'dart:developer';

import 'package:empiregarage_mobile/models/request/order_service_detail_request_model.dart';

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

  Future<http.Response?> putConfirmOrder(
      int orderServiceId, List<OrderServiceDetails> orderServiceDetails) async {
    http.Response? response;
    try {
      final List<Map<String, dynamic>> jsonList =
          orderServiceDetails.map((order) => order.toJsonLesser()).toList();
      response = await makeHttpRequest(
        '${APIPath.path}/order-services/$orderServiceId/confirm',
        method: 'PUT',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'orderServiceDetails': jsonList,
          'paymentMethod': 2
        }),
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }

  Future<http.Response?> putConfirmPaidOrder(
      int orderServiceId, List<OrderServiceDetails> orderServiceDetails) async {
    http.Response? response;
    try {
      final List<Map<String, dynamic>> jsonList =
          orderServiceDetails.map((order) => order.toJsonLesser()).toList();
      response = await makeHttpRequest(
        '${APIPath.path}/order-services/$orderServiceId/confirm',
        method: 'PUT',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'orderServiceDetails': jsonList,
          'paymentMethod': 2
        }),
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }

  Future<http.Response?> insertOrderDetail(int id, int paymentMethodId,
      List<OrderServiceDetailRequestModel> listOrderServiceDetails) async {
    http.Response? response;
    try {
      final jsonBody = jsonEncode(
          listOrderServiceDetails.map((order) => order.toJson()).toList());
      response = await makeHttpRequest(
        '${APIPath.path}/order-services/$id/order-service-details?paymentMethodId=$paymentMethodId',
        method: 'PUT',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
