import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // Mặc định trạng thái đăng xuất
  bool _isLoggedIn = false;

  // Getter để kiểm tra trạng thái đăng nhập, chỉ sửa trạng thái thông qua hàm
  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners(); //Báo cho UI cập nhật
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners(); //Báo cho UI cập nhật
  }
}
