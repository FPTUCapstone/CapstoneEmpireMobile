

import 'dart:convert';

import 'package:empiregarage_mobile/models/symptoms.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../common/api_part.dart';

class SymptomsService{
  
  Future<List<SymptonResponseModel>?> fetchListSymptoms() async{
    String apiUrl = '${APIPath.path}/symptoms';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonArray = json.decode(response.body);
      List<SymptonResponseModel> listSymtomps = [];
      for (var jsonObject in jsonArray) {
        listSymtomps.add(SymptonResponseModel.fromJson(jsonObject));
      }
      return listSymtomps;
    } else {
      // If the server returns an error, then throw an exception.
      if (kDebugMode) {
        print("Failed to load item, status code: ${response.statusCode}");
      }
      return null;
    }
  }
}