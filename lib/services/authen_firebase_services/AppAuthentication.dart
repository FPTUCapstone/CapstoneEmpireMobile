// ignore_for_file: file_names

import 'dart:developer';

import 'package:empiregarage_mobile/application_layer/screens/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../application_layer/screens/login/login_screen.dart';
import '../../application_layer/screens/login/otp_confirmation.dart';

class AppAuthentication {
  AppAuthentication();

  Future<void> getOTP(
      BuildContext context, String vietNamCode, var phoneNumber) async {
    try {
      return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: vietNamCode + phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            if (kDebugMode) {
              print('The provided phone number is not valid.');
            }
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          LoginScreen.verify = verificationId;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OtpConfirmation()),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log("Can not get OTP");
    }
  }

  Future<void> confirmOTP(
      String otpCode, FirebaseAuth auth, BuildContext context) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginScreen.verify, smsCode: otpCode);
      // Sign the user in (or link) with the credential
      // String phoneNumber  = "+84774512911";
      // var loginAuthen = await LoginService().LoginPhoneAuthentication(phoneNumber);

      await auth.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const UserProfile(
                  userId: 2,
                )),
      );
    } catch (e) {
      log("Wrong OTP");
    }
  }

  Future<void> siginWithGoogle(FirebaseAuth auth, BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const UserProfile(
                  userId: 2,
                )),
      );
    } catch (e) {
      log("Fail to Login with Google");
    }
  }
}
