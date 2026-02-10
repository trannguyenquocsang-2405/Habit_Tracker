import 'package:flutter/material.dart';
import 'package:habit_tracker/features/auth/login.dart';
import 'package:habit_tracker/features/home/home.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
  };
}
