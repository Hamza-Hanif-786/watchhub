import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:watchhub/features/shop/models/banner_model.dart";
import "package:watchhub/utils/exceptions/firebase_exceptions.dart";
import "package:watchhub/utils/exceptions/format_exceptions.dart";
import "package:watchhub/utils/exceptions/platform_exceptions.dart";

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;



  // Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
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


  // Upload Banners to the Cloud FireStore

  
}