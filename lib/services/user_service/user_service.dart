import 'dart:convert';

import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/response/user.dart';
import 'package:flutter/foundation.dart';

// ignore: depend_on_referenced_packages

import '../../common/api_part.dart';

class UserService {
  Future<UserResponseModel?> getUserById(userId) async {
    String apiUrl = '${APIPath.path}/users/$userId';
    final response = await makeHttpRequest('$apiUrl?id=$userId');
    if (response.statusCode == 200) {
      var user = UserResponseModel.fromJson(jsonDecode(response.body));
      return user;
    } else {
      if (kDebugMode) {
        print("Failed to load item, status code: ${response.statusCode}");
      }
      return null;
    }
  }
}
