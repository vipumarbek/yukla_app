import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = 'Boshlanmadi';

  Future<void> _checkBackend() async {
    try {
      final res = await ApiService.testBackend();
      setState(() {
        result = res;
      });
    } catch (e) {
      setState(() {
        result = 'Xatolik: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backend test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkBackend,
              child: const Text('Backendni tekshir'),
            ),
          ],
        ),
      ),
    );
  }
}
