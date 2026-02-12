import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/api_service.dart';
import 'home_screen.dart';
import 'admin_screen.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {

    final GoogleSignInAccount? account =
        await _googleSignIn.signIn();

    if (account != null) {

      String? role = await ApiService.googleLogin(
        account.displayName ?? "",
        account.email,
      );

      if (role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdminScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => signInWithGoogle(context),
          child: const Text("Google bilan kirish"),
        ),
      ),
    );
  }
}
