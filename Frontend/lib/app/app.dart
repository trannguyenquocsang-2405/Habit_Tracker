import 'package:flutter/material.dart';
import 'package:habit_tracker/core/providers/auth_provider.dart';
import 'package:habit_tracker/features/auth/login.dart';
import 'package:habit_tracker/features/home/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'Habit Tracker',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: auth.isLoggedIn ? HomeScreen() : LoginScreen(),
          );
        },
      ),
    );
  }
}
