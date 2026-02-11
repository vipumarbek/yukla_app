import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService api = ApiService();
  List orders = [];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final productController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    final data = await api.getOrders();
    setState(() {
      orders = data;
    });
  }

  Future<void> addOrder() async {
    await api.createOrder(
      nameController.text,
      phoneController.text,
      productController.text,
    );

    nameController.clear();
    phoneController.clear();
    productController.clear();

    loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Ism")),
            TextField(controller: phoneController, decoration: const InputDecoration(labelText: "Telefon")),
            TextField(controller: productController, decoration: const InputDecoration(labelText: "Mahsulot")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addOrder,
              child: const Text("Yangi order qo‘shish"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    child: ListTile(
                      title: Text(order['name'] ?? ''),
                      subtitle: Text(order['product'] ?? ''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
