import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meals_app/core/app_color.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final int pageIndex;
  final int totalPages;
  final int currentPage;
  final Function(int) onDotTap;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pageIndex,
    required this.totalPages,
    required this.currentPage,
    required this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          title.tr(),
          style: TextStyle(
            fontSize: 32.sp,
            color: AppColor.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          subtitle.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.backgroundColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        DotsIndicator(
          dotsCount: totalPages,
          position: currentPage.toDouble(),
          onTap: onDotTap,
          decorator: DotsDecorator(
            size: Size(20.w, 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            color: Colors.grey,
            activeSize: Size(20.w, 8.h),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            activeColor: AppColor.backgroundColor,
          ),
        ),
      ],
    );
  }
}
