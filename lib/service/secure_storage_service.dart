import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<String> readData(String key) async {
    String value = await storage.read(key: key) ?? "";
    return value;
  }
}