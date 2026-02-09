Row(
  children: [
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () async {
        await PaymentService.updateOrder(order.id, {
          "title": "Yangilangan order",
          "price": order.price + 1000,
        });
      },
    ),
    IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () async {
        await PaymentService.deleteOrder(order.id);
      },
    ),
  ],
)
