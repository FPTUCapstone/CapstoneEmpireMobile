import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/login/login_screen.dart';
import '../../screens/user_profile/profile.dart';

class AppAuthentication {
  AppAuthentication() {}

  Future<void> confirmOTP(
      String otpCode, FirebaseAuth auth, BuildContext context) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginScreen.verify, smsCode: otpCode);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserProfile()),
      );
    } catch (e) {
      print("Wrong OTP");
    }
  }
}
