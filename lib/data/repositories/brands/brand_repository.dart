import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:watchhub/features/shop/models/brand_model.dart";
import "package:watchhub/utils/exceptions/firebase_exceptions.dart";
import "package:watchhub/utils/exceptions/format_exceptions.dart";
import "package:watchhub/utils/exceptions/platform_exceptions.dart";

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;


  // Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
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

  // Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandId form the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract Brand Name and other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;

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