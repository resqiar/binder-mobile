import 'package:binder/screens/home_screen.dart';
import 'package:binder/screens/login_screen.dart';
import 'package:binder/service/secure_storage_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: SecureStorage().readData("token"),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != "") {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      )
    );
  }
}