import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/bottom_navigation_bar/tabs/add_meal/widget/custom_text_field.dart';
import 'package:meals_app/features/home/data/db_helper.dart';
import 'package:meals_app/features/home/data/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  Future<void> _saveMeal() async {
    if (_formKey.currentState!.validate()) {
      final meal = MealModel(
        name: nameController.text,
        imageUrl: imageUrlController.text,
        description: descriptionController.text,
        calories: double.tryParse(caloriesController.text) ?? 0.0,
        time: timeController.text,
        rate: double.tryParse(rateController.text) ?? 0.0,
      );

      await DatabaseHelper.instance.insertMeal(meal);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Meal_saved_successfully!".tr())));

      nameController.clear();
      imageUrlController.clear();
      descriptionController.clear();
      caloriesController.clear();
      timeController.clear();
      rateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add_meal".tr())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  label: "meal_name".tr(),
                  validator: (value) =>
                      value!.isEmpty ? "please_enter_meal_name".tr() : null,
                ),
                CustomTextField(
                  controller: imageUrlController,
                  label: "image_url".tr(),
                  validator: (value) =>
                      value!.isEmpty ? "Please_enter_image_URL".tr() : null,
                ),
                CustomTextField(
                  controller: descriptionController,
                  label: "description".tr(),
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? "Please_enter_description".tr() : null,
                ),
                CustomTextField(
                  controller: caloriesController,
                  label: "calories".tr(),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Please_enter_calories".tr() : null,
                ),
                CustomTextField(
                  controller: timeController,
                  label: "time".tr(),
                  validator: (value) =>
                      value!.isEmpty ? "Please_enter_time".tr() : null,
                ),
                CustomTextField(
                  controller: rateController,
                  label: "rate".tr(),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Please_enter_rate".tr() : null,
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.w,
                      vertical: 12.h,
                    ),
                    fixedSize: Size(327.w, 52.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  onPressed: _saveMeal,
                  child: Text(
                    "save".tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
