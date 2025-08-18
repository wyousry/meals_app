import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/assets.dart';

class MyMealsHeader extends StatefulWidget {
  const MyMealsHeader({super.key});

  @override
  State<MyMealsHeader> createState() => _MyMealsHeaderState();
}

class _MyMealsHeaderState extends State<MyMealsHeader> {
  int pageIndex = 0;
  final CarouselSliderController sliderController = CarouselSliderController();

  final List<String> images = [
    AssetsData.chicken,
    AssetsData.chickenSalad,
AssetsData.spaghettiWithChicken,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: sliderController,
          options: CarouselOptions(
            height: 200.h,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
          items: images.map((imagePath) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => sliderController.animateToPage(entry.key),
              child: Container(
                width: pageIndex == entry.key ? 12 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pageIndex == entry.key
                      ? AppColor.primaryColor
                      : Colors.grey.withOpacity(0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
