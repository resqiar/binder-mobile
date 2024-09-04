import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<void> writeData(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  Future<String> readData(String key) async {
    String value = await storage.read(key: key) ?? "";
    return value;
  }
}