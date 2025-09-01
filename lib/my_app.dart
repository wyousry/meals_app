import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meals_app/core/app_router.dart';
import 'package:meals_app/features/bottom_navigation_bar/home_layers.dart';
import 'package:meals_app/features/bottom_navigation_bar/tabs/add_meal/add_meal.dart';
import 'package:meals_app/features/bottom_navigation_bar/tabs/profile_screen.dart';
import 'package:meals_app/features/home/home_page.dart';
import 'package:meals_app/features/onboarding/onboarding_screen.dart';

import 'package:meals_app/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
            initialRoute: AppRouter.splash,
      routes: {
        AppRouter.splash: (context) => const SplashScreen(),
        AppRouter.onboarding: (context) => const OnboardingScreen(),
        AppRouter.home: (context) => const HomeScreen(),
        AppRouter.addMeal: (context) => const AddMealScreen(),
        AppRouter.profile: (context) => const ProfileScreen(),
        AppRouter.homeLayers: (context) => const HomeLayers(),
      },
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
        );
      },
    );
  }
}
