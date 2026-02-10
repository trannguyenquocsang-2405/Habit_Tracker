import 'package:flutter/material.dart';
import 'package:habit_tracker/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  // Login screen implementation
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle login logic
            context.read<AuthProvider>().login();
          },
          child: const Text('Đăng nhập'),
        ),
      ),
    );
  }
}
