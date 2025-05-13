import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'fooding_user_session_data_key';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    print('Token saved securely.');
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);
    if (token != null) {
      print('Token retrieved.');
    } else {
      print('No token found.');
    }
    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    print('Token deleted.');
  }
}
