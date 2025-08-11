import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meals_app/core/app_color.dart';

import 'onboarding_data.dart';
import 'onboarding_page.dart';
import 'onboarding_controls.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;
  final CarouselSliderController sliderController = CarouselSliderController();

  void changeLanguage() {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }

  void goToNextPage() {
    if (pageIndex < onboardingTitles.length - 1) {
      sliderController.nextPage();
    } else {
      debugPrint("Go to Home or Login screen");
    }
  }

  void skipOnboarding() {
    debugPrint("Skip onboarding");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: changeLanguage,
            icon: const Icon(Icons.language),
            color: Colors.black,
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(24.sp),
              padding: MaterialStateProperty.all(EdgeInsets.all(8.w)
            ), 
            )
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pngs/background_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              bottom: 30.h,
              right: 30.w,
              left: 30.w,
              child: Container(
                height: 400.h,
                width: 311.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: sliderController,
                      options: CarouselOptions(
                        height: 300.h,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                      ),
                      items: List.generate(onboardingTitles.length, (index) {
                        return OnboardingPage(
                          title: onboardingTitles[index],
                          subtitle: onboardingSubtitles[index],
                          pageIndex: index,
                          totalPages: onboardingTitles.length,
                          currentPage: pageIndex,
                          onDotTap: (dotIndex) {
                            sliderController.animateToPage(dotIndex);
                          },
                        );
                      }),
                    ),

                    OnboardingControls(
                      isLastPage: pageIndex == onboardingTitles.length - 1,
                      onNext: goToNextPage,
                      onSkip: skipOnboarding,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
