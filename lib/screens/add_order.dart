import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddOrderScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order qo‘shish")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController),
            TextField(controller: priceController),
            ElevatedButton(
              onPressed: () async {
                await ApiService.addOrder(
                  titleController.text,
                  int.parse(priceController.text),
                );
              },
              child: const Text("Saqlash"),
            ),
          ],
        ),
      ),
    );
  }
}
