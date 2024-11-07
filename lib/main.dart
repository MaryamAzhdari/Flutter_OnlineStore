import 'package:flutter/material.dart';
import 'package:online_store/theme.dart';
import 'package:online_store/views/screens/authentication/login_screen.dart';
import 'services/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = ThemeService();
    //return Consumer<ThemeService>(builder: (context, themeService, child) {
    return MaterialApp(
      themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: LoginScreen(),
    );
    //});
  }
}
