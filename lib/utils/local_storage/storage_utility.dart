import 'package:get_storage/get_storage.dart';

class WatchHubLocalStorage {
  static final WatchHubLocalStorage _instance = WatchHubLocalStorage._internal();
 
  factory WatchHubLocalStorage() {
    return _instance;
  }

  WatchHubLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<WATCHES>(String key, WATCHES value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  WATCHES? readData<WATCHES>(String key) {
    return _storage.read<WATCHES>(key);
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