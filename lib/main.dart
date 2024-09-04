import 'package:binder/screens/home_screen.dart';
import 'package:binder/screens/login_screen.dart';
import 'package:binder/service/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData && snapshot.data != "") {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      )
    );
  }
}