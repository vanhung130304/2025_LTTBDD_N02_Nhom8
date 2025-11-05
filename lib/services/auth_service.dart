import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _keyEmail = 'user_email';
  static const _keyPassword = 'user_password';
  static const _keyName = 'user_name';

  // Đăng ký tài khoản
  static Future<bool> register(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // Nếu email đã tồn tại -> báo lỗi
    if (prefs.getString(_keyEmail) == email) return false;

    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
    return true;
  }

  // Đăng nhập
  static Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyEmail);
    final savedPassword = prefs.getString(_keyPassword);

    return savedEmail == email && savedPassword == password;
  }

  // Lấy thông tin người dùng
  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName),
      'email': prefs.getString(_keyEmail),
    };
  }

  // Đăng xuất
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
