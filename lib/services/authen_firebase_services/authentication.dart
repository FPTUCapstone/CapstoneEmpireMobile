// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:empiregarage_mobile/application_layer/screens/user_profile/profile.dart';
import 'package:empiregarage_mobile/common/jwt_interceptor.dart';
import 'package:empiregarage_mobile/models/response/loginresponse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../application_layer/screens/login/login_screen.dart';
import '../../application_layer/screens/login/otp_confirmation.dart';
import '../../common/api_part.dart';

import 'package:http/http.dart' as http;

// ignore: depend_on_referenced_packages

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
      if (kDebugMode) {
        print("Can not get OTP");
      }
    }
  }

  Future<void> confirmOTP(
      String otpCode, FirebaseAuth auth, BuildContext context) async {
    try {
      // Create a PhoneAuthCredential with the code
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //     verificationId: LoginScreen.verify, smsCode: otpCode);
      // // Sign the user in (or link) with the credential
      // var userRecord = await auth.signInWithCredential(credential);
      // if (userRecord.user == null) {
      //   log("Not found user");
      //   return;
      // }
      // var response =
      //     await signInRequestBE(userRecord.user!.phoneNumber.toString());
      var response = await signInRequestBE('%2B84929034687');
      if (response == null) {
        log("Unauthorized");
        return;
      }

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserProfile(
                  userId: response.id,
                )),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
      if (kDebugMode) {
        print("Fail to Login with Google");
      }
    }
  }

  Future<LoginResponseModel?> signInRequestBE(String phone) async {
    log('Signing...');
    var url = Uri.parse(
        "${APIPath.path}/authentications/phone-method/login?phone=$phone");
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      try {
        var user = LoginResponseModel.fromJson(jsonDecode(response.body));
        log('Sign in success with user ${user.name}');
        await saveJwtToken(user.accessToken);
        return user;
      } on Exception catch (_) {
        var jsonBody = jsonDecode(response.body);
        log(jsonBody['value']);
        return null;
      }
    } else {
      if (kDebugMode) {
        print('Signin failed');
      }
    }
    return null;
  }
}
