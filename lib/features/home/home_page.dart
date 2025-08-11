import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/meal_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = [
      {
        "title": "breakfast_smoothie".tr(),
        "calories": "350_calories".tr(),
        "image": "assets/pngs/breakfast_smoothie.png",
      },
      {
        "title": "breakfast_smoothie".tr(),
        "calories": "350_calories".tr(),
        "image": "assets/pngs/breakfast_smoothie.png",
      },
      {
        "title": "chicken_salad".tr(),
        "calories": "600_calories".tr(),
        "image": "assets/pngs/salad.png",
      },
      {
        "title": "vegetable_soup".tr(),
        "calories": "450_calories".tr(),
        "image": "assets/pngs/soup.png",
      },
      {
        "title": "breakfast_smoothie".tr(),
        "calories": "350_calories".tr(),
        "image": "assets/pngs/breakfast_smoothie.png",
      },
      {
        "title": "breakfast_smoothie".tr(),
        "calories": "350_calories".tr(),
        "image": "assets/pngs/breakfast_smoothie.png",
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "my_meals".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "my_meals".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return MealItem(
                      title: meal["title"]!,
                      calories: meal["calories"]!,
                      imagePath: meal["image"]!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_box_outlined),
            label: "add_meal".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "profile".tr(),
          ),
        ],
      ),
    );
  }
}
