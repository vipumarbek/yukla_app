import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selectedTruck = "Labo";

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  void createOrder() async {

    if (fromController.text.isEmpty ||
        toController.text.isEmpty ||
        dateController.text.isEmpty ||
        timeController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Barcha maydonlarni to‘ldiring")),
      );
      return;
    }

    bool success = await ApiService.createOrder({
      "truck": selectedTruck,
      "from": fromController.text,
      "to": toController.text,
      "date": dateController.text,
      "time": timeController.text,
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Buyurtma yuborildi")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Xatolik yuz berdi")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yukla App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              DropdownButton<String>(
                value: selectedTruck,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: "Labo", child: Text("Labo")),
                  DropdownMenuItem(value: "Bongo", child: Text("Bongo")),
                  DropdownMenuItem(value: "Isuzu 5T", child: Text("Isuzu 5T")),
                  DropdownMenuItem(value: "Isuzu 10T", child: Text("Isuzu 10T")),
                  DropdownMenuItem(value: "Fura", child: Text("Fura")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedTruck = value!;
                  });
                },
              ),

              TextField(
                controller: fromController,
                decoration: const InputDecoration(labelText: "Qayerdan"),
              ),

              TextField(
                controller: toController,
                decoration: const InputDecoration(labelText: "Qayerga"),
              ),

              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: "Sana"),
              ),

              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: "Vaqt"),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: createOrder,
                child: const Text("Buyurtma berish"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
