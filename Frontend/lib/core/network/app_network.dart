import 'dart:convert';
import 'package:http/http.dart' as http;

class AppNetwork {
  static const String baseUrl = 'https://api.example.com';

  Future<String> get(String endpoint) async {
    // Simulate a network request
    final res = await http.get(Uri.parse('$baseUrl$endpoint'));
    return jsonDecode(res.body);
  }
}
