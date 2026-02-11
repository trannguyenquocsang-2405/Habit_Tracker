import 'package:flutter/material.dart';
import 'package:habit_tracker/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic
              context.read<AuthProvider>().logout();
            },
          ),
        ],
      ),
      body: Center(child: const Text('Chào mừng bạn đến với Habit Tracker!')),
    );
  }
}
