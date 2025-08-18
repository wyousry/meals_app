import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/bottom_navigation_bar/tabs/add_meal.dart';
import 'package:meals_app/features/bottom_navigation_bar/tabs/profile_screen.dart';
import 'package:meals_app/features/home/home_page.dart';

class HomeLayers extends StatefulWidget {
  const HomeLayers({super.key});

  @override
  State<HomeLayers> createState() => _HomeLayersState();
}

class _HomeLayersState extends State<HomeLayers> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AddMealScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _currentIndex == 0
                ?   "my_meals".tr()
                : _currentIndex == 1
                    ? "add_meal".tr()
                    : "profile".tr(),
          ),
          foregroundColor: AppColor.secondaryColor,
          centerTitle: true,
        ),
      
        body: _pages[_currentIndex],
      
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.secondaryColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
      ),
    );
  }
}
