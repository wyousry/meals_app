import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/home_page.dart';

class OnboardingControls extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingControls({
    super.key,
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return isLastPage
        ? CircleAvatar(
            backgroundColor: AppColor.backgroundColor,
            radius: 30.r,
            child: IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onSkip,
                child: Text(
                  'skip'.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: onNext,
                child: Text(
                  'next'.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
  }
}
