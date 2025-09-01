import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void changeLanguage() {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AssetsData.soup),
          ),

          const SizedBox(height: 20),

          const Text(
            "Wafaa Yousry",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.secondaryColor,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "01156374361",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.blue),
                  title: const Text("edit_profile").tr(),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.green),
                  title: const Text("settings").tr(),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.black),
                  title: const Text("language").tr(),
                  onTap: () {
                    changeLanguage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text("logout").tr(),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
