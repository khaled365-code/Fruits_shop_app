import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("exception in FirebaseAuthService.createUserWithEmailAndPassword and the code is ${e.code} ");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور المقدمة ضعيفة جدًا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'يوجد حساب بالفعل لهذا البريد الإلكتروني');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالانترنت الرجاء المحاوله مرة اخرى');
      } else {
        throw CustomException(
            message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا');
      }
    } catch (e) {
      throw CustomException(
          message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا');
    }
  }

  Future<User> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("exception in FirebaseAuthService.loginWithEmailAndPassword and the code is ${e.code} ");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'لا يوجد حساب بالفعل لهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمه المرور أو البريد الإلكتروني غير صحيح');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'كلمه المرور أو البريد الإلكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالانترنت الرجاء المحاوله مرة اخرى');
      } else {
        throw CustomException(
            message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا');
      }
    } catch (e) {
      throw CustomException(
          message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا');
    }
  }

  Future<User> loginWithGoogle() async {
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

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async 
  {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}
}
