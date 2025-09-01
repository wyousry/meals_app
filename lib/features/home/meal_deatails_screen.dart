import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/assets.dart';
import 'package:meals_app/features/home/data/db_helper.dart';
import 'package:meals_app/features/home/data/meal_model.dart';

class MealDetailsScreen extends StatefulWidget {
  final int mealId;

  const MealDetailsScreen({super.key, required this.mealId});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  MealModel? meal;

  @override
  void initState() {
    super.initState();
    _loadMeal();
  }

  Future<void> _loadMeal() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'meals',
      where: 'id = ?',
      whereArgs: [widget.mealId],
    );

    if (result.isNotEmpty) {
      setState(() {
        meal = MealModel.fromMap(result.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (meal == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          meal!.name,
          style: TextStyle(color: AppColor.secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal!.imageUrl,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AssetsData.salad,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal!.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 18,
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        meal!.time,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        size: 18,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        meal!.rate.toString(),
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "${meal!.calories} Calories",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    meal!.description,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
