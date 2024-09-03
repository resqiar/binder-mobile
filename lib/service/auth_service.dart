import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ["email"],
);

class GoogleAccountData {
  final String id;
  final String? displayName;
  final String email;
  final String? photoUrl;

  GoogleAccountData(this.id, this.displayName, this.email, this.photoUrl);
}

Future<void> handleSignIn() async {
  try {
    final account = await _googleSignIn.signIn();

    // sign in successful
    if (account != null) {
      // send data to the server to receive JWT token.
      final data = GoogleAccountData(account.id, account.displayName, account.email, account.photoUrl);
      print(data);
    }
  } catch (e) {
    print(e);
  }
}