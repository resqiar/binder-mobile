import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 72),
                  child: Image(
                      image: AssetImage("assets/images/undraw_login.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Signing In",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "To enter the app, we need to identify who you are. Don’t worry—it’s as simple as clicking a few buttons, and no password is required.",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF2E58FF),
                          foregroundColor: Colors.white,
                          elevation: 5,
                        ),
                        icon: const Icon(Icons.g_mobiledata_rounded, size: 32),
                        label: const Text(
                          'Sign In using Google',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
