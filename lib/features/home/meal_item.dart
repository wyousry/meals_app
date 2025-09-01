import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/assets.dart';

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
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(
          imagePath,
          width: 50.w,
          height: 50.h,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              AssetsData.salad, 
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        calories,
        style: const TextStyle(color: AppColor.primaryColor),
      ),
    );
  }
}
