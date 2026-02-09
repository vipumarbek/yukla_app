final success = await PaymentService.addOrder({
  "title": "Telefon buyurtma",
  "price": 15000,
});

if (success) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const SuccessScreen()),
  );
}
