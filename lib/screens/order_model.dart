class Order {
  final String id;
  final String title;
  final int price;

  Order({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
    );
  }
}
