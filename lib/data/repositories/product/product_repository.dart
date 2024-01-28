import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:watchhub/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:watchhub/features/shop/models/product_model.dart';
import 'package:watchhub/utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // Firebase instance for database connection
  final _db = FirebaseFirestore.instance;


  // Get Limited Featured Products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(30).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  // Get All Featured Products
  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  // Get Products Based on the brands
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }


  // Upload dummy data to Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(WHFirebaseStorageService());

      // Loop through each category
      for (var product in products) {
        // Get ImageData link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product lis of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for(var image in product.images!) {
            // Get ImageData link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload Image and Get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        
        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get ImageData link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload Image and Get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store Products in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
