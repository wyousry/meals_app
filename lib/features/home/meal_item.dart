import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String calories;
  final String imagePath;

  const MealItem({
    super.key,
    required this.title,
    required this.calories,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        calories,
        style: const TextStyle(color: Colors.orange),
      ),
    );
  }
}
