import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yuktidea/values/enumerations.dart';

class SecuredStorageHelper {
  SecuredStorageHelper._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static final SecuredStorageHelper instance = SecuredStorageHelper._();

// Read value
  Future<String?> getSecuredProperty(SecureStorageKeyEnum key) async {
    return await _storage.read(key: key.name);
  }

  // Delete value
  Future<void> removedSecuredProperty(SecureStorageKeyEnum key) async {
    await _storage.delete(key: key.name);
  }

  // Write value
  Future<void> setSecuredProperty(
      {required SecureStorageKeyEnum key, required String value}) async {
    await _storage.write(
      key: key.name,
      value: value,
    );
  }
}
