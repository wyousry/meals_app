import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/assets.dart';
import 'package:meals_app/features/home/meal_item.dart';
import 'home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = [
      {
        "title": "breakfast_smoothie".tr(),
        "calories": "350_calories".tr(),
        "image": AssetsData.breakfastSmoothie,
      },
      {
        "title": "chicken_salad".tr(),
        "calories": "600_calories".tr(),
        "image": AssetsData.chickenSalad,
      },
      {
        "title": "vegetable_soup".tr(),
        "calories": "450_calories".tr(),
        "image": AssetsData.soup,
      },
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyMealsHeader(),
          SizedBox(height: 20.h),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "my_meals".tr(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.secondaryColor,
              ),
            ),
          ),
           SizedBox(height: 8.h),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          ),
        ],
      ),
    );
  }
}
