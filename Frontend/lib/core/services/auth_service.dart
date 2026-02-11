import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "http://192.168.1.8:3000";

  //Future gọi API cần thời gian chờ (bool để biết fail hay success)
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      // jsonEncode chuyển Map → JSON
      body: jsonEncode({"email": email, "password": password}),
    );

    // print("STATUS: ${response.statusCode}");
    // print("BODY: ${response.body}");

    if (response.statusCode == 201) {
      // jsonDecode chuyển JSON → Map Dart
      final data = jsonDecode(response.body);

      // getInstance() → Mở kho lưu trữ ra
      // .then((prefs) {...}) → Chờ cho đến khi mở xong thì làm việc bên trong
      // setString() → Lưu chuỗi (token) vào SharedPreferences (bộ nhớ tạm của máy)
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString('token', data['token']);
      });
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
