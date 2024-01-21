import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watchhub/features/authentication/screen/login/login.dart';
import 'package:watchhub/features/authentication/screen/onboarding/onboarding.dart';
import 'package:watchhub/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:watchhub/utils/exceptions/firebase_exceptions.dart';
import 'package:watchhub/utils/exceptions/format_exceptions.dart';
import 'package:watchhub/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    // Local storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true  ? Get.offAll(() => const LoginScreen()) 
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* -------------------------------- Emain & Password sign-in ----------------------------- */

  /// [EmailAuthentication] - SignIn
   
  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw WHFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw WHFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const WHFormatException();
    } on PlatformException catch (e) {
      throw WHPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }
   
  /// [EmailAuthentication] - ReAuthenticate User
   
  /// [EmailAuthentication] - Mail Verification
  
  /// [EmailAuthentication] - Forget Password

  /* -------------------------------- Social sign-in ----------------------------- */

  /// [GoogleAuthentication] - GOOGLE
 
  /// [FacebookAuthentication] - FACEBOOK
   
  /* -------------------------------- logout & delete user ----------------------------- */
  
  /// [LogoutUser] - Valid for any authentication
   
  /// [DeleteUser] - Remove user Auth and Firebase account
   
}