import 'package:get_storage/get_storage.dart';

class WatchHubLocalStorage {
  
  late final GetStorage _storage; 

  // Singleton instance
  static WatchHubLocalStorage? _instance;

  WatchHubLocalStorage._internal();

  factory WatchHubLocalStorage.instance() {
    _instance ??= WatchHubLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = WatchHubLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic method to save data
  Future<void> saveData<WH>(String key, WH value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  WH? readData<WH>(String key) {
    return _storage.read<WH>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
   await _storage.remove(key); 
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}