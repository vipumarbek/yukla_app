import 'package:flutter/material.dart';
import '../services/payment_service.dart';
import '../models/order.dart';
import '../widgets/order_card.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buyurtmalar")),
      body: FutureBuilder<List<Order>>(
        future: PaymentService.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Orderlar yo‘q"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              return OrderCard(order: snapshot.data![i]);
            },
          );
        },
      ),
    );
  }
}
