import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yukla_app/services/api_service.dart';
import 'package:yukla_app/screens/home_screen.dart';
import 'package:yukla_app/screens/admin_screen.dart';


class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: const Center(
        child: Text("Siz ADMIN sifatida kirdingiz"),
      ),
    );
  }
}
