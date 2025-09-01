import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/data/db_helper.dart';
import 'package:meals_app/features/home/data/meal_model.dart';
import 'package:meals_app/features/home/meal_deatails_screen.dart';
import 'package:meals_app/features/home/meal_item.dart';
import 'home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MealModel> meals = [];

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final data = await DatabaseHelper.instance.getMeals();
    setState(() {
      meals = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyMealsHeader(),
          SizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "my_meals".tr(),
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.secondaryColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),

          Expanded(
            child: meals.isEmpty
                ? Center(child: Text("No_meals_added_yet".tr()))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  MealDetailsScreen(mealId: meal.id!),
                            ),
                          );
                        },
                        child: MealItem(
                          title: meal.name,
                          calories: "${meal.calories} Calories",
                          imagePath: meal.imageUrl,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
