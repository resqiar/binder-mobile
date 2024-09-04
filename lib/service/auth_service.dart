import 'dart:convert';

import 'package:binder/screens/home_screen.dart';
import 'package:binder/service/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ["email"],
);

Future<void> handleSignIn(BuildContext context) async {
  try {
    final account = await _googleSignIn.signIn();

    // sign in successful
    if (account != null) {
      // get the token
      final auth = await account.authentication;
      final accessToken = auth.accessToken;

      if (accessToken != null) {
        final String baseURL = dotenv.get("SERVER_URL");

        // exchange it on the server and get JWT Token
        final response = await http.post(
          Uri.parse("$baseURL/mobile/register"), 
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: jsonEncode(
            <String, String>{
              "token": accessToken,
            },
          )
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          String token = TokenResponse.fromJson(json).token;

          // save it to secure storage
          await SecureStorage().writeData("token", token);

          // redirect to main page
          if (context.mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        } else {
          var json = jsonDecode(response.body);
          String error = ErrorResponse.fromJson(json).message;
          print(error);
          Fluttertoast.showToast(msg: error);
        }
      }
    }
  } catch (e) {
    print(e);
    Fluttertoast.showToast(
        msg: "Something went wrong, please try again later.");
  }
}

class TokenResponse {
  final String token;

  TokenResponse({required this.token});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      token: json['token'],
    );
  }
}

class ErrorResponse {
  final String message;

  ErrorResponse({required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['error'],
    );
  }
}