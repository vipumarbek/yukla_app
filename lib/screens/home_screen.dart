import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backend test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final res = await ApiService.testBackend();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(res)),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Xatolik: $e')),
              );
            }
          },
          child: const Text('Backendni tekshir'),
        ),
      ),
    );
  }
}
