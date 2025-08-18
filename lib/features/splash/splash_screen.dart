import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstOpen();
  }

    Future<void> _checkFirstOpen() async {
    await Future.delayed(const Duration(seconds: 2)); 
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, AppRouter.onboarding);
    } else {
      Navigator.pushReplacementNamed(context, AppRouter.homeLayers);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('------build');
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(child: Lottie.asset('assets/animations/Cooking.json')),
    );
  }
}
