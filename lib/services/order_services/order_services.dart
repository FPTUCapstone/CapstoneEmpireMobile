import 'dart:convert';
import 'dart:developer';

import '../../common/api_part.dart';
import '../../common/jwt_interceptor.dart';
import '../../models/response/orderservices.dart';

class OrderServices{
  Future<OrderServicesResponseModel?> getOrderServicesById(int servicesId) async {
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
}