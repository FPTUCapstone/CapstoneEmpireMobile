import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empiregarage_mobile/common/api_part.dart';
import 'package:empiregarage_mobile/models/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  NotificationService() {}

  Future<String?> getToken() async {
    var _token = await FirebaseMessaging.instance.getToken();
    print(_token);
    return _token;
  }

  Future<void> saveToken(String? uuid) async {
    var _token = await getToken();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .add({
          'userId': uuid,
          'fcmToken': _token,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<http.Response?> sendNotification(
      NotificationModel notificationModel) async {
    var deviceId = await getToken();
    log(deviceId.toString());
    if (deviceId == null) {
      return http.Response('Bad request', 400);
    }
    notificationModel.deviceId = deviceId;
    http.Response? response;
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      response = await http.post(
        Uri.parse('${APIPath.path}/notifications/send'),
        headers: headers,
        body: json.encode(notificationModel.toJson()),
      );
      if (response.statusCode == 200) {
        log('Notification sent successfully!');
      } else {
        log('Error sending notification: ${response.reasonPhrase}');
      }
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
