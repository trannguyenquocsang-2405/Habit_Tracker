 class AuthService {
 static const String baseUrl = "http://192.168.1.8:8080/api";
 
 //Future gọi API cần thời gian chờ (bool để biết fail hay success)
 Future<bool> login(String email, String password) async {
  final response = await http.post(
    Uri.parse("$baseUrl/login"),
    headers: {"Content-Type": "application/json"},
    // jsonEncode chuyển Map → JSON
    body: jsonEncode({
      "email": email,
      "password": password,
    })
  );

  if (response.statusCode == 200) {

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
 
}

