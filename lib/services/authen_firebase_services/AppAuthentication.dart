import 'package:empiregarage_mobile/application_layer/screens/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../application_layer/screens/login/login_screen.dart';
import '../../application_layer/screens/login/otp_confirmation.dart';

class AppAuthentication {
  AppAuthentication() {}

  Future<void> getOTP(BuildContext context, String vietNamCode, var phoneNumber) async{
    try{
      return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${vietNamCode + phoneNumber}',
        timeout: const Duration(seconds: 60),
        verificationCompleted:
            (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print(
                'The provided phone number is not valid.');
          }
        },
        codeSent:
            (String verificationId, int? resendToken) {
          LoginScreen.verify = verificationId;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                OtpConfirmation()),
          );
        },
        codeAutoRetrievalTimeout:
            (String verificationId) {},
      );
    }
    catch(e){
      print("Can not get OTP");
    }
  }

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
        MaterialPageRoute(builder: (context) => UserProfile(userId: 2,)),
      );
    } catch (e) {
      print("Wrong OTP");
    }
  }

  Future<void> siginWithGoogle(FirebaseAuth auth, BuildContext context) async{
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserProfile(userId: 2,)),
      );
    }
    catch(e){
      print("Fail to Login with Google");
    }


  }
}
