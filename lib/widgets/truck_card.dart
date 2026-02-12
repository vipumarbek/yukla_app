import 'package:flutter/material.dart';

class TruckCard extends StatelessWidget {
  final String title;
  final String size;
  final String image;
  final bool selected;
  final VoidCallback onTap;

  const TruckCard({
    super.key,
    required this.title,
    required this.size,
    required this.image,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.green.shade100 : null,
      child: ListTile(
        leading: Image.asset(image, width: 60),
        title: Text(title),
        subtitle: Text("O‘lcham: $size"),
        trailing: selected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : ElevatedButton(
                onPressed: onTap,
                child: const Text("Tanlash"),
              ),
      ),
    );
  }
}
