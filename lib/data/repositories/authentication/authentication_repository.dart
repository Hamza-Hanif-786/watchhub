import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watchhub/data/repositories/user/user_repository.dart';
import 'package:watchhub/features/authentication/screen/login/login.dart';
import 'package:watchhub/features/authentication/screen/onboarding/onboarding.dart';
import 'package:watchhub/features/authentication/screen/signup/verify_email.dart';
import 'package:watchhub/navigation_menu.dart';
import 'package:watchhub/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:watchhub/utils/exceptions/firebase_exceptions.dart';
import 'package:watchhub/utils/exceptions/format_exceptions.dart';
import 'package:watchhub/utils/exceptions/platform_exceptions.dart';
import 'package:watchhub/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // if the user is logged in
      if(user.emailVerified) {

        // Initialise user specific storage
        await WatchHubLocalStorage.init(user.uid);

        // if the user email is verified navigate to home
        Get.offAll(() => const NavigationMenu());
      } else {
        // if the user email is not verified navigate to verify email
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it first time or not
      deviceStorage.read('IsFirstTime') != true  
        ? Get.offAll(() => const LoginScreen()) 
        : Get.offAll(() => const OnBoardingScreen());
    }

  }

  /* -------------------------------- Emain & Password sign-in ----------------------------- */

  /// [SignIn] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
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
   
  /// [Register] - Register
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
         
  /// [MailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  /// [ForgetPassword] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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
   
  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // Re authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

  /* -------------------------------- Social sign-in ----------------------------- */

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Authentication Flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create new credentials
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw WHFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw WHFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const WHFormatException();
    } on PlatformException catch (e) {
      throw WHPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
      return null;
    }
  }
 
  /// [FacebookAuthentication] - FACEBOOK
   
  /* -------------------------------- logout & delete user ----------------------------- */
  
  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
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
   
  /// [DeleteUser] - Remove user Auth and Firebase account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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


}