import 'dart:convert';

import 'package:empiregarage_mobile/models/user.dart';
import 'package:flutter/foundation.dart';

import '../../common/api_part.dart';
import 'package:http/http.dart' as http;

class UserService{

  Future<UserResponseModel?> getUserById(userId) async{
    String apiUrl = '${APIPath.path}/users/$userId';

    final response = await http.get(Uri.parse('$apiUrl?id=$userId'));

    if(response.statusCode == 200){
      var user = UserResponseModel.fromJson(jsonDecode(response.body));
      return user;
    }
    else{
      if(kDebugMode){
        print("Failed to load item, status code: ${response.statusCode}");
      }
       return null;
    }
  }

  
}