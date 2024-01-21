import "package:get/get.dart";
import 'package:flutter/services.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:watchhub/features/personalization/models/user_model.dart";
import "package:watchhub/utils/exceptions/firebase_exceptions.dart";
import "package:watchhub/utils/exceptions/format_exceptions.dart";
import "package:watchhub/utils/exceptions/platform_exceptions.dart";

// Repository class for user related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user darta to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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


  /// Function to fetch user details based on user id

  /// Function to update user data on firestore

  /// Update any field in specific Users collection

}
