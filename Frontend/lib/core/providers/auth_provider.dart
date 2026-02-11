import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  // Mặc định trạng thái đăng xuất
  bool _isLoggedIn = false;
  bool _isLoading = true; // để chờ kiểm tra token

  // Getter để kiểm tra trạng thái đăng nhập, chỉ sửa trạng thái thông qua hàm
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  AuthProvider() {
    checkLoginStatus(); // Chạy ngay khi app mở
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      _isLoggedIn = true;
    }

    _isLoading = false;
    notifyListeners(); // Báo cho UI cập nhật
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners(); //Báo cho UI cập nhật
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Xóa token khỏi SharedPreferences
    _isLoggedIn = false;
    notifyListeners(); //Báo cho UI cập nhật
  }
}
