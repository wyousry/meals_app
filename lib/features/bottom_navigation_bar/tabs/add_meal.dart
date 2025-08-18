import 'package:flutter/material.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea (
      child: Center(
        child: Text(
          "Add Meal Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold ,color: Colors.black),
        ),
      ),
    );
  }
}