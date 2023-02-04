import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
}
